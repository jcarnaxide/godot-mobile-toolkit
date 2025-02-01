import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import com.google.firebase.analytics.FirebaseAnalytics

class AnalyticsFeatureTest {
    @Mock
    private lateinit var firebaseAnalytics: FirebaseAnalytics
    
    private lateinit var analyticsFeature: AnalyticsFeature
    
    @Before
    fun setup() {
        MockitoAnnotations.openMocks(this)
        analyticsFeature = AnalyticsFeature()
        // Inject mock FirebaseAnalytics
        analyticsFeature.setAnalyticsForTesting(firebaseAnalytics)
    }
    
    @Test
    fun `test analytics collection enabled`() {
        analyticsFeature.setAnalyticsCollectionEnabled(true)
        verify(firebaseAnalytics).setAnalyticsCollectionEnabled(true)
    }
    
    @Test
    fun `test log event with parameters`() {
        val eventName = "test_event"
        val parameters = Dictionary().apply {
            put("param1", "value1")
            put("param2", 123)
        }
        
        analyticsFeature.logAnalyticsEvent(eventName, parameters)
        
        verify(firebaseAnalytics).logEvent(eq(eventName), any())
    }
}