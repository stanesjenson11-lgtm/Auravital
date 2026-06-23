package com.auravitals.app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class ScreenEventReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val prefs = context.getSharedPreferences("auravitals_metrics", Context.MODE_PRIVATE)
        when (intent.action) {
            Intent.ACTION_SCREEN_ON -> {
                prefs.edit()
                    .putLong("screen_started_at", System.currentTimeMillis())
                    .putInt("screen_sessions", prefs.getInt("screen_sessions", 0) + 1)
                    .apply()
            }
            Intent.ACTION_USER_PRESENT -> {
                prefs.edit()
                    .putInt("unlock_count", prefs.getInt("unlock_count", 0) + 1)
                    .apply()
            }
            Intent.ACTION_SCREEN_OFF -> {
                val startedAt = prefs.getLong("screen_started_at", 0L)
                if (startedAt > 0L) {
                    prefs.edit()
                        .putLong("screen_started_at", 0L)
                        .apply()
                }
            }
        }
    }
}
