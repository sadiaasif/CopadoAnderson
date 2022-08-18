@isTest
public class EventBriteAttendeeUpdateWebhookTest {
    @isTest
    private static void testEventBriteAttendeeUpdateWebhook(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('WebhookStaticResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        eventBriteAttendeeUpdateWebhook.updateAttendee();
    }
}