@isTest
public class TestUpdateInfinitySubscriptionSale {
	@testSetup static void dataSetup() {
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        
        Opportunity o = new Opportunity();
        o.Name = 'Infinity Subscription';
        o.CloseDate = system.today()+1;
        o.ChargentSFA__Payment_Start_Date__c = system.today();
        o.AccountId = a.id;
        o.StageName = 'Closed Won';
        o.ChargentSFA__Payment_Status__c = 'Recurring';
        o.RecordTypeId = '0120B000000N8E5QAK';
        insert o;   
    	
        Credit_Card_Detail__c infc = new Credit_Card_Detail__c();
        infc.Account__c = a.id;
        infc.Name = 'Infinity Card 1';
        infc.Card_Type__c = 'Visa';
        infc.Card_Number__c = '1234567891234567';
        infc.Card_Month__c = '08';
        infc.Card_Year__c = '2024';
        infc.Card_Security__c = '411';
        infc.Infinity_Subscription_Card__c = True;
        insert infc;
        
        Credit_Card_Detail__c infc2 = new Credit_Card_Detail__c();
        infc2.Account__c = a.id;
        infc2.Name = 'Infinity Card 2';
        infc2.Card_Type__c = 'Visa';
        infc2.Card_Number__c = '1234567891234567';
        infc2.Card_Month__c = '08';
        infc2.Card_Year__c = '2024';
        infc2.Card_Security__c = '411';
        infc2.Infinity_Subscription_Card__c = False;
        insert infc2;
    }
    
    @isTest
    public static void newPlatinumCard() {
        
        Account a = [Select Id From Account LIMIT 1];
        
        Credit_Card_Detail__c infinC1 = [Select Id From Credit_Card_Detail__c Where Infinity_Subscription_Card__c = True Limit 1];
        Credit_Card_Detail__c infinC2 = [Select Id From Credit_Card_Detail__c Where Infinity_Subscription_Card__c = False Limit 1];
        
        Opportunity opp = [Select Id,ChargentSFA__Card_Type__c,ChargentSFA__Card_Month__c,Card_Number__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Name__c FROM Opportunity];
        System.debug('opp: '+opp);
        
        List<Opportunity> oppList = new List<Opportunity>();
        oppList.add(opp);
        CreditCardInfo.processOpp(oppList);
        
        System.debug('infinC2: '+infinC2);
		infinC2.Infinity_Subscription_Card__c = True;
        update infinC2;
        System.debug('infinC2: '+infinC2);
        
        infinC1.Card_Security__c = '555';
        infinC1.Platinum_Subscription_Card__c = False;
        update infinC1;
        
        System.assertequals(True,infinC2.Infinity_Subscription_Card__c);
            
    }
}