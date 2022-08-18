@isTest
public class Opportunity_BeforeDeleteHelperTest {
   
    @testSetup
    public static void testSetup(){
        
        Account a = new Account();
        a.First_Name__c = 'Test';
        a.Last_Name__c = 'Name';
        a.Name = '123';
        a.E_Mail__c = 'Test@gmail.com';
        a.BadgeServiceItems__c = 'A10101;A10102;';
        
        Account a1 = new Account();
        a1.First_Name__c = 'Test';
        a1.Last_Name__c = 'Name 1';
        a1.Name = '123';
        a1.E_Mail__c = 'Test@gmail.com';
        a1.BadgeServiceItems__c = 'A10101;A10102;';
        
        insert new List<Account>{a,a1};
        
        Opportunity Sale = new Opportunity();
        Sale.AccountId = a.Id;
        Sale.Name = 'Test Opp';
        Sale.CloseDate = system.today();
        Sale.StageName = 'Closed Won';
        Sale.Service_Item_List__c = 'A62554;A62553;A62556;A52211;';
       // Sale.Service_Items_Quantities__c = 'A62554:4;A62553:3;A62556:2;A52211:1;';
        Sale.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Sale.Admin_Portal_Sale__c = False;
        Sale.Override_Automation__c	= True;
        
        Opportunity Sale1 = new Opportunity();
        Sale1.AccountId = a.Id;
        Sale1.Name = 'Test Opp 1';
        Sale1.CloseDate = system.today();
        Sale1.StageName = 'Closed Won';
        Sale1.Service_Item_List__c = 'A62554;A62553;A62556;A52211;';
        Sale1.Service_Items_Quantities__c = 'A62554:4;A62553:3;A62556:2;A52211:1;';
        Sale1.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Sale1.Admin_Portal_Sale__c = False;
        Sale1.Override_Automation__c	= True;
        
        Opportunity Sale2 = new Opportunity();
        Sale2.AccountId = a1.Id;
        Sale2.Name = 'Test Opp 3';
        Sale2.CloseDate = system.today();
        Sale2.StageName = 'Closed Won';
        Sale2.Service_Item_List__c = 'A62554;A62553;A62556;A52211;';
        Sale2.Service_Items_Quantities__c = 'A62554:4;A62553:3;A62556:2;A52211:1;';
        Sale2.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Sale2.Admin_Portal_Sale__c = False;
        Sale2.Override_Automation__c	= True;
     
        insert new List<Opportunity>{sale,sale1,sale2};
           
    }
    
    
    @isTest
    public static void updateClientCritieraTest(){
        
        Test.startTest();
        list<Opportunity> opps = [Select Id,Service_Item_List__c from  Opportunity Where Name IN ('Test Opp','Test Opp 3') Limit 2];
        delete opps;
        Test.stopTest();
    }
    
    @isTest
    public static void deedPackageTest(){
        
        Test.startTest();
        List<Account_Deeds_Badges__mdt> accBadgeLst = [Select id,ASID__c,Automation_Type__c,Service_Weight__c from Account_Deeds_Badges__mdt];
        Map<Id,List<Opportunity>> accMap = new Map<Id,List<Opportunity>>();
        
        for(Opportunity opp : [SELECT Id, AccountId, Account.BadgeServiceItems__c, Service_Item_List__c, StageName, Name FROM Opportunity]) 
        {
		if(accMap.containsKey(opp.AccountId)) {
		List<Opportunity> oppid = accMap.get(opp.AccountId);
		//oppid.add(opp.id);
		accMap.put(opp.AccountId,oppid);
       Account_RollUpFields.deedPackage(accMap,accBadgeLst);
        }
        }
        Test.stopTest();
    }
    
    
 @isTest
    public static void prepareServiceQuantitiesMapTest(){
        
        Test.startTest();
        String serviceitemlist = 'A00423;A00199;A00421;';
        Account_RollUpFields.prepareServiceQuantitiesMap(serviceitemlist);
        Test.stopTest();
    }
    
    
}