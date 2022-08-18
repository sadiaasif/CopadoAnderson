@isTest(SeeAllData=false)
public class CaseSubmitQuestionTestClass {
    @testSetup
    static void dataSetup() {
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.phone='123456782';
        insert testAccount;
        Contact cont = new Contact ();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        insert cont;
        Case cse = new Case();
        cse.AccountId = testAccount.Id;
        cse.ContactId = cont.Id;
        cse.Subject = 'Platinum Bookkeeping Question';
        cse.Description = 'Testing Descritpion';
        cse.CreatedDate = system.now();
        cse.Status = 'New';
        insert cse;    
    }
    static testMethod void testCharge() {
        Account acc = [ SELECT Id FROM Account LIMIT 1 ];
        id strRecordTypeId = [Select Id From RecordType Where SobjectType = 'Case' and Name = 'Community Platinum Case'].Id;
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();              
        req.requestURI = '/services/apexrest/Cases/';
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response= res;
        CaseSubmitQuestion reqst=new CaseSubmitQuestion();
        String JsonMsg=JSON.serialize(reqst);
        req.requestBody = Blob.valueof(JsonMsg);
        test.startTest();
        id oppId = CaseSubmitQuestion.createCase();
        test.stopTest();
	      
    }
    
}