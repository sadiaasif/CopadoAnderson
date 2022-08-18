@isTest
public with sharing class OpportunityRenewalTest {
    
    @testSetup
    public static void TestOpportunityRenewal() {
    
    id standardRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
    id stateRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
 
    // create opportunity
    Opportunity o1 = new Opportunity(name='test',stagename = 'Qualification', closeDate = system.today(), recordTypeId = standardRecordTypeId, Renewal_effective_Date__c = system.today(), Renewal_State__c='Alaska');
    Opportunity oppWithEntity = new Opportunity(name='testEntity',stagename = 'Qualification', closeDate = system.today(), recordTypeId = standardRecordTypeId, Renewal_effective_Date__c = system.today(), Renewal_State__c='Montana ',Entity_Type__c='LP');
    Opportunity oppWithoutRenewalMapped = new Opportunity(name='testEntity',stagename = 'Qualification', closeDate = system.today(), recordTypeId = standardRecordTypeId, Renewal_effective_Date__c = system.today(), Renewal_State__c='Florida');
    Opportunity o2 = new Opportunity(name='test2',stagename = 'Closed Won', closeDate = system.today(), recordTypeId = stateRecordTypeId, Renewal_effective_Date__c = system.today());

    insert o1;
    insert o2;
    insert oppWithEntity;
    insert oppWithoutRenewalMapped;

    list<saleEntity__c> se = new list<SaleEntity__c>();
    // add sales entities
    SaleEntity__c se1 = new SaleEntity__c(name = 'test1', Opportunity__c = o1.id);
    SaleEntity__c se2 = new SaleEntity__c(name = 'test2', Opportunity__c = o1.id);
    SaleEntity__c se3 = new SaleEntity__c(name = 'test3', Opportunity__c = o1.id);
    
    se.add(se1);
    se.add(se2);
    se.add(se3);
    insert se;

    }
    
    @isTest
    public static void updateOpps() {
     
        List<Opportunity> oppList = [SELECT Id, StageName FROM Opportunity];
        List<Opportunity> updateList = new List<Opportunity>();
        
        for (Opportunity o : oppList) {
            
            o.StageName = 'Closed Won';
            updateList.add(o);
        }
        
        update updateList;
        
    }
}