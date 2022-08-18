@isTest(seeAlldata = true)
private class UpdateUserEmailTest {
    
    static testMethod  void testUpdateUserEmail(){
        
        Recursive.isUpdateUser = true;
        String communityNick = Math.round(Math.random()*Math.pow(10, 7))+'';
        Profile p = [Select p.Name, p.Id From Profile p where p.Name ='Partner Community User' Limit 1];
        
        Account partnerAccount = new Account(Name = 'Test Partner Account',First_Name__c='Edward',Last_Name__c='Lee',Platinum_Client_View__c ='Platinum Elite');                                                                           
        insert partnerAccount;
        
        Contact partnerContact = new Contact(FirstName = 'Test Contact',LastName = 'Test Contact',Account_Roles__c ='Primary Contact',
                                             AccountId = partnerAccount.Id,Email = 'testemail@chetu.com');
        insert partnerContact;
        // Create Partner Users
        User partnerUser1 = new User();
        partnerUser1.LastName ='Test name';
        partnerUser1.Alias ='tetest';
        partnerUser1.Email = 'test@gmail.com';
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
        partnerContact.Email ='testSendemail@chetu.com';
        update partnerContact;
          
        
    }
}