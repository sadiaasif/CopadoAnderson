@isTest
public class CustomPaymentApiTest {
    
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
        insert cb;
        ChargentBase__Gateway__c cbb = new ChargentBase__Gateway__c ();
        cbb.Name = 'Platinum';
        cbb.ChargentBase__Active__c = true;
        cbb.Platinum_Website_Gateway__c = 'Yes';
        cbb.ChargentBase__Available_Payment_Methods__c = 'Credit Card';
        insert cbb;
        String cardnumberVal= '123456789654';
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.StageName = 'Closed Won';
        opp.AccountId = acctest.Id;
        opp.CloseDate = Date.newInstance(2018, 09, 1);
        //opp.QB_Invoice_Number__c = '1234';
        opp.ChargentSFA__Card_Number__c = cardnumberVal;
        insert opp;
        
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Testing';
        opp2.StageName = 'Closed Won';
        opp2.AccountId = acctest.Id;
        opp2.CloseDate = Date.newInstance(2018, 09, 10);
        //opp.QB_Invoice_Number__c = '12345';
        opp.ChargentSFA__Card_Number__c = cardnumberVal;
        insert opp2;
        
    }
    static testMethod void testGet() {
        Account acc = [ SELECT Id FROM Account LIMIT 1 ];
        Opportunity opp=[select id from Opportunity LIMIT 1];
        Credit_Card_Detail__c cc=[select id from Credit_Card_Detail__c LIMIT 1];
        
        List<Opportunity> commaSepIds = [select Id from Opportunity LIMIT 10];
        String[] tmp1 = New String[]{};
            for(Opportunity op : commaSepIds){
                tmp1.add(op.id);
            }
        String idString = string.join(tmp1,',');
        system.debug(' == idString === ' + idString);
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();             
        req.requestURI = '/services/apexrest/CustomPayment/';
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response= res;
        string s=CustomPaymentApi.getOppId(idString,cc.id);        
    }
    static testMethod void testGet2() {
        Account acc1 = [ SELECT Id FROM Account LIMIT 1 ];
        Opportunity opp2=[select id from Opportunity LIMIT 1];
        Credit_Card_Detail__c cc=[select id from Credit_Card_Detail__c LIMIT 1];
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();             
        req.requestURI = '/services/apexrest/CustomPayment/';
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response= res;
        string s=CustomPaymentApi.getOppId(opp2.id,cc.id);        
    }
}