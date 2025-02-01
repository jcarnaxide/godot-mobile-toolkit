package com.carnaxidegames.mobiletoolkit

import org.godotengine.godot.Godot
import org.godotengine.godot.plugin.GodotPlugin
import org.godotengine.godot.plugin.UsedByGodot

class MobileToolkitPlugin(godot: Godot) : GodotPlugin(godot) {
    override fun getPluginName() = "MobileToolkit"
    
    private val features = mutableMapOf<String, Feature>()
    
    override fun getPluginSignals(): Set<SignalInfo> {
        return features.values.flatMap { it.getSignals() }.toSet()
    }
    
    internal fun registerFeature(name: String, feature: Feature) {
        features[name] = feature
    }
    
    @UsedByGodot
    fun initialize(config: Dictionary) {
        features.values.forEach { it.initialize(config) }
    }
}