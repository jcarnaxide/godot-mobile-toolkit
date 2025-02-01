package com.carnaxidegames.mobiletoolkit.analytics

import android.util.Log
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.analytics.ktx.analytics
import com.google.firebase.ktx.Firebase
import org.godotengine.godot.Dictionary
import org.godotengine.godot.plugin.SignalInfo
import org.godotengine.godot.plugin.UsedByGodot
import com.carnaxidegames.mobiletoolkit.Feature

class AnalyticsFeature : Feature {
    private val TAG = "GodotAnalytics"
    private lateinit var firebaseAnalytics: FirebaseAnalytics
    
    override fun initialize(config: Dictionary) {
        firebaseAnalytics = Firebase.analytics
        Log.d(TAG, "Firebase Analytics initialized")
    }
    
    override fun getSignals(): Set<SignalInfo> {
        return setOf(
            SignalInfo("analytics_enabled"),
            SignalInfo("analytics_disabled"),
            SignalInfo("event_logged", String::class.java, Dictionary::class.java)
        )
    }
    
    @UsedByGodot
    fun setAnalyticsCollectionEnabled(enabled: Boolean) {
        firebaseAnalytics.setAnalyticsCollectionEnabled(enabled)
        emitSignal(if (enabled) "analytics_enabled" else "analytics_disabled")
        Log.d(TAG, "Analytics collection ${if (enabled) "enabled" else "disabled"}")
    }
    
    @UsedByGodot
    fun logAnalyticsEvent(eventName: String, parameters: Dictionary) {
        val bundle = Bundle()
        // Convert Godot Dictionary to Android Bundle
        for ((key, value) in parameters) {
            when (value) {
                is String -> bundle.putString(key as String, value)
                is Int -> bundle.putInt(key as String, value)
                is Long -> bundle.putLong(key as String, value)
                is Double -> bundle.putDouble(key as String, value)
                is Boolean -> bundle.putBoolean(key as String, value)
            }
        }
        
        firebaseAnalytics.logEvent(eventName, bundle)
        emitSignal("event_logged", eventName, parameters)
        Log.d(TAG, "Logged event: $eventName with parameters: $parameters")
    }
    
    @UsedByGodot
    fun resetAnalyticsData() {
        firebaseAnalytics.resetAnalyticsData()
        Log.d(TAG, "Analytics data reset")
    }
}