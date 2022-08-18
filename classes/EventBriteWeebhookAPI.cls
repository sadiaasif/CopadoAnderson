/** A rest callout to get the data from eventbrite api and update the campaign member staus.
* @author Sharukh khan/Deepesh kumar
* @version 1.0 - may 5, 2020
*/
public class EventBriteWeebhookAPI {
    public static HttpResponse makeGetCallout(String str)
    { 
        System.debug('str=='+str);
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(str);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer WCLAU42JM22SRMPQPBSR');
        req.setHeader('Accept', 'application/json');
        System.debug(req.getendpoint());
        HttpResponse response = http.send(req);
        System.debug('response=='+response);
        if (response.getStatusCode() == 200 && response.getBody()!=null) {
            Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(response.getBody()); 
            String attendeId = (String)m.get('id');
            Boolean cancelled = (Boolean)m.get('cancelled');
            List<CampaignMember> memberList = [Select id, EventBright_Member_ID__c, EventBright_Member_Status__c from CampaignMember where EventBright_Member_ID__c = : attendeId];
            for(CampaignMember mem : memberList){
                if(cancelled == true){
                    mem.EventBright_Member_Status__c = 'Canceled';
                }
            }
            System.debug('*** memberList ='+memberList);
            update memberList;
        }
        return response;
    }
}