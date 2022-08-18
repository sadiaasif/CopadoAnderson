@isTest
public class testUpdatePlatinumSale {
    
    @testSetup static void dataSetup() {
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        
        Opportunity o = new Opportunity();
        o.Name = 'Platinum Subscription';
        o.CloseDate = system.today();
        o.AccountId = a.id;
        o.StageName = 'Closed Won';
        insert o;     
    	
        Credit_Card_Detail__c c = new Credit_Card_Detail__c();
        c.Account__c = a.id;
        c.Name = 'Bazam, Inc.';
        c.Card_Type__c = 'Visa';
        c.Card_Number__c = '1234123412341234';
        c.Card_Month__c = '07';
        c.Card_Year__c = '2023';
        c.Card_Security__c = '411';
        c.Platinum_Subscription_Card__c = TRUE;
        insert c;
        
        Credit_Card_Detail__c c2 = new Credit_Card_Detail__c();
        c2.Account__c = a.id;
        c2.Name = 'Azani, Inc.';
        c2.Card_Type__c = 'Visa';
        c2.Card_Number__c = '1234567891234567';
        c2.Card_Month__c = '08';
        c2.Card_Year__c = '2024';
        c2.Card_Security__c = '411';
        c2.Platinum_Subscription_Card__c = False;
        insert c2;
    	
        Credit_Card_Detail__c infc = new Credit_Card_Detail__c();
        infc.Account__c = a.id;
        infc.Name = 'Infinity Card 1';
        infc.Card_Type__c = 'Visa';
        infc.Card_Number__c = '1234567891234567';
        infc.Card_Month__c = '08';
        infc.Card_Year__c = '2024';
        infc.Card_Security__c = '411';
        infc.Infinity_Subscription_Card__c = False;
        insert infc;
        
        Credit_Card_Detail__c infc2 = new Credit_Card_Detail__c();
        infc2.Account__c = a.id;
        infc2.Name = 'Infinity Card 2';
        infc2.Card_Type__c = 'Visa';
        infc2.Card_Number__c = '1234567891234567';
        infc2.Card_Month__c = '08';
        infc2.Card_Year__c = '2024';
        infc2.Card_Security__c = '411';
        infc2.Infinity_Subscription_Card__c = True;
        insert infc2;
    }
    
    @isTest
    public static void newPlatinumCard() {
        
        Account a = [Select Id From Account LIMIT 1];
        
		Credit_Card_Detail__c c = [Select Id From Credit_Card_Detail__c Limit 1];
		Credit_Card_Detail__c c2 = [Select Id From Credit_Card_Detail__c Where Id !=:c.Id Limit 1];
        
        Credit_Card_Detail__c infinC1 = [Select Id From Credit_Card_Detail__c Where Infinity_Subscription_Card__c = True Limit 1];
        Credit_Card_Detail__c infinC2 = [Select Id From Credit_Card_Detail__c Where Infinity_Subscription_Card__c = False Limit 1];
        
		Opportunity o = [Select Id,ChargentSFA__Card_Type__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Name__c FROM Opportunity];        
       
        System.assertequals('Visa', o.ChargentSFA__Card_Type__c);
        System.assertequals('07',o.ChargentSFA__Card_Month__c);
        System.assertequals('2023',o.ChargentSFA__Card_Year__c);
        System.assertequals('1234123412341234',o.ChargentSFA__Card_Number__c);
        System.assertequals('Bazam, Inc.',o.ChargentSFA__Card_Name__c);
        
        c2.Platinum_Subscription_Card__c = True;
        update c2;
        System.debug('c2: '+c2);
        
		infinC2.Infinity_Subscription_Card__c = True;
        update infinC2;
        
        c.Card_Security__c = '555';
        c.Platinum_Subscription_Card__c = False;
        update c;

		System.debug('c: '+c);
        
        Opportunity opp = [Select Id,ChargentSFA__Card_Type__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Name__c FROM Opportunity];        
       
        System.assertequals('Visa', opp.ChargentSFA__Card_Type__c);
        System.assertequals('08',opp.ChargentSFA__Card_Month__c);
        System.assertequals('2024',opp.ChargentSFA__Card_Year__c);
        System.assertequals('1234567891234567',opp.ChargentSFA__Card_Number__c);
        System.assertequals('Azani, Inc.',opp.ChargentSFA__Card_Name__c);
            
    }
    

}