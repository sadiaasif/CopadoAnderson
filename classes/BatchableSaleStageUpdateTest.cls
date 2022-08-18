@isTest
private class BatchableSaleStageUpdateTest {
    @testSetup
    static void setup() 
    {
         insert new BatchRetryAttempts__c(Name='BatchableSaleStageUpdate',Current_Iteration__c=1,Maximum_Iteration__c=3);
 		Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;
        Campaign camp = new Campaign();
        camp.Name = 'Pension Renewals';
        camp.Status='planned';
        camp.IsActive=true;
        insert camp;
        List<Entities__c> updateList = new List<Entities__c>();
        for(Integer i=0;i<20;i++)
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
       
    }
    static testMethod void testMethod1()
    {
         List<Opportunity> updateList2 = new List<Opportunity>();
        for (Integer i = 0; i<10; i++)
        {
            //Account acc = [SELECT Id FROM Account WHERE Name='Test Batch 3' LIMIT 1];
            Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;
            Campaign camp = [SELECT Id FROM Campaign WHERE Name='Pension Renewals' LIMIT 1];
            Opportunity op = new Opportunity();
            op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
            op.AccountId = acc.Id;
            op.Name ='Annual Plan Maintenance';
            op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            //op.Entity__c = myEnt.Id;
            op.Campaign__c = camp.Id;
            op.StageName ='Qualification';
            updateList2.add(op);
        }
        
        insert updateList2;
     	Test.startTest();
        BatchableSaleStageUpdate createSale = new BatchableSaleStageUpdate();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
		List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
    }
    
    
    
     static testMethod void testMethod2()
    {
         List<Opportunity> updateList2 = new List<Opportunity>();
        for (Integer i = 0; i<2; i++)
        {
            //Account acc = [SELECT Id FROM Account WHERE Name='Test Batch 3' LIMIT 1];
            Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;
            Campaign camp = [SELECT Id FROM Campaign WHERE Name='Pension Renewals' LIMIT 1];
            Opportunity op = new Opportunity();
            op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
            op.AccountId = acc.Id;
            op.Name ='Annual Plan Maintenance';
            op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            //op.Entity__c = myEnt.Id;
            op.Campaign__c = camp.Id;
            op.StageName ='Closed Won';
            updateList2.add(op);
        }
        
        insert updateList2;
     	Test.startTest();
        BatchableSaleStageUpdate createSale = new BatchableSaleStageUpdate();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
		List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Won');
        }
    }
    
    static testMethod void testMethod3()
    {
         List<Opportunity> updateList2 = new List<Opportunity>();
        for (Integer i = 0; i<2; i++)
        {
            //Account acc = [SELECT Id FROM Account WHERE Name='Test Batch 3' LIMIT 1];
            Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;
            Campaign camp = [SELECT Id FROM Campaign WHERE Name='Pension Renewals' LIMIT 1];
            Opportunity op = new Opportunity();
            op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
            op.AccountId = acc.Id;
            op.Name ='Annual Plan Maintenance';
            op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            //op.Entity__c = myEnt.Id;
            op.Campaign__c = camp.Id;
            op.StageName ='Fulfillment/Partial Payment';
            updateList2.add(op);
        }
        
        insert updateList2;
     	Test.startTest();
        BatchableSaleStageUpdate createSale = new BatchableSaleStageUpdate();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
		List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Fulfillment/Partial Payment');
        }
    }
    
    static testMethod void testMethod4()
    {
         List<Opportunity> updateList2 = new List<Opportunity>();
        for (Integer i = 0; i<2; i++)
        {
            //Account acc = [SELECT Id FROM Account WHERE Name='Test Batch 3' LIMIT 1];
            Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;
            Campaign camp = [SELECT Id FROM Campaign WHERE Name='Pension Renewals' LIMIT 1];
            Opportunity op = new Opportunity();
            op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
            op.AccountId = acc.Id;
            op.Name ='Annual Plan Maintenance';
            op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            //op.Entity__c = myEnt.Id;
            op.Campaign__c = camp.Id;
            op.StageName ='Closed Lost';
            updateList2.add(op);
        }
        
        insert updateList2;
     	Test.startTest();
        BatchableSaleStageUpdate createSale = new BatchableSaleStageUpdate();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
		List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Closed Lost');
        }
    }
    
    static testMethod void testMethod5()
    {
         List<Opportunity> updateList2 = new List<Opportunity>();
        for (Integer i = 0; i<2; i++)
        {
            //Account acc = [SELECT Id FROM Account WHERE Name='Test Batch 3' LIMIT 1];
            Account acc = new Account();
        acc.Name = 'Test Batch 3';
        insert acc;
            Campaign camp = [SELECT Id FROM Campaign WHERE Name='Pension Renewals' LIMIT 1];
            Opportunity op = new Opportunity();
            op.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
            op.AccountId = acc.Id;
            op.Name ='Annual Plan Maintenance';
            op.CloseDate = Date.newInstance(Date.today().Year(), 08, 31);
            //op.Entity__c = myEnt.Id;
            op.Campaign__c = camp.Id;
            op.StageName ='Fulfillment/Partial Payment';
            updateList2.add(op);
        }
        
        insert updateList2;
     	Test.startTest();
        BatchableSaleStageUpdate createSale = new BatchableSaleStageUpdate();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
		List<Opportunity> query =[Select id,Name,Entity__c,StageName,RecordType.Name,CloseDate from Opportunity];
		System.debug('Opportunity'+query);  
       // System.assertEquals(query.size(),10);
        for(Opportunity opp:query)
        {
            System.assertEquals(opp.StageName,'Fulfillment/Partial Payment');
        }
    }
   /* @isTest
      private static void testClass()
    {
        Test.startTest();
        BatchableSaleStageUpdate controller = new BatchableSaleStageUpdate();
        //BatchableSaleStageUpdate updateEntity = new BatchableSaleStageUpdate(null);
        //Id batchId = Database.executeBatch(updateEntity);
        Test.stopTest();
        
        
    }*/
    
    

}