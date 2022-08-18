@isTest
public class NotarizationRestAPITestClass {
static testMethod void testHttpPost() {
 RestRequest req = new RestRequest(); 
         RestResponse res = new RestResponse();

         req.addHeader('httpMethod', 'POST');
         req.requestUri = '/services/apexrest/NotarizationRestAPI/';    

         RestContext.request = req; 
         RestContext.response= res;
         Test.startTest(); 
      NotarizationRestAPI.postItems();
         Test.stopTest();
}
}