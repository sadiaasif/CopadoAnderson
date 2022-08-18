@isTest
public class NonCommissionableTest {
public static String CRON_EXP = '0 0 0 1 1 ? 2024';
    static testmethod void testScheduledJob() {
        
        Test.startTest();
        List<Opportunity> opps = new List<Opportunity>();
        List<OpportunityLineItem> opplineitems = new List<OpportunityLineItem>();
        List<PricebookEntry> pbentries = new List<PricebookEntry>();
        
        Product2 NCservice = new Product2(Name = 'Test Product1', IsActive = TRUE, Non_Commissionable__c = TRUE);
        Product2 Cservice = new Product2(Name = 'Test Product2', IsActive = TRUE, Non_Commissionable__c = FALSE);
        insert NCservice; insert Cservice;

        Pricebook2 pricebook = new Pricebook2(Name = 'Test Pricebook', IsActive = TRUE);
        insert pricebook;
        
        PricebookEntry stdentry1 = new PricebookEntry(Pricebook2Id = Test.getStandardPricebookId(), Product2Id = NCservice.Id, 
                                                     UnitPrice = 1000);
        PricebookEntry stdentry2 = new PricebookEntry(Pricebook2Id = Test.getStandardPricebookId(), Product2Id = Cservice.Id, 
                                                     UnitPrice = 500);
        PricebookEntry pbentry1 = new PricebookEntry(Pricebook2Id = pricebook.Id, Product2Id = NCservice.Id, 
                                                     UnitPrice = 1000, IsActive = TRUE, UseStandardPrice = FALSE);
        PricebookEntry pbentry2 = new PricebookEntry(Pricebook2Id = pricebook.Id, Product2Id = Cservice.Id, 
                                                     UnitPrice = 222, IsActive = TRUE, UseStandardPrice = FALSE);
        
        pbentries.add(stdentry1); pbentries.add(stdentry2); pbentries.add(pbentry1); pbentries.add(pbentry2);
        insert pbentries;
        
        Campaign camp = new Campaign(Name = 'Test Campaign', IsActive = TRUE);
        
        Id EFtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        Id InfSubtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Infinity Subscription').getRecordTypeId();
        Id Taxtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Tax Compliance').getRecordTypeId();
        Id BKGtype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Id Plattype = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        
        Id clienttype = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Client').getRecordTypeId();
        
        Account a = new Account(Name = 's', First_Name__c = 'FNTest', Last_Name__c = 'LNTest', Main_Lead_Source__c = 'Affiliate', 
                                Original_Campaign_Source__c = camp.Id, RecordTypeId = clienttype);
        insert a;

        Date date_today = Date.today(); 
        
        Opportunity o1 = new Opportunity(Name = 'EF Sale', CloseDate = date_today, StageName = 'Qualification',
            Sale_Campaign__c = camp.Id, RecordTypeId = EFtype, Amount = 10000, Pricebook2Id = pricebook.Id, AccountId = a.Id);
        Opportunity o2 = new Opportunity(Name = 'InfSub Sale', CloseDate = date_today, StageName = 'Qualification',
            Sale_Campaign__c = camp.Id, RecordTypeId = InfSubtype, Amount = 2000, Pricebook2Id = pricebook.Id, AccountId = a.Id);
        Opportunity o3 = new Opportunity(Name = 'Tax Sale', CloseDate = date_today, StageName = 'Qualification',
            Sale_Campaign__c = camp.Id, RecordTypeId = Taxtype, Amount = 3000, Pricebook2Id = pricebook.Id, AccountId = a.Id);
        Opportunity o4 = new Opportunity(Name = 'BKG Sale', CloseDate = date_today, StageName = 'Qualification',
            Sale_Campaign__c = camp.Id, RecordTypeId = BKGtype, Amount = 4000, Pricebook2Id = pricebook.Id, AccountId = a.Id);
        Opportunity o5 = new Opportunity(Name = 'False Sale', CloseDate = date_today, StageName = 'Qualification',
            Sale_Campaign__c = camp.Id, RecordTypeId = Plattype, Amount = 4000, Pricebook2Id = pricebook.Id, AccountId = a.Id);
       
        opps.add(o1); opps.add(o2); opps.add(o3); opps.add(o4); opps.add(o5);
        insert opps;
        
        OpportunityLineItem lineitem1 = new OpportunityLineItem(OpportunityId = o1.Id, Quantity = 1, Product2Id = NCservice.Id, 
                                                               PricebookEntryId = pbentry1.Id, UnitPrice = 1000);
        OpportunityLineItem lineitem1b = new OpportunityLineItem(OpportunityId = o1.Id, Quantity = 3, Product2Id = Cservice.Id, 
                                                               PricebookEntryId = pbentry2.Id, UnitPrice = 222);        
        OpportunityLineItem lineitem2 = new OpportunityLineItem(OpportunityId = o2.Id, Quantity = 5, Product2Id = Cservice.Id, 
                                                               PricebookEntryId = pbentry2.Id, UnitPrice = 222);         
        OpportunityLineItem lineitem3 = new OpportunityLineItem(OpportunityId = o3.Id, Quantity = 2, Product2Id = NCservice.Id, 
                                                               PricebookEntryId = pbentry1.Id, UnitPrice = 1000);
        OpportunityLineItem lineitem4 = new OpportunityLineItem(OpportunityId = o4.Id, Quantity = 2, Product2Id = NCservice.Id, 
                                                               PricebookEntryId = pbentry1.Id, UnitPrice = 1000);
        OpportunityLineItem lineitem5 = new OpportunityLineItem(OpportunityId = o5.Id, Quantity = 1, Product2Id = NCservice.Id, 
                                                               PricebookEntryId = pbentry1.Id, UnitPrice = 1000);
        
        opplineitems.add(lineitem1); opplineitems.add(lineitem1b); opplineitems.add(lineitem2); opplineitems.add(lineitem3);
        opplineitems.add(lineitem4); opplineitems.add(lineitem5);
        insert opplineitems;
        
        String jobId = system.schedule('Test NonCommissionable Scheduled', CRON_EXP, new NonCommissionable_BatchCall());
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id =:jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        
        Test.stopTest();

       
    }
}