@isTest(seeAlldata = true)
private class ConvertExistingContactAsPartnerTest {
    
    static testMethod  void testConvertExistingContactAsPartner(){
        // UserRole portalRole = [Select Id, PortalRole From UserRole Where Name = 'Platinum User' Limit 1];
        // User thisUser = [select Id, AccountId from User where UserRoleId = :portalRole.Id Limit 1];  
        // System.RunAs(thisUser)
        
        Test.startTest();
        Account partnerAccount = new Account(Name = 'Test Partner Account',First_Name__c='Edward',Last_Name__c='Lee',Platinum_Client_View__c ='Platinum Elite');                                                                           
        insert partnerAccount; 
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'Opportunity' and Name = 'Platinum Subscription'].Id;
        Opportunity opp = new Opportunity();
        opp.AccountId = partnerAccount.id;
        opp.RecordTypeId = strRecordTypeId;
        opp.StageName ='Closed Won';
        opp.Name ='Platinum Subscription';
        opp.CloseDate = Date.Today().addDays(1);
        insert opp;
        partnerAccount.Platinum_Client_View__c = 'Platinum';
        update partnerAccount;
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
        partnerContact.LastName ='Test2 Contact';
        partnerContact.Email ='';
        update partnerContact;
        Test.stopTest();  
        //}
    }
    
    static testMethod void testConvertExisting(){
        Test.startTest();
        Account partnerAccount = new Account(Name = 'Test Partner Account',First_Name__c='Edward',Last_Name__c='Lee',Platinum_Client_View__c ='Platinum Elite');                                                                           
        insert partnerAccount; 
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'Opportunity' and Name = 'Platinum Subscription'].Id;
        Opportunity opp = new Opportunity();
        opp.AccountId = partnerAccount.id;
        opp.RecordTypeId = strRecordTypeId;
        opp.StageName ='Closed Lost';
        opp.Name ='Platinum Subscription';
        opp.CloseDate = Date.Today().addDays(1);
        insert opp;
        Test.stopTest();  
        
    }
    
}