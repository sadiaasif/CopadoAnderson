@isTest
public class AddCardinfoComponentCtrlTest {

     @testSetup static void setup() {
        // Create common test accounts
       Account testAccount = new Account();
            testAccount.Name='Bobby Apples' ;
            testAccount.First_Name__c='Bobby';
            testAccount.Last_Name__c='Apples';
        testAccount.phone='123456782';
         
            insert testAccount;        
    }
    
   @isTest static void ctrlAddCardInformationdropdownTest() {
      
      Account acct = [SELECT Id FROM Account WHERE First_Name__c ='Bobby' LIMIT 1];
    
      Credit_Card_Detail__c ccd = new Credit_Card_Detail__c();
      ccd.Name = 'Test Credit';
      ccd.Account__c = acct.Id;
      ccd.Card_Type__c='Test1';
      ccd.Card_Number__c='42222';
      ccd.Card_Security__c='2222';
        ccd.Billing_Zip_Postal__c='89052';
      
      insert ccd;
   
       Opportunity opp = new Opportunity();
      opp.Name = 'Test Opp';
      opp.AccountId = acct.Id;
      opp.StageName = 'Qualification';
      opp.CloseDate = system.today();
       opp.RecordTypeID='012U0000000g5s4'; //Platinum Subscription
            insert opp;
        test.startTest();
        

    
       
	AddCardinfoComponenentCtrl.cardinformation(opp.id);
       
       
    
        test.stopTest();
        
    }
       @isTest static void UpdateCardInformationTest() {
      
      Account acct = [SELECT Id FROM Account WHERE First_Name__c ='Bobby' LIMIT 1];
    
      Credit_Card_Detail__c ccd = new Credit_Card_Detail__c();
      ccd.Name = 'Test Credit';
      ccd.Account__c = acct.Id;
      ccd.Card_Type__c='Test1';
      ccd.Card_Number__c='';
      ccd.Card_Security__c='2222';
        ccd.Billing_Zip_Postal__c='89052';
      
      insert ccd;
   
       Opportunity opp = new Opportunity();
      opp.Name = 'Platinum Subscription';
      opp.AccountId = acct.Id;
      opp.StageName = 'Qualification';
      opp.CloseDate = system.today();
       opp.RecordTypeID='012U0000000g5s4';
            insert opp;
        test.startTest();
    AddCardinfoComponenentCtrl.Updateinformationcard(opp.id,ccd.id);
   
       
	Opportunity oppupdatedList=[Select Id,name from Opportunity where name='Platinum Subscription'];
       
       
     
        test.stopTest();
        
    }
}