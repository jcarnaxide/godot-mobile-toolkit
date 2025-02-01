extends Node

@onready var analytics = $"/root/MobileToolkit/Analytics"

func _ready():
    # Enable analytics collection
    analytics.set_analytics_collection_enabled(true)
    
    # Connect to signals
    analytics.analytics_enabled.connect(_on_analytics_enabled)
    analytics.event_logged.connect(_on_event_logged)
    
    # Log a custom event
    analytics.log_event("game_started", {
        "level": 1,
        "difficulty": "normal",
        "character_class": "warrior"
    })

func _on_analytics_enabled():
    print("Analytics collection enabled")

func _on_event_logged(event_name: String, parameters: Dictionary):
    print("Logged event: ", event_name, " with parameters: ", parameters)