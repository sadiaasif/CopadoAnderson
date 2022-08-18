@isTest 
public class OpportunityBatchTest 
{
   
    
    @isTest
    static void testInsertClosedWonOpp() 
    {
        List<Opportunity> opplist = new List<Opportunity>();
        List<SaleEntity__c> saleEnts = new List<SaleEntity__c>();
        Campaign camp = new Campaign(Name = 'BCP', IsActive = TRUE);
        ChargentBase__Gateway__c gateway = 
            new ChargentBase__Gateway__c(Name = 'LV', 
                                         ChargentBase__Merchant_ID__c ='12345617',
                                         ChargentBase__Active__c = TRUE,
                                         ChargentBase__Security_Key__c = '1234567',
                                         RecordTypeId = Schema.SObjectType.ChargentBase__Gateway__c.getRecordTypeInfosByName().get('Network Merchants (NMI)').getRecordTypeId()
                                        );
        insert gateway;
        insert camp;
        
        BatchRunning__c BatchRunningObj = new BatchRunning__c(Batch_Name__c = 'OpportunityBatch', Is_Batch_Running__c = false);
        INSERT BatchRunningObj;
        
        integer i;
        
        Account a = new Account(
            Name = 'Test',
            First_Name__c = 'Test', 
            Last_Name__c = 'AccountA');
        insert a;
        
        for(i=0;i<5;i++)
        {
            Opportunity opp=new Opportunity();
            opp.Name = 'oppIns' + i;
            opp.StageName = 'Closed Won';
            opp.Description = 'Opportunites whose stage name is Closed Won at time of insertion itself';
            opp.CloseDate = Date.today();
            opp.Amount = 0.01;
            opp.AccountId = a.Id;
            opp.Sale_Campaign__c = camp.Id;
            opp.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
            opp.Renewal_effective_Date__c = Date.today()-2;
            opp.Renewal_State__c = 'California';
            opp.ChargentSFA__Gateway__c = gateway.Id;
            opp.Entity_Type__c = 'LP';
            opp.Pricebook2Id = Test.getStandardPricebookId();
            opp.Renewal_End_Date__c = Date.today().addDays(7);
            opp.ChargentSFA__Payment_Start_Date__c = Date.today();
            opplist.add(opp);     
        }
        
        for(i=0;i<5;i++)
        {
            Opportunity opp2 = new Opportunity();
            opp2.Name = 'oppIns' + i;
            opp2.StageName = 'Closed Won';
            opp2.Description = 'Opportunites whose stage name is Closed Won at time of insertion itself';
            opp2.CloseDate = Date.today();
            opp2.Amount = 0.01;
            opp2.AccountId = a.Id;
            opp2.Sale_Campaign__c = camp.Id;
            opp2.Pricebook2Id = Test.getStandardPricebookId();
            opp2.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
            opp2.Renewal_effective_Date__c = Date.today()-2;
            opp2.Renewal_State__c = 'California';
            opp2.Entity_Type__c = NULL;
            opp2.Renewal_End_Date__c = Date.today().addDays(7);
            opp2.ChargentSFA__Payment_Start_Date__c = Date.today();
            opplist.add(opp2);     
        }
        
        for(i=0;i<5;i++)
        {
            Opportunity opp3 = new Opportunity();
            opp3.Name = 'oppIns' + i;
            opp3.StageName = 'Closed Won';
            opp3.Description = 'Opportunites whose stage name is Closed Won at time of insertion itself';
            opp3.CloseDate = Date.today();
            opp3.Amount = 0.01;
            opp3.Pricebook2Id = Test.getStandardPricebookId();
            opp3.AccountId = a.Id;
            opp3.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
            opp3.Renewal_effective_Date__c = Date.today()-2;
            opp3.Renewal_End_Date__c = Date.today().addDays(7);
            opp3.ChargentSFA__Payment_Start_Date__c = Date.today();
            opplist.add(opp3);     
        } 
        
        insert opplist;
        
        SaleEntity__c se = new SaleEntity__c(
            Opportunity__c = opplist[0].Id
        );
        insert se;
        
        Product2 p = new Product2(
            Name = 'Service Item',
            Service_Fulfillment_Weight__c = '1',
            Type__c = 'LAW',
            IsActive = TRUE,
            Subscription_Product__c = TRUE
        );
        insert p;
        
        PricebookEntry pe = new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(),
            Product2Id = p.Id,
            UnitPrice = 500,
            IsActive = TRUE);
        insert pe;
        
        OpportunityLineItem li = new OpportunityLineItem(
            OpportunityId = oppList[0].Id,
            Product2Id = p.Id,
            PricebookEntryId = pe.Id,
            UnitPrice = 500,
            Quantity = 1);
        insert li;
   
        Test.startTest();
        OpportunityBatch tb = new OpportunityBatch();
        Id batchId = Database.executeBatch(tb);
        Test.stopTest();
        List <Opportunity> clonedOppList = [select Id, Name, StageName, Description from Opportunity where StageName != 'Closed Won'  and  Name like 'oppIns%']; //field 'Description' can not be filtered in a query call
        
       //system.assertequals(clonedOppList.size() , 15, '15 Opportunites should be cloned');
  }
}