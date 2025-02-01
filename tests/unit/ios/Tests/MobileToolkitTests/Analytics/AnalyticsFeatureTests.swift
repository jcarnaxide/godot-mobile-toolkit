import XCTest
@testable import MobileToolkit
import FirebaseAnalytics

class AnalyticsFeatureTests: XCTestCase {
    var analyticsFeature: AnalyticsFeature!
    var mockAnalytics: MockAnalytics!
    
    override func setUp() {
        super.setUp()
        mockAnalytics = MockAnalytics()
        analyticsFeature = AnalyticsFeature()
        analyticsFeature.setAnalyticsForTesting(mockAnalytics)
    }
    
    func testAnalyticsCollectionEnabled() {
        analyticsFeature.setAnalyticsCollectionEnabled(true)
        XCTAssertTrue(mockAnalytics.isCollectionEnabled)
    }
    
    func testLogEvent() {
        let eventName = "test_event"
        let parameters = ["param1": "value1", "param2": 123]
        
        analyticsFeature.logAnalyticsEvent(eventName, parameters: parameters)
        
        XCTAssertEqual(mockAnalytics.lastEventName, eventName)
        XCTAssertEqual(mockAnalytics.lastEventParameters as? [String: Any], parameters)
    }
}