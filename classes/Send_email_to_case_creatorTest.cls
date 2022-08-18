@isTest(SeeAllData = true)
private class Send_email_to_case_creatorTest {
    
    private static testMethod void sendEmailCase(){
        
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        RecordType rt = [SELECT Id, Name, SobjectType FROM RecordType where name = 'Community Platinum Case' and SobjectType = 'Case'];
        //System.runAs ( thisUser ) {
            Test.StartTest(); 
            Integer cseLstSze = 10;
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
        cse.Made_By_Automation__c =true;
            cse.OwnerId = thisUser.Id;
            cse.RecordTypeId = rt.Id;
            insert cse;
            String cN = cse.Case_Number__c;        
            CaseComment cc = new CaseComment();
            cc.CommentBody = 'Testing Comment';
            cc.CreatedById = UserInfo.getUserId();
            cc.ParentId = cse.Id;
        	cc.IsPublished = true;
            insert cc; 
        cc.CommentBody='Testing Comment update';
        update cc;
            Test.stopTest();
       // }
        
    }
}