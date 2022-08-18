@isTest(seeAllData=false)
public class EntityRenewalSalesHelperTest {
    
    @testsetup static void setupTestData(){
        Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Id profileId = [select id from profile where name='Partner Community User'].id;
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.phone='123456782';
        insert testAccount;
        
    }
    
    @isTest static void testEntityRenewal(){
        Account testAccount = [Select Id from Account LIMIT 1];
        
        Entities__c et = new Entities__c();
        et.RecordTypeId =Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Corporation').getRecordTypeId();
        et.Name ='Test Dec Entity';
        et.Origin__c = 'Anderson'; 
        et.Primary_Client__c =testAccount.id;
        et.Organization_State__c = 'Maine';
        et.Registered_Agent_Services__c = 'NWRA';
        et.Status__c = 'Sent To Processing';
        
        Test.startTest();
        insert et;
        
        et.Organizational_Date__c = date.today();
        update et; 
        Test.stopTest();
    }
}