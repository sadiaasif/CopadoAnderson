@isTest
public class NPSdeactivateTest {
    
    public static String CRON_EXP = '0 0 0 1 1 ? 2024';
    static testmethod void testScheduledJob() {
        
        Test.startTest();
        
        List<Account> accs = new List<Account>();
        List<Contact> cons = new List<Contact>();
        List<Opportunity> opps = new List<Opportunity>();
        Campaign camp = new Campaign(Name = 'Test Campaign', IsActive = TRUE);
        Id EFtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        Id Stdtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
        Id Taxtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Tax Compliance').getRecordTypeId();
        Id Tickettype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Event Ticket').getRecordTypeId();
        Id clienttype = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Client').getRecordTypeId();
        
        Date date_today = Date.today();
        Date adj_date = date_today.addMonths(-18);
        
        DateTime dt_today = DateTime.now();
        DateTime adj_dt = dt_today.addMonths(-18);
        
        Account a = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountA', 
            RecordTypeId = clienttype);
        accs.add(a);
        
        Account b = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountB', 
            RecordTypeId = clienttype);
        accs.add(b);
        
        Account c = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountC', 
            RecordTypeId = clienttype);
        accs.add(c);
        
        insert accs;
        
        
        Opportunity o = new Opportunity(
            Name = 'EF Sale',
            CloseDate = date_today,
            StageName = 'Qualification',
            Sale_Campaign__c = camp.Id,
            RecordTypeId = Stdtype,
            Amount = 12000,
            AccountId = a.Id);
        opps.add(o);
        
        Opportunity o2 = new Opportunity(
            Name = 'EF Sale',
            CloseDate = date_today,
            StageName = 'Closed Won',
            Sale_Campaign__c = camp.Id,
            RecordTypeId = EFtype,
            Amount = 10000,
            AccountId = a.Id);
        opps.add(o2);
        
        Opportunity p = new Opportunity(
            Name = 'Ticket Sale',
            CloseDate = date_today,
            StageName = 'Qualification',
            Sale_Campaign__c = camp.Id,
            RecordTypeId = Tickettype,
            Amount = 197,
            AccountId = b.Id);      
        opps.add(p);        
        insert opps;
        
        Contact d = new Contact(
            FirstName = 'Contact',
            LastName = 'Test1',
            Account_Roles__c = 'Primary Contact',
            NPS_Recipient__c = TRUE,
            AccountId = a.Id,
            Last_NPS_survey_date__c = adj_dt);
        cons.add(d);
        
        Contact e = new Contact(
            FirstName = 'Contact',
            LastName = 'Test2',
            Account_Roles__c = 'Primary Contact',
            NPS_Recipient__c = TRUE,
            AccountId = b.Id,
            Last_NPS_survey_date__c = adj_dt);
        cons.add(e);
        
        Contact f = new Contact(
            FirstName = 'Contact',
            LastName = 'Test3',
            Account_Roles__c = 'Primary Contact',
            NPS_Recipient__c = FALSE,
            AccountId = c.Id,
            Last_NPS_survey_date__c = adj_dt);
        cons.add(f);
        
        insert cons;
        
        
        NPSdeactivate_Scheduled sh1 = new NPSdeactivate_Scheduled();
        
        String jobId = system.schedule('Test NPS Deactivate Scheduled', CRON_EXP, sh1);
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id =:jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2024-01-01 00:00:00', string.valueof(ct.NextFireTime));
        
        Test.stopTest();
        
        
    }
}