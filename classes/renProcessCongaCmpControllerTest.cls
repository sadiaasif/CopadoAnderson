@isTest
public class renProcessCongaCmpControllerTest {
    
    @testSetup
    public static void createTestData(){
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        newAcc.First_Name__c = 'Bob';
        newAcc.Last_Name__c = 'Apples';
        insert newAcc;
        
        Entities__c newEnt = new Entities__c();
        newEnt.Name = 'Test Entities';
        newEnt.Organization_State__c = 'Maine';
        newEnt.Origin__c = 'Anderson';
        newEnt.Primary_Client__c = newAcc.Id;
        insert newEnt;
    }
    
    @isTest
    public static void runRenProcessCongaLogic(){
        
        Entities__c ent = [SELECT Id FROM Entities__c LIMIT 1];
        
        renProcessCongaCmpController.prepareRenProcConga(ent.Id);
        renProcessCongaCmpController.prepareRenProcConga(ent.Id);
    }
}