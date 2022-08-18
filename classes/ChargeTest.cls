@isTest
public class ChargeTest {
    
    @testSetup
    static void dataSetup() {
        Account acctest = new Account(
            Name='Test Account1',
            First_Name__c='Edward',
            Last_Name__c='Lee'
           );
        insert acctest;
        Credit_Card_Detail__c  ccd = new Credit_Card_Detail__c ();
        ccd.Account__c = acctest.Id;
        ccd.Card_Month__c = '04';
        ccd.Card_Number__c = '1234567896541236';
        ccd.Card_Security__c = '777';
        ccd.Card_Type__c = 'visa';
        ccd.Card_Year__c = '2020'; 
        ccd.Platinum_Subscription_Card__c = true;
        insert ccd;
        ChargentBase__Gateway__c cb = new ChargentBase__Gateway__c ();
        cb.Name = 'AuthorizeNetTestPayment';
        cb.ChargentBase__Active__c = true;
        cb.ChargentBase__Available_Payment_Methods__c = 'Credit Card';
        //cb.ChargentBase__Default_Payment_Method_for_PC__c = 'Credit Card';
        insert cb;
        /*ChargentBase__Gateway__c cbb = new ChargentBase__Gateway__c ();
        cbb.Name = 'Platinum';
        cbb.ChargentBase__Active__c = true;
        cb.ChargentBase__Available_Payment_Methods__c = 'Credit Card';
        insert cbb;*/
        String cardnumberVal= '123456789654';
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.StageName = 'Closed Won';
        opp.AccountId = acctest.Id;
        opp.CloseDate = Date.newInstance(2018, 09, 1);
        opp.Amount=0.01;
   
        //opp.QB_Invoice_Number__c = '1234';
        opp.ChargentSFA__Card_Number__c = cardnumberVal;
        insert opp;
          ChargentSFA__Transaction__c trans = new ChargentSFA__Transaction__c();
        trans.ChargentSFA__Type__c = 'Charge';
        trans.ChargentSFA__Response_Status__c = 'Success';
        trans.ChargentSFA__Amount__c = 35;
        trans.ChargentSFA__Gateway_Date__c=Date.newInstance(2020, 11, 10);
         trans.ChargentSFA__Response__c='Approved';
        trans.ChargentSFA__Opportunity__c=opp.id;
        insert trans;
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Testing';
        opp2.StageName = 'Closed Won';
        opp2.AccountId = acctest.Id;
        opp2.CloseDate = Date.newInstance(2018, 09, 10);
        //opp.QB_Invoice_Number__c = '12345';
        opp.ChargentSFA__Card_Number__c = cardnumberVal;
        insert opp2;
        
        ChargentSFA__Transaction__c obj = new ChargentSFA__Transaction__c();
        obj.ChargentSFA__Type__c = 'Charge';
        obj.ChargentSFA__Response_Status__c = 'Success';
        obj.ChargentSFA__Amount__c = 100;
        obj.ChargentSFA__Opportunity__c=opp2.id;
        obj.ChargentSFA__Response__c='Approved';
         obj.ChargentSFA__Gateway_Date__c=Date.newInstance(2020, 11, 10);
        insert obj;
        
        Task tsk=new Task();
        tsk.WhatId = acctest.id;
        tsk.Subject = 'Tax Payment Received';
        tsk.Status = 'open';
        tsk.Priority = 'Normal';
        insert tsk;
        RecordType rt = [SELECT Id FROM RecordType WHERE sObjectType = 'Task' AND Name = 'Call'];
    }
    static testMethod void testCharge() {
        Account acc = [ SELECT Id FROM Account LIMIT 1 ];
        Opportunity opp=[select id,RecordTypeId from Opportunity LIMIT 1];
        RecordType rId = [SELECT Id, Name FROM RecordType where Id = :opp.RecordTypeId LIMIT 1];
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();              
        req.requestURI = '/services/apexrest/Charge/' + opp.Id;
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;
        String ch = ChargeAPI.Charge();    
            
    }
      static testMethod void testChargePlatinumReinstatementAPI() {
        Account acc = [ SELECT Id FROM Account LIMIT 1 ];
        Opportunity opp=[select id,RecordTypeId from Opportunity LIMIT 1];
        RecordType rId = [SELECT Id, Name FROM RecordType where Id = :opp.RecordTypeId LIMIT 1];
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();              
        req.requestURI = '/services/apexrest/ChargePlatinumReinstatement/' + opp.Id;
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;
        String ch = ChargePlatinumReinstatementAPI.ChargePlatinumReinstatement();    
            
    }
}