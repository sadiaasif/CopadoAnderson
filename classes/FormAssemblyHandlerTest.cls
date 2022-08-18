@isTest
public class FormAssemblyHandlerTest {
    
    @testSetup
    public static void setupData(){
        
        Account a = new Account();
        a.Name = '123';
        insert a;
       
    }
    
    
	@isTest
    public static void createOpp(){
        
        Account a = [SELECT Id FROM Account];
        
        Opportunity newOpp = new Opportunity();
        
        newOpp.Name = 'Test Opp';
        newOpp.AccountId = a.id;
        newOpp.CloseDate = system.today();
        newOpp.StageName = 'Qualification';
        insert newOpp;
        
        Opportunity opp = [SELECT Id, DocuSign_Payment_Form__c FROM Opportunity LIMIT 1];
        
        List<Id> oppIdList = new List<Id>();
        
        oppIdList.add(opp.Id);
        
        formAssemblyHandler.createSecureQueryParameter(oppIdList);

        
    }
    
    
}