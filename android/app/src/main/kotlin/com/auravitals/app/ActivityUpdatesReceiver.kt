package com.auravitals.app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.google.android.gms.location.ActivityRecognitionResult
import com.google.android.gms.location.DetectedActivity

class ActivityUpdatesReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (!ActivityRecognitionResult.hasResult(intent)) return
        val result = ActivityRecognitionResult.extractResult(intent) ?: return
        val activity = result.mostProbableActivity ?: return
        val prefs = context.getSharedPreferences("auravitals_metrics", Context.MODE_PRIVATE)
        val now = System.currentTimeMillis()
        val last = prefs.getLong("last_activity_update", now)
        val elapsed = (now - last).coerceAtLeast(0L).coerceAtMost(15 * 60 * 1000L)

        if (activity.confidence >= 50 &&
            (activity.type == DetectedActivity.WALKING || activity.type == DetectedActivity.RUNNING || activity.type == DetectedActivity.ON_FOOT)
        ) {
            prefs.edit()
                .putLong("walking_ms", prefs.getLong("walking_ms", 0L) + elapsed)
                .putLong("last_activity_update", now)
                .apply()
        } else {
            prefs.edit().putLong("last_activity_update", now).apply()
        }
    }
}
