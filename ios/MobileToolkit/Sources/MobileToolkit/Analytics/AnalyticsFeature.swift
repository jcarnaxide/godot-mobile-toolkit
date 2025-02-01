import Foundation
import FirebaseAnalytics

@objc public class AnalyticsFeature: NSObject, Feature {
    private let logger = Logger(subsystem: "com.carnaxidegames.mobiletoolkit", category: "Analytics")
    
    public func initialize(_ config: [String: Any]) {
        logger.debug("Firebase Analytics initialized")
    }
    
    @objc public func setAnalyticsCollectionEnabled(_ enabled: Bool) {
        Analytics.setAnalyticsCollectionEnabled(enabled)
        NotificationCenter.default.post(
            name: enabled ? .analyticsEnabled : .analyticsDisabled,
            object: nil
        )
        logger.debug("Analytics collection \(enabled ? "enabled" : "disabled")")
    }
    
    @objc public func logAnalyticsEvent(_ name: String, parameters: [String: Any]) {
        Analytics.logEvent(name, parameters: parameters)
        NotificationCenter.default.post(
            name: .eventLogged,
            object: nil,
            userInfo: ["name": name, "parameters": parameters]
        )
        logger.debug("Logged event: \(name) with parameters: \(parameters)")
    }
    
    @objc public func resetAnalyticsData() {
        Analytics.resetAnalytics()
        logger.debug("Analytics data reset")
    }
}

// Notification names for signals
extension Notification.Name {
    static let analyticsEnabled = Notification.Name("analyticsEnabled")
    static let analyticsDisabled = Notification.Name("analyticsDisabled")
    static let eventLogged = Notification.Name("eventLogged")
}