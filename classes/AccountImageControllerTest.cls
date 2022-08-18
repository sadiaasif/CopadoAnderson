/*@isTest
public class AccountImageControllerTest{
    @isTest static void testGetFileId() {
        //ContentVersion conv=new ContentVersion();
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
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
        Attachment attachDoc = new Attachment();
        attachDoc.ParentId = testAccount.Id;
        attachDoc.Name = 'test.png';
        attachDoc.Body = blob.valueOf('test.png');
        insert attachDoc;
        Blueprint__c bp = new Blueprint__c();
        bp.AccountId__c = testAccount.Id;
        bp.Name = 'test.png';
        bp.AttachmentId__c = attachDoc.Id;
        insert bp;
        ApexPages.StandardController controller = new ApexPages.StandardController(testAccount);
        AccountImageController accountImageController = new AccountImageController(controller);
		accountImageController.recId = testAccount.Id;
        //accountImageController.attId = attachDoc.Id;
        accountImageController.getFileId();
        Test.stopTest();
    }
}*/

@isTest
public class AccountImageControllerTest{
    
    @isTest static void testGetFileId() {    
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
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
        Attachment attachDoc = new Attachment();
        attachDoc.ParentId = testAccount.Id;
        attachDoc.Name = 'test.png';
        attachDoc.Body = blob.valueOf('test.png');
        insert attachDoc;
        Blueprint__c bp = new Blueprint__c();
        bp.AccountId__c = testAccount.Id;
        bp.Name = 'test.png';
        bp.AttachmentId__c = attachDoc.Id;
        insert bp;
        ContentVersion conv=new ContentVersion();
        ApexPages.StandardController controller = new ApexPages.StandardController(testAccount);
        AccountImageController accountImageController = new AccountImageController(controller);
        accountImageController.recId = testAccount.Id;
       // accountImageController.getFileId();
test.stopTest();
    }
}