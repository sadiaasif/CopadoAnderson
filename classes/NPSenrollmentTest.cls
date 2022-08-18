@isTest
public class NPSenrollmentTest {
    public static String CRON_EXP = '0 0 0 1 1 ? 2024';
    static testmethod void testScheduledJob() {
        
        Test.startTest();
        
        List<Account> accs = new List<Account>();
        List<Contact> cons = new List<Contact>();
        List<Opportunity> opps = new List<Opportunity>();
        List<ChargentSFA__Transaction__c> trans = new List<ChargentSFA__Transaction__c>();
        Campaign camp = new Campaign(Name = 'Test Campaign', IsActive = TRUE);
        Id EFtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        Id Stdtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
        Id Taxtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Tax Compliance').getRecordTypeId();
        Id clienttype = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Client').getRecordTypeId();
        
        Date date_today = Date.today();
        Date yest = date_today.addDays(-1);
        Date sixWeekAgo = date_today.addDays(-43);
        Date sixMonthAgo = date_today.addDays(-190);
        
        Account a = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountA', 
            RecordTypeId = clienttype,
            Last_NPS_Sent__c = NULL);
        accs.add(a);
        
        Account b = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountB', 
            RecordTypeId = clienttype, 
            Last_NPS_Sent__c = sixMonthAgo);
        accs.add(b);
        
        Account c = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountC', 
            RecordTypeId = clienttype,
            Last_Nps_Sent__c = sixMonthAgo);
        accs.add(c);
        
        insert accs;

        
        Opportunity o = new Opportunity(
            Name = 'EF Sale',
            CloseDate = sixWeekAgo,
            StageName = 'Closed Won',
            Sale_Campaign__c = camp.Id,
            RecordTypeId = EFtype,
            Amount = 12000,
            AccountId = a.Id);
        opps.add(o);
    
        Opportunity o2 = new Opportunity(
            Name = 'Renewal Sale',
            CloseDate = date_today,
            StageName = 'Closed Won',
            Sale_Campaign__c = camp.Id,
            RecordTypeId = Stdtype,
            Amount = 10000,
            AccountId = b.Id);
        opps.add(o2);
        
        Opportunity p = new Opportunity(
            Name = 'Tax Sale',
            CloseDate = yest,
            StageName = 'Closed Won',
            Sale_Campaign__c = camp.Id,
            RecordTypeId = Taxtype,
            Amount = 2500,
            AccountId = c.Id);      
        opps.add(p);        
        insert opps;
        
        ChargentSFA__Transaction__c tx = new ChargentSFA__Transaction__c(
        	ChargentSFA__Gateway_Date__c = Datetime.now().addDays(-43),
            ChargentSFA__Gateway_Id__c = 'Stripe',
            ChargentSFA__Opportunity__c = o.id,
            ChargentSFA__Type__c = 'Charge',
            ChargentSFA__Amount__c =  12000,
            ChargentSFA__Response_Status__c = 'Approved',
            ChargentSFA__Payment_Method__c = 'Credit Card');
        trans.add(tx);
        
        ChargentSFA__Transaction__c tx1 = new ChargentSFA__Transaction__c(
        	ChargentSFA__Gateway_Date__c = Datetime.now().addDays(-1),
            ChargentSFA__Gateway_Id__c = 'Stripe',
            ChargentSFA__Opportunity__c = o2.id,
            ChargentSFA__Type__c = 'Charge',
            ChargentSFA__Amount__c =  10000,
            ChargentSFA__Response_Status__c = 'Approved',
            ChargentSFA__Payment_Method__c = 'Credit Card');
        trans.add(tx1);
        
        ChargentSFA__Transaction__c tx2 = new ChargentSFA__Transaction__c(
        	ChargentSFA__Gateway_Date__c = Datetime.now(),
            ChargentSFA__Gateway_Id__c = 'Stripe',
            ChargentSFA__Opportunity__c = p.id,
            ChargentSFA__Type__c = 'Charge',
            ChargentSFA__Amount__c =  2500,
            ChargentSFA__Response_Status__c = 'Approved',
            ChargentSFA__Payment_Method__c = 'Credit Card');
        trans.add(tx2);
        insert trans;
        
        
        Contact d = new Contact(
            FirstName = 'Contact',
            LastName = 'Test1',
            Account_Roles__c = 'Primary Contact',
            NPS_Recipient__c = FALSE,
            AccountId = a.Id);
        cons.add(d);
        
        Contact e = new Contact(
            FirstName = 'Contact',
            LastName = 'Test2',
            Account_Roles__c = 'Primary Contact',
            NPS_Recipient__c = FALSE,
            AccountId = b.Id);
        cons.add(e);
        
        Contact f = new Contact(
            FirstName = 'Contact',
            LastName = 'Test3',
            Account_Roles__c = 'Primary Contact',
            NPS_Recipient__c = FALSE,
            AccountId = c.Id);
        cons.add(f);
        
        insert cons;
        
        
        NPSenrollment_Scheduled sh1 = new NPSenrollment_Scheduled();
        
        String jobId = system.schedule('Test NPS Enrollment Scheduled', CRON_EXP, sh1);
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id =:jobId];
        
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2024-01-01 00:00:00', string.valueof(ct.NextFireTime));
        
        Test.stopTest();
        
        List<Account> accA = [SELECT Id, Last_NPS_Sent__c FROM Account WHERE Name = 'AccountA, Test' LIMIT 1];
        System.assert(accA[0].Last_NPS_Sent__c != null);
    }
}