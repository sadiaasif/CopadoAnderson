@isTest
public class saleCongaCmpControllerTest {
    
    @testSetup
    public static void createTestData(){
        Account newAcc = new Account();
        newAcc.Name = 'Test Account';
        newAcc.First_Name__c = 'Bob';
        newAcc.Last_Name__c = 'Apples';
        insert newAcc;
        
        Opportunity newOpp = new Opportunity();
        newOpp.Name = 'Test Opportunity';
        newOpp.StageName = 'Qualification';
        newOpp.CloseDate = system.today();
        newOpp.AccountId = newAcc.Id;
        insert newOpp;
    }
    
    @isTest
    public static void runSalesCongaLogic(){
        
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];
        
        saleCongaCmpController.prepareSalesConga(opp.Id);
        saleCongaCmpController.prepareSalesConga(opp.Id);
    }

}