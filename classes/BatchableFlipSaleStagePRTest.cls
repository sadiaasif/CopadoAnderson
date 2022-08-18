@isTest
private class BatchableFlipSaleStagePRTest {
    @testSetup
    static void setup() 
    {
        
        //  insert new BatchRetryAttempts__c(Name='BatchableSaleCreationEntity',Current_Iteration__c=1,Maximum_Iteration__c=3);
        Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;
        Campaign camp = new Campaign();
        camp.Name = 'Pension Renewals';
        camp.Status='planned';
        camp.IsActive=true;
        insert camp;
        
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Annual List',
                                     Family = '	Filing Fees', Type__c='Annual List', Service_Fulfillment_Weight__c='1');
        insert prod2;
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 52, IsActive = true);
        insert standardPrice2;
        
    }
    static testMethod void testMethod1()
    {   
        
     Account acc = [Select id from Account];
     Campaign camp =[Select id from Campaign where Name = 'Pension Renewals'];
     Product2 prod =[Select id from Product2 where Name = 'Pension - Annual Maintenance'];
     Id pricebookId = Test.getStandardPricebookId();
     PricebookEntry standardPrice = [Select id,UnitPrice from PricebookEntry where Pricebook2Id =: pricebookId AND Product2Id =: prod.Id];
     List<Entities__c> entLst = new List<Entities__c>();
     for(Integer i=0;i<5;i++)
     {
         Entities__c myEnt = new Entities__c();
         myEnt.Primary_Client__c = acc.id;    
         myEnt.Name = 'Entity_1';
         myEnt.Origin__c = 'Anderson';
         myEnt.Organization_State__c = 'Maine';
         myEnt.SLA__c ='No Service';
         myEnt.PlanType__c = 'Money Purchase Plan';
         Date mydate = date.parse('4/24/2021');
         myEnt.Prepaid_SLA_Date__c = mydate;
         myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
         entLst.add(myEnt);
     }
     insert entLst;
     List<Opportunity> opLst = new List<Opportunity>();
     for (Integer i = 0; i<entLst.size(); i++)
     {
         
         Opportunity op = new Opportunity();
         op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
         op.AccountId = acc.Id;
         op.Name ='Annual Plan Maintenance';
         op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
         op.Entity__c = entLst[i].Id;
         op.Campaign__c = camp.Id;
         op.StageName ='Qualification';
         opLst.add(op);
     }
     
     insert opLst;
     List <OpportunityLineItem> lstOpItem = new List<OpportunityLineItem>();
     for(Integer i=0;i<opLst.size();i++)
     {
         OpportunityLineItem opItem = new OpportunityLineItem();
         opItem.OpportunityId = opLst[i].Id;
         opItem.Product2Id = prod.Id;
         opItem.PricebookEntryId = standardPrice.Id;
         opItem.UnitPrice = standardPrice.UnitPrice;
         opItem.Quantity =1;
         lstOpItem.add(opItem);
     }
     insert lstOpItem;
     List<Opportunity> opLst2 = new List<Opportunity>();
     for (integer i=0;i<opLst.size();i++)
     {
         opLst[i].Service_Item_List__c='A00373;';
     }
     update opLst;
     
     Test.startTest();
     //  BatchableFlipSaleStagePensionRenewals createSale = new BatchableFlipSaleStagePensionRenewals(null);
     BatchableFlipSaleStagePensionRenewals createSale = new BatchableFlipSaleStagePensionRenewals();
     Id batchId = Database.executeBatch(createSale);
     Test.stopTest();
     List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
     System.debug('Opportunity'+query);   
     //System.assertEquals(query.size(),20);
     for(Opportunity opp: query)
     {
        System.assertEquals(opp.StageName, 'Closed Lost');
         
     }
    }
    // TEST 1 END
    
    static testMethod void testMethod2()
    {   
     Account acc = [Select id from Account];
     Campaign camp =[Select id from Campaign where Name = 'Pension Renewals'];
     Product2 prod2 =[Select id from Product2 where Name = 'Annual List'];
     Id pricebookId = Test.getStandardPricebookId();
     PricebookEntry standardPrice2 = [Select id,UnitPrice from PricebookEntry where Pricebook2Id =: pricebookId AND Product2Id =: prod2.Id];
     List<Entities__c> entLst = new List<Entities__c>();
     for(Integer i=0;i<5;i++)
     {
         Entities__c myEnt = new Entities__c();
         myEnt.Primary_Client__c = acc.id;    
         myEnt.Name = 'Entity_1';
         myEnt.Origin__c = 'Anderson';
         myEnt.Organization_State__c = 'Maine';
         myEnt.SLA__c ='No Service';
         myEnt.PlanType__c = 'Profit Sharing Plan';
         Date mydate = date.parse('4/24/2021');
         myEnt.Prepaid_SLA_Date__c = mydate;
         myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
         entLst.add(myEnt);
     }
     insert entLst;
     List<Opportunity> opLst = new List<Opportunity>();
     for (Integer i = 0; i<entLst.size(); i++)
     {
         
         Opportunity op = new Opportunity();
         op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
         op.AccountId = acc.Id;
         op.Name ='Annual Plan Maintenance';
         op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
         op.Entity__c = entLst[i].Id;
         op.Campaign__c = camp.Id;
         op.StageName ='Qualification';
         opLst.add(op);
     }
     
     insert opLst;
     List <OpportunityLineItem> lstOpItem = new List<OpportunityLineItem>();
     for(Integer i=0;i<opLst.size();i++)
     {
         OpportunityLineItem opItem = new OpportunityLineItem();
         opItem.OpportunityId = opLst[i].Id;
         opItem.Product2Id = prod2.Id;
         opItem.PricebookEntryId = standardPrice2.Id;
         opItem.UnitPrice = standardPrice2.UnitPrice;
         opItem.Quantity =1;
         lstOpItem.add(opItem);
     }
     insert lstOpItem;
     List<Opportunity> opLst2 = new List<Opportunity>();
     for (integer i=0;i<opLst.size();i++)
     {
         opLst[i].Service_Item_List__c='A00723;';
     }
     update opLst;
     
     Test.startTest();
     //  BatchableFlipSaleStagePensionRenewals createSale = new BatchableFlipSaleStagePensionRenewals(null);
     BatchableFlipSaleStagePensionRenewals createSale = new BatchableFlipSaleStagePensionRenewals();
     Id batchId = Database.executeBatch(createSale);
         List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
     System.debug('Opportunity'+query);   
     //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
     {
        System.assertEquals(opp.StageName, 'Qualification');
         
     }
     Test.stopTest();
    
     
    }
}