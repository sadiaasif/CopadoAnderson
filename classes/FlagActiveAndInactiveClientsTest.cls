@isTest
public class FlagActiveAndInactiveClientsTest {
    
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
            Inactive_Client__c = FALSE, 
            RecordTypeId = clienttype);
        accs.add(a);
        
        Account b = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountB',
            Inactive_Client__c = FALSE, 
            RecordTypeId = clienttype);
        accs.add(b);
        
        Account c = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountC', 
            Inactive_Client__c = TRUE,
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
            AccountId = c.Id);
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

        ChargentSFA__Transaction__c t = new ChargentSFA__Transaction__c(
            ChargentSFA__Opportunity__c = o2.Id,
            ChargentSFA__Gateway_ID__c  = '42250881825',
            ChargentSFA__Gateway_Date__c = System.now(),
            ChargentSFA__Response_Status__c = 'Approved',
            ChargentSFA__Amount__c = 1500);
        trans.add(t);        
        insert trans;
        
        Contact d = new Contact(
            FirstName = 'Contact',
            LastName = 'Test1',
            Account_Roles__c = 'Primary Contact',
            AccountId = a.Id);
        cons.add(d);
        
        Contact e = new Contact(
            FirstName = 'Contact',
            LastName = 'Test2',
            Account_Roles__c = 'Primary Contact',
            AccountId = b.Id);
        cons.add(e);
        
        Contact f = new Contact(
            FirstName = 'Contact',
            LastName = 'Test3',
            Account_Roles__c = 'Primary Contact',
            AccountId = c.Id);
        cons.add(f);
        
        insert cons;
        
        
        FlagActiveAndInactiveClients_Scheduled  sh1 = new FlagActiveAndInactiveClients_Scheduled ();
        
        String jobId = system.schedule('Test Deactivate Client Scheduled', CRON_EXP, sh1);
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id =:jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2024-01-01 00:00:00', string.valueof(ct.NextFireTime));
        
        
        
        Test.stopTest();
        System.assertEquals(TRUE, [SELECT Inactive_Client__c FROM Account WHERE Last_Name__c='AccountB'].Inactive_Client__c);
        System.debug('Acct Output In Test --> ' + [ SELECT Last_Name__c, Inactive_Client__c FROM Account ] );
        System.debug('Opp Output In Test--> ' + [ SELECT AccountId, RecordType.Name, Amount, CloseDate, StageName FROM Opportunity ] );
        
        
    }
}