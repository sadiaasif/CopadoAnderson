@isTest

private class TestctrlAddCardInformation{

     @testSetup static void setup() {
        // Create common test accounts
       Account testAccount = new Account();
            testAccount.Name='Bobby Apples' ;
            testAccount.First_Name__c='Bobby';
            testAccount.Last_Name__c='Apples';
        testAccount.phone='123456782';
         
            insert testAccount;        
    }
    
   @isTest static void ctrlAddCardInformationTest() {
      
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
       opp.RecordTypeID='012U0000000g5s4';
            insert opp;
        test.startTest();
       PageReference pageRef = Page.AddCardInformation;
  	pageRef.getParameters().put('id', String.valueOf(opp.Id));
  		Test.setCurrentPage(pageRef);      

      ApexPages.StandardController stdSR = new ApexPages.StandardController(opp);
     ctrlAddCardInformation Cardinfo=new ctrlAddCardInformation(stdSR);
       
	Cardinfo.informationcard();
       
       
       System.assertEquals('Test Credit-2222',Cardinfo.Selectcard, 'Please check !!! ');
        test.stopTest();
        
    }
       @isTest static void NoCardInformationTest() {
      
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
      opp.Name = 'Test Opp';
      opp.AccountId = acct.Id;
      opp.StageName = 'Qualification';
      opp.CloseDate = system.today();
       opp.RecordTypeID='012U0000000g5s4';
            insert opp;
        test.startTest();
       PageReference pageRef = Page.AddCardInformation;
  	pageRef.getParameters().put('id', String.valueOf(opp.Id));
  		Test.setCurrentPage(pageRef);      

      ApexPages.StandardController stdSR = new ApexPages.StandardController(opp);
     ctrlAddCardInformation Cardinfo=new ctrlAddCardInformation(stdSR);
       
	Cardinfo.informationcard();
       
       
       System.assertEquals('Test Credit',Cardinfo.Selectcard, 'Please check !!! ');
        test.stopTest();
        
    }
}