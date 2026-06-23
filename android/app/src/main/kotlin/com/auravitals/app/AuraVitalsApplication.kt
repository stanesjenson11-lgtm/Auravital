package com.auravitals.app

import android.app.Application
import android.content.IntentFilter
import android.os.Build

class AuraVitalsApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        val filter = IntentFilter().apply {
            addAction(android.content.Intent.ACTION_SCREEN_ON)
            addAction(android.content.Intent.ACTION_SCREEN_OFF)
            addAction(android.content.Intent.ACTION_USER_PRESENT)
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            registerReceiver(ScreenEventReceiver(), filter, RECEIVER_NOT_EXPORTED)
        } else {
            registerReceiver(ScreenEventReceiver(), filter)
        }
    }
}
