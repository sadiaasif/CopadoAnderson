@isTest 
public class BadgeHelperTest {
    @isTest
    public static void BadgeHelperData(){
        
        Account a = new Account();
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        a.Name = '123';
        a.E_Mail__c = 'bazam123@gmail.com';
        a.BadgeServiceItems__c = 'A10101;A10102;';
        insert a;
  
        Opportunity Sale = new Opportunity();
        Sale.AccountId = a.Id;
        Sale.Name = 'Test Opp';
        Sale.CloseDate = system.today();
        Sale.StageName = 'Closed Won';
        Sale.Service_Item_List__c = 'A11001;A52211;';
        Sale.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Sale.Admin_Portal_Sale__c = False;
        Sale.Override_Automation__c	= True;
        Test.startTest();
        insert Sale;
        
        delete Sale;
        Test.stopTest();
        
    }
    @isTest
    public static void checkElse() {
        Account a = new Account();
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        a.Name = '123';
        a.E_Mail__c = 'bazam123@gmail.com';
        insert a;
        
        Opportunity Sale = new Opportunity();
        Sale.AccountId = a.Id;
        Sale.Name = 'Test Opp';
        Sale.CloseDate = system.today();
        Sale.StageName = 'Closed Won';
        Sale.Service_Item_List__c = 'A11001;A52211;';
        Sale.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Sale.Admin_Portal_Sale__c = False;
        Sale.Override_Automation__c	= True;
        insert Sale;
    }
}