@isTest
private class RestrictMultipleRecordTest {
    
    static testmethod void testRestrictedRecord(){
        Account acc = new Account(name='infinite');
        acc.First_Name__c='test account';
        acc.Last_Name__c='chetu';
        insert acc;
        acc.Name='calculator';
        update acc;
        Infinity_Calculator__c  infintcal = new Infinity_Calculator__c();
        infintcal.Account__c = acc.id;
        infintcal.Name ='testcal';
        infintcal.first_name__c ='test';
        infintcal.last_name__c='infinite';
        insert infintcal;
        
    }
    
}