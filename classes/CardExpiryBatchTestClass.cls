@isTest
private class CardExpiryBatchTestClass {

    private static void populateData()
     {
        Account acc = new Account();
        acc.Name = 'TestAcc';
        acc.Platinum_Membership__c = 'Platinum';
        acc.E_Mail__c = 'bahareh.hajiakbar@magentrix.com';
        
        Insert acc;
        
        Contact ct = new Contact();
        ct.LastName = 'Ha';
        ct.AccountId = acc.Id;
        ct.Email = 'bahareh.hajiakbar@magentrix.com';
        
        Insert ct;
        
        Opportunity op = new Opportunity();
        op.Name = 'Testing';
        op.CloseDate = Date.newInstance(2016,12,31);
        op.StageName = 'Presented';
        op.ChargentSFA__Payment_Frequency__c = 'Monthly';
        op.ChargentSFA__Card_Month__c = '06';
        op.ChargentSFA__Card_Year__c = '2016';
        op.ChargentSFA__Payment_Start_Date__c = Date.newInstance(2016,06,01);
        op.AccountId = acc.Id;
        
        Insert op;
        
 
     }
     
    static testMethod void validateCardExpiryBatch() {
        
        populateData();
        Test.startTest();
        CardExpiryBatch c = new CardExpiryBatch ();
        c.cDate = Date.newInstance(2016,05,22);
        Database.ExecuteBatch(c);

        Test.stopTest();
     
    }
    static testMethod void validateCardExpiryBatch2() {
    
        populateData();
        Test.startTest();
        CardExpiryBatch c = new CardExpiryBatch ();
        c.cDate = Date.newInstance(2016,05,31);
        Database.ExecuteBatch(c);

        Test.stopTest();
  
    }
    static testMethod void validateCardExpiryBatch3() {
    
        populateData();
        Test.startTest();
        CardExpiryBatch c = new CardExpiryBatch ();
        c.cDate = Date.newInstance(2016,06,02);
        Database.ExecuteBatch(c);

        Test.stopTest();
  
    }
}