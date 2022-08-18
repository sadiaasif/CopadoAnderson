@isTest(SeeAllData=true)
private class CreateEntityTaskTest {
    
    public static testmethod void testQuestionItemMethod()
    {
        test.startTest();
        Entities__c et = new Entities__c();
        et.RecordTypeId = [SELECT Id, Name, DeveloperName, SobjectType FROM RecordType where Name = 'Limited Liability Company (LLC)' and SobjectType = 'Entities__c'].Id; 
        et.Name = 'abc';
        et.Organization_State__c = 'Wyoming';
        et.Origin__c = 'Anderson';
        et.Status__c = 'Sent To Processing';
        et.Reason_for_Follow_Up__c = 'Sell Pension';
        insert et;
        et.Name = 'abcd';
        update et;
        To_Do__c toDoItem = new To_Do__c();
        
        toDoItem.Name =  et.Reason_for_Follow_Up__c;
        toDoItem.Entity__c = et.id;
        toDoItem.Date__c = System.today();
        
        insert toDoItem;
        
        Trust__c tr = new Trust__c();
        tr.RecordTypeId = [SELECT Id, Name, DeveloperName, SobjectType FROM RecordType where Name = 'Land Trust' and SobjectType = 'Trust__c'].Id; 
        tr.Name = 'abc';
        tr.Status__c = 'Sent To Processing';
        insert tr;
        test.stopTest();
        /*  UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
// System.runAs ( thisUser ) {
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
testAccount.Assigned_CAM__c = 'Sara Winter';
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
cse.OwnerId = thisUser.Id;
insert cse;
String cN = cse.Case_Number__c;        
CaseComment cc = new CaseComment();
cc.CommentBody = 'Testing Comment';
cc.CreatedById = UserInfo.getUserId();
cc.ParentId = cse.Id;
insert cc;  
Integer Casetotal_size=[Select count() From Case where AccountId = :thisUser.AccountId];
ApexPages.StandardController controller = new ApexPages.StandardController(cse);
CaseController CseController = new CaseController(controller);
CseController.getItems();*/
        // }
    }
    
    
}