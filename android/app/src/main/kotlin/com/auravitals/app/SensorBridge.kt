package com.auravitals.app

import android.app.usage.UsageStatsManager
import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import java.time.Instant
import java.time.LocalDate
import java.time.ZoneId
import kotlin.math.max

class SensorBridge(private val context: Context) : SensorEventListener {
    private val prefs = context.getSharedPreferences("auravitals_metrics", Context.MODE_PRIVATE)
    private val sensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
    private val stepCounter = sensorManager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER)

    fun start() {
        rolloverIfNeeded()
        stepCounter?.let {
            sensorManager.registerListener(this, it, SensorManager.SENSOR_DELAY_NORMAL)
        }
    }

    fun snapshot(): Map<String, Any> {
        rolloverIfNeeded()
        val now = System.currentTimeMillis()
        val midnight = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant().toEpochMilli()
        val usage = collectUsage(midnight, now)
        val steps = max(0, prefs.getInt("steps_today", 0))
        val walking = prefs.getLong("walking_ms", 0L) / 60000L
        val sedentary = max(0L, ((now - midnight) / 60000L) - walking)

        return mapOf(
            "date" to LocalDate.now().toString(),
            "steps" to steps,
            "screenTimeMinutes" to usage.screenTimeMinutes,
            "unlockCount" to prefs.getInt("unlock_count", 0),
            "walkingMinutes" to walking.toInt(),
            "sedentaryMinutes" to sedentary.toInt(),
            "nightUsageMinutes" to usage.nightUsageMinutes,
            "appOpenFrequency" to usage.appOpenFrequency,
            "deviceInteractionFrequency" to prefs.getInt("screen_sessions", 0)
        )
    }

    override fun onSensorChanged(event: SensorEvent) {
        if (event.sensor.type != Sensor.TYPE_STEP_COUNTER) return
        rolloverIfNeeded()
        val absolute = event.values.firstOrNull()?.toInt() ?: return
        val baseline = prefs.getInt("step_baseline", -1)
        if (baseline < 0) {
            prefs.edit().putInt("step_baseline", absolute).apply()
            return
        }
        prefs.edit().putInt("steps_today", max(0, absolute - baseline)).apply()
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) = Unit

    private fun rolloverIfNeeded() {
        val today = LocalDate.now().toString()
        if (prefs.getString("metric_date", null) == today) return
        prefs.edit()
            .putString("metric_date", today)
            .putInt("step_baseline", -1)
            .putInt("steps_today", 0)
            .putInt("unlock_count", 0)
            .putInt("screen_sessions", 0)
            .putLong("walking_ms", 0L)
            .putLong("last_activity_update", System.currentTimeMillis())
            .apply()
    }

    private fun collectUsage(start: Long, end: Long): UsageAggregate {
        val manager = context.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val events = manager.queryEvents(start, end)
        val event = android.app.usage.UsageEvents.Event()
        var currentStart = 0L
        var totalForeground = 0L
        var nightUsage = 0L
        var appOpens = 0

        while (events.hasNextEvent()) {
            events.getNextEvent(event)
            when (event.eventType) {
                android.app.usage.UsageEvents.Event.ACTIVITY_RESUMED -> {
                    currentStart = event.timeStamp
                    appOpens += 1
                }
                android.app.usage.UsageEvents.Event.ACTIVITY_PAUSED,
                android.app.usage.UsageEvents.Event.ACTIVITY_STOPPED -> {
                    if (currentStart > 0 && event.timeStamp > currentStart) {
                        val duration = event.timeStamp - currentStart
                        totalForeground += duration
                        if (isNight(currentStart)) nightUsage += duration
                    }
                    currentStart = 0L
                }
            }
        }

        return UsageAggregate(
            screenTimeMinutes = (totalForeground / 60000L).toInt(),
            nightUsageMinutes = (nightUsage / 60000L).toInt(),
            appOpenFrequency = appOpens
        )
    }

    private fun isNight(timestamp: Long): Boolean {
        val hour = Instant.ofEpochMilli(timestamp).atZone(ZoneId.systemDefault()).hour
        return hour >= 22 || hour < 6
    }
}

data class UsageAggregate(
    val screenTimeMinutes: Int,
    val nightUsageMinutes: Int,
    val appOpenFrequency: Int
)
