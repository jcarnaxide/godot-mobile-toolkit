extends GDTest  # A custom test framework for Godot

var analytics: MobileToolkitAnalytics

func before_each():
    analytics = MobileToolkitAnalytics.new()
    add_child(analytics)
    
func after_each():
    analytics.queue_free()

func test_analytics_signals():
    var enabled_signal_received = false
    var event_logged_signal_received = false
    
    analytics.analytics_enabled.connect(func(): enabled_signal_received = true)
    analytics.event_logged.connect(func(name, params): event_logged_signal_received = true)
    
    analytics.set_analytics_collection_enabled(true)
    analytics.log_event("test_event", {"param": "value"})
    
    await get_tree().create_timer(0.1).timeout
    
    assert_true(enabled_signal_received, "Analytics enabled signal should be emitted")
    assert_true(event_logged_signal_received, "Event logged signal should be emitted")

func test_parameter_validation():
    # Test invalid parameter types
    var invalid_params = {"invalid": Vector2()}
    var error_caught = false
    
    try:
        analytics.log_event("test_event", invalid_params)
    catch:
        error_caught = true
    
    assert_true(error_caught, "Should catch invalid parameter type")