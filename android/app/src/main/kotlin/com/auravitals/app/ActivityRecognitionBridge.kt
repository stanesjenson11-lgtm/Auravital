package com.auravitals.app

import android.Manifest
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.content.ContextCompat
import com.google.android.gms.location.ActivityRecognition

object ActivityRecognitionBridge {
    fun start(context: Context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q &&
            ContextCompat.checkSelfPermission(context, Manifest.permission.ACTIVITY_RECOGNITION) != PackageManager.PERMISSION_GRANTED
        ) {
            return
        }
        val intent = Intent(context, ActivityUpdatesReceiver::class.java)
        val pendingIntent = PendingIntent.getBroadcast(
            context,
            7201,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_MUTABLE
        )
        ActivityRecognition.getClient(context).requestActivityUpdates(5 * 60 * 1000L, pendingIntent)
    }
}
