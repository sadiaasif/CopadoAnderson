@isTest
public class BlueprintTest {
    @testSetup
    static void dataSetup() {
        Account acctest = new Account(
            Name='Test Account',
            First_Name__c='Edward',
            Last_Name__c='Lee'
            );
        insert acctest;
         Attachment a= new Attachment();         
        a.ParentId = acctest.Id;
        a.Name = 'editBlueprint.png';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        a.Body=bodyBlob;
        insert a;
        Blueprint__c bp = new Blueprint__c();         
        bp.Name = 'test.png';
        bp.AccountId__c = acctest.Id;
        bp.AttachmentId__c = a.Id;
        insert bp;
    }
    static testMethod void testGet() {
        Account acc = [ SELECT Id FROM Account LIMIT 1 ];
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();             
        req.requestURI = '/services/apexrest/BlueprintAttachement/' + acc.Id;
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;
       List<string> blueprintstr = BlueprintAPI.getAttachement();        
    }
   
}