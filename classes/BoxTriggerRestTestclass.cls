@isTest
public class BoxTriggerRestTestclass {

static testMethod void testHttpPost() {
 RestRequest req = new RestRequest(); 
         RestResponse res = new RestResponse();

         req.addHeader('httpMethod', 'POST');
         req.requestUri = '/services/apexrest/BoxTriggerRestAPi/';    

         RestContext.request = req; 
         RestContext.response= res;
         Test.startTest(); 
      BoxTriggerRest.postItems();
         Test.stopTest();
}
}