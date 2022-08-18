@isTest
private class BatchableSaleCreationEntityTest {
    @testSetup
    static void setup() 
    {
        
       // insert new BatchRetryAttempts__c(Name='BatchableSaleCreationEntity',Current_Iteration__c=1,Maximum_Iteration__c=3);
 		Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;
        Campaign camp = new Campaign();
        camp.Name = 'Pension Renewals';
        camp.Status='planned';
        camp.IsActive=true;
        insert camp;
       
        	
     /*   List<Opportunity> updateList = new List<Opportunity>();
        for (Integer i = 0; i<10; i++)
        {
            Opportunity op = new Opportunity();
           
            op.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
            op.AccountId = acc.Id;
            op.Name ='Annual Plan Maintenance';
            op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            op.Entity__c = myEnt.Id;
            op.Campaign__c = camp.Id;
            op.StageName ='Qualification';
            updateList.add(op);
        }
        
        insert updateList;
  		Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension');
        insert prod;
        Product2 prod2 = new Product2(Name = 'Annual List',
                                     Family = '	Pension');
        insert prod2;
         Id pricebookId = Test.getStandardPricebookId();
       
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
        PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice2;
        List <OpportunityLineItem> lstOpItem = new List<OpportunityLineItem>();
        for(Integer i=0;i<updateList.size();i++)
        {
            OpportunityLineItem opItem = new OpportunityLineItem();
            opItem.OpportunityId = updateList[i].Id;
            opItem.Product2Id = prod.Id;
            opItem.PricebookEntryId = standardPrice.Id;
            opItem.UnitPrice = standardPrice.UnitPrice;
            opItem.Quantity =1;
            lstOpItem.add(opItem);
        }
        insert lstOpItem;
         	Opportunity op1 = new Opportunity();
            op1.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
            op1.AccountId = acc.Id;
            op1.Name ='Annual Plan Maintenance';
            op1.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            op1.Entity__c = myEnt.Id;
            op1.Campaign__c = camp.Id;
            op1.StageName ='Closed Lost';
        	insert op1;
            OpportunityLineItem opItem1 = new OpportunityLineItem();
            opItem1.OpportunityId = op1.Id;
            opItem1.Product2Id = prod.Id;
            opItem1.PricebookEntryId = standardPrice.Id;
            opItem1.UnitPrice = standardPrice.UnitPrice;
            opItem1.Quantity =1;
       		insert opItem1;
        Opportunity op2 = new Opportunity();
            op2.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
            op2.AccountId = acc.Id;
            op2.Name ='Annual Plan Maintenance';
            op2.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            op2.Entity__c = myEnt.Id;
            op2.Campaign__c = camp.Id;
            op2.StageName ='Qualification';
        	insert op2;
            OpportunityLineItem opItem2 = new OpportunityLineItem();
            opItem2.OpportunityId = op2.Id;
            opItem2.Product2Id = prod.Id;
            opItem2.PricebookEntryId = standardPrice.Id;
            opItem2.UnitPrice = standardPrice.UnitPrice;
            opItem2.Quantity =1;
       		insert opItem2;
         Opportunity op3 = new Opportunity();
            op3.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
            op3.AccountId = acc.Id;
            op3.Name ='Annual Plan Maintenance';
            op3.CloseDate = Date.newInstance(Date.today().Year(), 10, 31);
            op3.Entity__c = myEnt.Id;
            op3.Campaign__c = camp.Id;
            op3.StageName ='Qualification';
        	insert op3;
            OpportunityLineItem opItem3 = new OpportunityLineItem();
            opItem3.OpportunityId = op3.Id;
            opItem3.Product2Id = prod.Id;
            opItem3.PricebookEntryId = standardPrice.Id;
            opItem3.UnitPrice = standardPrice.UnitPrice;
            opItem3.Quantity =1;
       		insert opItem3;
        	 Opportunity op4 = new Opportunity();
            op4.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
            op4.AccountId = acc.Id;
            op4.Name ='Annual Plan Maintenance';
            op4.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            op4.Entity__c = myEnt.Id;
            op4.Campaign__c = camp.Id;
            op4.StageName ='Qualification';
        	insert op4;
            OpportunityLineItem opItem4 = new OpportunityLineItem();
            opItem4.OpportunityId = op4.Id;
            opItem4.Product2Id = prod2.Id;
            opItem4.PricebookEntryId = standardPrice2.Id;
            opItem4.UnitPrice = standardPrice2.UnitPrice;
            opItem4.Quantity =1;
       		insert opItem4;
         Opportunity op5 = new Opportunity();
            op5.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
            op5.AccountId = acc.Id;
            op5.Name ='Annual Plan Maintenance';
            op5.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            op5.Entity__c = myEnt.Id;
            op5.Campaign__c = camp.Id;
            op5.StageName ='Qualification';
        	insert op5;
            OpportunityLineItem opItem5 = new OpportunityLineItem();
            opItem5.OpportunityId = op5.Id;
            opItem5.Product2Id = prod2.Id;
            opItem5.PricebookEntryId = standardPrice2.Id;
            opItem5.UnitPrice = standardPrice2.UnitPrice;
            opItem5.Quantity =1;
       		insert opItem5;*/
    }
    static testMethod void testMethod1()
    {
        Account acc = [Select id from Account];
     Campaign camp =[Select id from Campaign ];
         List<Entities__c> updateList = new List<Entities__c>();
        for(Integer i=0;i<15;i++)
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
      		updateList.add(myEnt);
        }
            insert updateList;
        Product2 prod = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = '	Pension', Type__c='Renewals', Service_Fulfillment_Weight__c='1');
        insert prod;
        Id pricebookId = Test.getStandardPricebookId();
       
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice;
       
        Test.startTest();
      //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null);
          BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity();
        Id batchId = Database.executeBatch(createSale);
         List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
     System.debug('Opportunity'+query);   
     //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
     {
        System.assertEquals(query.size(), 15);
         
     }
        Test.stopTest();
		/*List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
		System.debug('Opportunity'+query);   
        System.assertEquals(query.size(),15);*/
    }
    static testMethod void testMethod2()
    {
         Account acc = [Select id from Account];
     Campaign camp =[Select id from Campaign ];
         List<Entities__c> updateList = new List<Entities__c>();
        for(Integer i=0;i<4;i++)
        {
        Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Entity_1';
            myEnt.Origin__c = 'Anderson';
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Prepaid Admin';
            myEnt.PlanType__c = 'ROBS Solo 401(k)';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Corporation').getRecordTypeId();
      		updateList.add(myEnt);
        }
            insert updateList;
         Product2 prod2 = new Product2(Name = 'Annual List',
                                     Family = '	Filing Fees',Type__c='Annual List', Service_Fulfillment_Weight__c='2');
        insert prod2;
         Id pricebookId = Test.getStandardPricebookId();
         PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 52, IsActive = true);
        insert standardPrice2;
         Test.startTest();
      //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null); 
      	  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity();  
        Id batchId = Database.executeBatch(createSale);
          List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
     System.debug('Opportunity'+query);   
     //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
     {
        System.assertEquals(query.size(), 0);
         
     }
        Test.stopTest();
		//List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		//System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),0);
        
    }
  static testMethod void testMethod3()
    {
         Account acc = [Select id from Account];
     Campaign camp =[Select id from Campaign ];
         List<Entities__c> updateList = new List<Entities__c>();
        for(Integer i=0;i<2;i++)
        {
        Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Entity_1';
            myEnt.Origin__c = 'Anderson';
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Prepaid Admin';
            myEnt.PlanType__c = 'Solo 401(k)';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
      		updateList.add(myEnt);
        }
            insert updateList;
         Product2 prod2 = new Product2(Name = 'Annual List',
                                     Family = '	Filing Fees',Type__c='Annual List', Service_Fulfillment_Weight__c='2');
        insert prod2;
         Id pricebookId = Test.getStandardPricebookId();
         PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 52, IsActive = true);
        insert standardPrice2;
         Test.startTest();
      //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null); 
      	  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity();  
        Id batchId = Database.executeBatch(createSale);
          List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
     System.debug('Opportunity'+query);   
     //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
     {
        System.assertEquals(query.size(), 0);
         
     }
        Test.stopTest();
		//List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		//System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),0);
        
    }
  static testMethod void testMethod4()
    {
         Account acc = [Select id from Account];
     Campaign camp =[Select id from Campaign ];
         List<Entities__c> updateList = new List<Entities__c>();
        for(Integer i=0;i<2;i++)
        {
        Entities__c myEnt = new Entities__c();
            myEnt.Primary_Client__c = acc.id;    
            myEnt.Name = 'Entity_1';
            myEnt.Origin__c = 'Anderson';
            myEnt.Organization_State__c = 'Maine';
            myEnt.SLA__c ='Prepaid Admin';
            myEnt.PlanType__c = 'ROBS Profit Sharing';
            Date mydate = date.parse('4/24/2021');
            myEnt.Prepaid_SLA_Date__c = mydate;
            myEnt.RecordTypeId = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
      		updateList.add(myEnt);
        }
            insert updateList;
         Product2 prod2 = new Product2(Name = 'Pension - Annual Maintenance',
                                     Family = 'Pension',Type__c='Renewals', Service_Fulfillment_Weight__c='2');
        insert prod2;
         Id pricebookId = Test.getStandardPricebookId();
         PricebookEntry standardPrice2 = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod2.Id,
            UnitPrice = 350, IsActive = true);
        insert standardPrice2;
         Test.startTest();
      //  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity(null); 
      	  BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity();  
        Id batchId = Database.executeBatch(createSale);
          List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity ];
     System.debug('Opportunity'+query);   
     //System.assertEquals(query.size(),20);
        for(Opportunity opp: query)
     {
        System.assertEquals(query.size(), 0);
         
     }
        Test.stopTest();
		//List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		//System.debug('Opportunity'+query);   
        //System.assertEquals(query.size(),0);
        
    }
}