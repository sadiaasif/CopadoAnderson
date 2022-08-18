@isTest 
private class RestrictPlatinumClientViewTest {

    static testmethod void restrictPlatinumMethod(){
         Test.startTest();
         Account partnerAccount = new Account(Name = 'Test Partner Account',First_Name__c='Edward',Last_Name__c='Lee',Platinum_Client_View__c ='Platinum Elite');                                                                           
        insert partnerAccount; 
         Test.stopTest();  
    }
    
}