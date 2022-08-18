/**
* A controller class to used to provide Code Coverage for CaseFileAttachController class.
* 
* @author Prateeks
* @version 1.0 - March 11, 2019
*/
@isTest(SeeAllData=false)
public class CaseFileAttachControllerTest {

     /**
* This method is used to provide code coverage of getCommentList,getCommentList,uploadAttachment method
* 
* @author Ranjeet
* @date March 11, 2019
* @return response on the basis of Task creation
*/   
    public static testmethod void testQuestionItemMethod()
    {
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
      
        Test.StartTest(); 
        Integer cseLstSze = 10;
        Id p = [select id from profile where name='Partner Community User'].id;
        Campaign cmp = new Campaign();
        cmp.Name = 'Steve';
        insert cmp;
        
        // Test Account insert here
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
        
        // Test Contact insert here
        Contact cont = new Contact ();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        cont.Account_Roles__c= 'Primary Contact';
        insert cont;
        
        // Test Case insert here
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
        
        // Test Attachment insert here
 		Attachment attach=new Attachment();   	
    	attach.Name='Test';
    	Blob bodyBlob=Blob.valueOf('Testing Body of Attachment');
    	attach.body=bodyBlob;
        attach.parentId=cse.id;
        insert attach;
        List<Attachment> attachments=[select id, name from Attachment where parent.id=:cse.id];
        System.assertEquals(1, attachments.size());
        Integer Casetotal_size=[Select count() From Case where AccountId = :thisUser.AccountId];
        ApexPages.StandardController controller = new ApexPages.StandardController(cse);
        CaseFileAttachController CseController = new CaseFileAttachController(controller);
       // CseController.exactFileName = 'abc.xlxs';
        CseController.cseId = cse.id;
        CseController.myfile = attach;
       // CseController.uploadAttachment();
        CseController.Savedoc();
   
        Test.stopTest();  
      
    }
}