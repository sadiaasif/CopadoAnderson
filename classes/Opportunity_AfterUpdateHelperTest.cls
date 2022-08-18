@isTest
public class Opportunity_AfterUpdateHelperTest {
    
    @testSetup
    public static void testSetup(){
        
        Account a = new Account();
        a.First_Name__c = 'Test';
        a.Last_Name__c = 'Name';
        a.Name = '123';
        a.E_Mail__c = 'Test@gmail.com';
        a.BadgeServiceItems__c = 'A10101;A10102;';
        insert a;
        
        Opportunity Sale = new Opportunity();
        Sale.AccountId = a.Id;
        Sale.Name = 'Test Opp';
        Sale.CloseDate = system.today();
        Sale.StageName='Qualification';
        Sale.Service_Item_List__c = 'A62554;A62553;A62556;A52211;';
         Sale.Service_Items_Quantities__c = 'A62554:4;A62553:3;A62556:2;A52211:1;';
        Sale.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Sale.Admin_Portal_Sale__c = False;
        Sale.Override_Automation__c	= True;
        insert sale;
    }
    
    
    @isTest
    public static void updateClientCritieraTest(){
        
        Test.startTest();
        Opportunity opp = [Select Id,Service_Item_List__c from  Opportunity Where Name = 'Test Opp' Limit 1];
        opp.StageName = 'Closed Won';
        update opp;
        Test.stopTest();
    }
    
    
}