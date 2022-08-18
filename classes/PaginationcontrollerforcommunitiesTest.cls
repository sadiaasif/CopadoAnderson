@isTest(SeeAllData=false)
public class PaginationcontrollerforcommunitiesTest {
  public static testmethod void testQuestionItemMethod()
    {        
        Integer LstSze =10;
        Integer total_size=15;
        UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        User thisUser = [select Id, AccountId, ContactId from User where UserRoleId = :portalRole.Id Limit 1];  
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
        Contact cont = new Contact();
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        insert cont;
        User uzr = new User();
        uzr.FirstName='Steve';
        uzr.LastName='Mark';
        uzr.Email='stevemark@gmail.com';
        uzr.Username='stevemark@gmail.com';
        uzr.Alias='autocase';
        uzr.CommunityNickname='Partner_Panelsss';
        uzr.TimeZoneSidKey='GMT';
        uzr.LocaleSidKey='en_US';
        uzr.EmailEncodingKey='UTF-8';
        uzr.ProfileId=p;
        uzr.LanguageLocaleKey='en_US';
        uzr.ContactId = cont.Id;
        uzr.ProfileId = p;
        uzr.IsActive =true;
        insert uzr;
        Entities__c ent = new Entities__c();
        ent.Primary_Client__c = cont.accountid;
        ent.Name = 'abc';
        ent.EIN__c= '5896478589';
        ent.Tax_Status__c= 'Trust';
        ent.Tax_Form__c= '1120S';
        ent.Organization_State__c= 'Alaska';
        ent.Business_Address__c= '';
        ent.SOS_Number__c= '123';
        ent.Tax_Year_Ended__c= '2019';
        ent.Tracking_Number__c= '1233';
        ent.Shipping_Method__c= 'abc';
        ent.Structure__c='';
        ent.Share_Holder_1__c='ss';
        ent.Share_Holder_2__c='ss2';
        ent.Share_Holder_3__c='ss3';
       
        insert ent;
        Attachment a= new Attachment();         
        a.ParentId = testAccount.Id;
        a.Name = 'editBlueprint.png';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        a.Body=bodyBlob;
        insert a;
        Blueprint__c bp = new Blueprint__c();         
        bp.Name = 'test.png';
        bp.AccountId__c = testAccount.Id;
        bp.AttachmentId__c = a.Id;
        insert bp;
        system.runAs(uzr){
            Test.StartTest();
            ApexPages.StandardController controller = new ApexPages.StandardController(uzr);
            Paginationcontrollerforcommunities PgController = new Paginationcontrollerforcommunities(controller);
          
          String id=testAccount.id;
            Paginationcontrollerforcommunities.getBlueprintAttachment(id);
           
            
            Test.stopTest(); 
           
        }
    }
}