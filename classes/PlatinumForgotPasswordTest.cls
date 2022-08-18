@isTest
private class PlatinumForgotPasswordTest {
    @testSetup
    static void testForgotPassword(){
        
        Account partnerAccount = new Account(Name = 'Test Partner Account',First_Name__c='Edward',Last_Name__c='Lee');                                                                           
        insert partnerAccount; 
        RecordType listRecordType = [SELECT id,Name ,SobjectType FROM RecordType where Name ='Platinum Subscription' Limit 1];
        Opportunity opp = new Opportunity();
        opp.AccountId = partnerAccount.id;
        opp.StageName ='Closed Won';
        opp.RecordTypeId = listRecordType.id;
        opp.Name ='Platinum Subscription';
        opp.CloseDate = Date.Today().addDays(1);
        insert opp;
        Contact partnerContact = new Contact(FirstName = 'Test Contact',LastName = 'Test Contact',Account_Roles__c ='Primary Contact',
                                             AccountId = partnerAccount.Id,Email = 'testemail@chetu.com');
        insert partnerContact;
        
        String communityNick = Math.round(Math.random()*Math.pow(10, 7))+'';
        Profile p = [Select p.Name, p.Id From Profile p where p.Name ='Partner Community User' Limit 1];
        // Create Partner Users
        User partnerUser1 = new User();
        partnerUser1.LastName ='Test name';
        partnerUser1.Alias ='tetest';
        partnerUser1.Email ='testemail'+Math.round(Math.random()*Math.pow(10, 7))+'@testemail.com';
        partnerUser1.Username ='testemail'+Math.round(Math.random()*Math.pow(10, 7))+'@testemai.com';
        partnerUser1.CommunityNickname = 'TestCommunityName1'+communityNick.substring(0,4);
        partnerUser1.ProfileId = p.Id;
        partnerUser1.ContactId = partnerContact.Id;
        partnerUser1.TimeZoneSidKey ='Asia/Kolkata';
        partnerUser1.LocaleSidKey ='en_IN';
        partnerUser1.EmailEncodingKey ='UTF-8';
        partnerUser1.LanguageLocaleKey ='en_US';
        partnerUser1.isActive = true;
        insert partnerUser1;
       
    }


@isTest
static  void  CustomLoginController() {
    Account partnerAccount = new Account(Name = 'Test Partner Account',First_Name__c='Edward',Last_Name__c='Lee');
    RecordType listRecordType = [SELECT id,Name ,SobjectType FROM RecordType where Name ='Platinum Subscription' Limit 1];
    Contact partnerContact = new Contact(FirstName = 'Test Contact',LastName = 'Test Contact',Account_Roles__c ='Primary Contact',
                                       AccountId = partnerAccount.Id,Email = 'testemail@chetu.com');
    User partnerUser1 = [SELECT id, Email FROM User WHERE LastName ='Test name' LIMIT 1];
    Test.StartTest();
    CustomLoginController cs = new CustomLoginController();
    PlatinumForgotPassword pforgotPass = new PlatinumForgotPassword(cs);
    PlatinumForgotPassword.getForgotPassword(partnerUser1.Email);
    Profile p = [Select p.Name, p.Id From Profile p where p.Name ='Partner Community User' Limit 1];
    PlatinumForgotPassword.getForgotPassword(null);
    Test.stopTest();
}
}