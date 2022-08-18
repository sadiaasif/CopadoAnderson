@isTest
public class FirstEntityFormationSaleTest {
    
    public static String CRON_EXP = '0 0 0 1 1 ? 2024';
    static testmethod void testScheduledJob() {
        
        Test.startTest();
        
                List<Account> accs = new List<Account>();
        List<Opportunity> opps = new List<Opportunity>();
        List<ChargentSFA__Transaction__c> trans = new List<ChargentSFA__Transaction__c>();
        Campaign camp = new Campaign(Name = 'Test Campaign', IsActive = TRUE);
        Id EFtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        Id clienttype = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Client').getRecordTypeId();
        
        Date date_today = Date.today(); 
        DateTime dt_today = DateTime.now();
        
        for (integer i = 0; i<10; i++){
            Account a = new Account(
                Name = 'Test',
                First_Name__c = 'Test', 
                Last_Name__c = 'Account' + i, 
                RecordTypeId = clienttype);
        accs.add(a);
        }
        insert accs;
        
        for (integer j = 0; j < 10; j++){
            Opportunity o = new Opportunity(
            Name = 'EF Sale' + j,
            CloseDate = date_today.addDays(-j),
            StageName = 'Qualification',
            Sale_Campaign__c = camp.Id,
            RecordTypeId = EFtype,
            Amount = 10000,
            AccountId = accs[j].Id);
            opps.add(o);
        }
        insert opps;
        
        for (integer k = 0; k < 10; k++){
            ChargentSFA__Transaction__c t = new ChargentSFA__Transaction__C(
                ChargentSFA__Gateway_Date__c = dt_today,
                ChargentSFA__Gateway_ID__c = '11111111111111111',
                ChargentSFA__Opportunity__c = opps[k].Id,
                ChargentSFA__Type__c = 'Charge',
                ChargentSFA__Response_Status__c = 'Approved',
                ChargentSFA__Amount__c = 1000,
                ChargentSFA__Payment_Method__c = 'Credit Card');
            trans.add(t);
        }
        insert trans;
        
        FirstEFSale_Scheduled sh1 = new FirstEFSale_Scheduled();
        String jobId = system.schedule('Test First EF Sale Scheduled', CRON_EXP, sh1);
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id =:jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2024-01-01 00:00:00', string.valueof(ct.NextFireTime));
        
        Test.stopTest();

       
    }
}