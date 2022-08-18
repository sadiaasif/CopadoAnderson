/** A rest resource class to get the attendee information by using Webhook.
* @author Sharukh khan/Deepesh kumar
* @version 1.0 - may 4, 2020
*/
@RestResource(urlMapping='/eventBriteAttendeeUpdateWebhook/*')
global class EventBriteAttendeeUpdateWebhook {
    @HttpPost 
    global static void updateAttendee(){
        RestRequest attendeeReq = RestContext.request;
        String jsonBody;
        if(Test.isRunningTest()){ 
            attendeeReq = new RestRequest();
            attendeeReq.requestBody =Blob.valueOf('{"api_url":"https://www.eventbriteapi.com/v3/events/103156417622/attendees/1861511098/"}');
        } 
        jsonBody = attendeeReq.requestBody.toString();
        system.debug('#######jsonBody-->  '+jsonBody);
        Map<String, Object> jsonMap= (Map<String, Object>)JSON.deserializeUntyped(jsonBody);
        system.debug('==jsonMap='+jsonMap);
        Object url = jsonMap.get('api_url');
        String stringUrl = (String)url;
        system.debug('URL='+url);
        EventBriteWeebhookAPI.makeGetCallout(stringUrl);
    }
    
}