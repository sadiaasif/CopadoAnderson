@isTest
public class Entity_BeforeUpdateHelperTest {
    
    @testSetup
    public static void isTest(){
        Account acc=new account();
        acc.Name='Test Account';
        acc.Important_Notes__c='Test Account';
        insert acc;
        
        Entities__c entity=new Entities__c();
        entity.Primary_Client__c=acc.id;
        entity.Name='Top Entity';
        entity.Organization_State__c='Georgia';
        entity.Structure__c='Manager-managed';
        entity.Registered_Agent_Services__c = 'NWRA';
        insert entity;
        
    }
    
    @isTest
    public static void populateRATest(){
        Test.startTest();
        Entities__c entity = [Select Id,Organization_State__c,Registered_Agent_Services__c from Entities__c];
        entity.Organization_State__c = 'Rhode Island';
        update entity;
        Test.stopTest();
        
    }
}