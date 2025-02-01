class_name MobileToolkitAnalytics
extends Node

signal analytics_enabled
signal analytics_disabled
signal event_logged(event_name: String, parameters: Dictionary)

# The main plugin instance will set this when initializing features
var _plugin_singleton: Object

func set_analytics_collection_enabled(enabled: bool) -> void:
    if _plugin_singleton:
        _plugin_singleton.set_analytics_collection_enabled(enabled)

func log_event(event_name: String, parameters: Dictionary = {}) -> void:
    if _plugin_singleton:
        _plugin_singleton.log_analytics_event(event_name, parameters)

func reset_analytics_data() -> void:
    if _plugin_singleton:
        _plugin_singleton.reset_analytics_data()