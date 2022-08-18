@isTest
private class PlatinumChangePasswordControllerTest {

    @isTest static void testChangePassword(){
        Test.startTest();
        Account partnerAccount = new Account(Name = 'Test Account',First_Name__c='Edward',Last_Name__c='Lee');                                                                           
        insert partnerAccount; 
       Contact partnerContact = new Contact(FirstName = 'Test change Contact',LastName = 'Test change Contact',Account_Roles__c ='Primary Contact',
                                             AccountId = partnerAccount.Id,Email = 'testemail@chetu.com');
        insert partnerContact;
        String confirmPass = 'test@123';
        String oldPass ='test@1234';
        String currentPass ='test@123';
        ApexPages.StandardController controller = new ApexPages.StandardController(partnerContact);
        PlatinumChangePasswordController PlTChangePasswordController = new PlatinumChangePasswordController(controller);
        PlatinumChangePasswordController.saveChangePassword(oldPass, currentPass, confirmPass);
        
      Test.stopTest();
    }
}