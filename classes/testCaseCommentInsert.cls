@isTest
public class testCaseCommentInsert {
    @testSetup
    static void createTestRecord() {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        RecordType rt = [SELECT Id, Name, SobjectType FROM RecordType where name = 'Community Platinum Case' and SobjectType = 'Case'];
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;        
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.Campaign__c = cmp.Id;
        testAccount.OwnerId = thisUser.Id;
        //testAccount.Assigned_CAM__c = 'Sara Winter';
        testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.Bookkeeper__c = thisUser.Id;
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
    @isTest
    static void createNewCommentTest() 
    { 
        Case cse = [SELECT Id,Subject,RecordtypeId,CreatedDate, OwnerId, ContactId FROM Case];  
        RestRequest request = new RestRequest();
        request.requestUri ='/services/apexrest/CaseComment/';
        request.httpMethod = 'POST';
        String jsonReq = '{"ParentId": "'+cse.Id+'","CommentBody": "Case Comment1","IsPublished":"true"}';
        request.requestBody = Blob.valueof(jsonReq);
        
        RestContext.request = request;
        Test.startTest();
        CaseComment returnCase = CaseCommentInsert.createNewComment();
        Test.stopTest();
        System.assertNotEquals(null, returnCase);
        System.assertEquals('Case Comment1', returnCase.CommentBody);
    }
}