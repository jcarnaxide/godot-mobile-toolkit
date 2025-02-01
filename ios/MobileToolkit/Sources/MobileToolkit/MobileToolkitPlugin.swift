import Foundation

@objc public class MobileToolkitPlugin: NSObject {
    private var features: [String: Feature] = [:]
    
    public override init() {
        super.init()
        registerFeature("analytics", AnalyticsFeature())
    }
    
    internal func registerFeature(name: String, feature: Feature) {
        features[name] = feature
    }
    
    @objc public func initialize(_ config: [String: Any]) {
        features.values.forEach { $0.initialize(config) }
    }
}