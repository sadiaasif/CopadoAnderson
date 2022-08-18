@isTest
private class ClientPlatinumViewAssignTest {
    static testMethod void testClientPlatinumViewAssign(){
        Test.startTest();
        Account partnerAccount = new Account(Name = 'Test Partner Account',First_Name__c='Edward',Last_Name__c='Lee',Platinum_Client_View__c ='Platinum Elite');                                                                           
        insert partnerAccount; 
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'Opportunity' and Name = 'Platinum Subscription'].Id;
        Opportunity opp = new Opportunity();
        opp.AccountId = partnerAccount.id;
        opp.RecordTypeId = strRecordTypeId;
        opp.StageName ='Qualification';
        opp.Name ='Platinum Subscription';
        opp.CloseDate = Date.Today().addDays(1);
        insert opp;
        opp.Name ='Platinum Subscription test';
        update opp;
        Test.stopTest();
    }
}