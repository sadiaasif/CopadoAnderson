@isTest
public class FlagactiveClientsTest {
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
        Date adj_date = Date.newInstance(2016, 12, 9);
        
        DateTime dt_today = DateTime.now();
        DateTime adj_dt = Date.newInstance(2016, 12, 9);
        
        Account a = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountA',
            Inactive_Client__c = true, 
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
            Inactive_Client__c = False,
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
            CloseDate = adj_date,
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
            ChargentSFA__Gateway_Date__c =adj_date,
            ChargentSFA__Response_Status__c = 'Approved',
            ChargentSFA__Amount__c = 60);
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
         String accountQuery='Select Id, Inactive_Client__c, Total_Value_of_All_Sales__c  FROM Account WHERE  Inactive_Client__c=False AND NAME!=\'Advisors, Anderson\' AND Id NOT IN (SELECT AccountId FROM Opportunity WHERE ((RecordType.Name = \'Entity Formation\' OR RecordType.Name = \'Tax Compliance\') AND Amount >=1500  AND StageName = \'Closed Won\'  AND CloseDate > N_DAYS_AGO:181 AND Account.First_Entity_Formation_or_Tax_Sale__c > N_DAYS_AGO:181) OR ((RecordType.Name = \'Entity Formation\' OR RecordType.Name = \'Tax Compliance\') AND Amount >=1500 AND StageName = \'Closed Won\' AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182) OR ((RecordType.Name = \'Platinum Subscription\' OR RecordType.Name = \'Bookkeeping Subscription\') AND StageName = \'Closed Won\' AND Last_Transaction__c >= N_DAYS_AGO:35 AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182) OR ((RecordType.Name = \'State Renewal\' OR RecordType.Name = \'Standard Renewal\') AND (CloseDate >= NEXT_N_DAYS:365 OR CloseDate = YESTERDAY) AND (StageName = \'Closed Won\' OR StageName = \'Qualification\')AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182) )  ';
          ID batchJobId1 = Database.executeBatch(new FlagActiveClientsbatchCls(accountQuery));

        
        
        Test.stopTest();
        System.assertEquals(True, [SELECT Inactive_Client__c FROM Account WHERE Last_Name__c='AccountC'].Inactive_Client__c);
        System.debug('Acct Output In Test --> ' + [ SELECT Last_Name__c, Inactive_Client__c FROM Account ] );
        System.debug('Opp Output In Test--> ' + [ SELECT AccountId, RecordType.Name, Amount, CloseDate, StageName FROM Opportunity ] );
        
        
    }
     @isTest
    static  void BatchscheduleclassTest() {        

 String CRON_EXP = '0 0 0 15 3 ? *';
      Test.startTest();
  
        
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new FlagActiveClientsbatchCall());
            CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
            System.assertEquals(CRON_EXP, ct.CronExpression);
            System.assertEquals(0, ct.TimesTriggered);
        
        Test.stopTest();
        
      
      
     }
}