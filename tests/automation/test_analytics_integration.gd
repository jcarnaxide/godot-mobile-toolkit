extends SceneTree

func _initialize():
    var analytics = MobileToolkitAnalytics.new()
    
    # Test basic initialization
    print("Testing analytics initialization...")
    assert(analytics != null)
    
    # Test enabling analytics
    print("Testing enabling analytics...")
    analytics.set_analytics_collection_enabled(true)
    await get_tree().create_timer(1.0).timeout
    
    # Test event logging
    print("Testing event logging...")
    analytics.log_event("automated_test", {
        "timestamp": Time.get_unix_time_from_system(),
        "test_run": true
    })
    
    quit()