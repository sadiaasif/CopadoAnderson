public class UpdatePlatinumSale {
    
    public static boolean alreadyProcessed = false;

    public static void insertCard(List<Credit_Card_Detail__c> ccList) {
     
        if (alreadyProcessed == true) return;
        alreadyProcessed = true;
        
        List<Opportunity> updateOppList = new List<Opportunity>();
        List<Credit_Card_Detail__c> falseCardList = new List<Credit_Card_Detail__c>();
        
        	for (Credit_Card_Detail__c c : ccList) {
  
            	if (c.Platinum_Subscription_Card__c == TRUE) {

            		for (Opportunity opp : [SELECT Id,ChargentSFA__Card_Type__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Name__c FROM Opportunity WHERE AccountId = :c.Account__c AND Name LIKE 'Platinum Subscription' LIMIT 1]) {
                                       
            		opp.ChargentSFA__Card_Type__c     = c.Card_Type__c;
            		opp.ChargentSFA__Card_Month__c    = c.Card_Month__c;
            		opp.ChargentSFA__Card_Year__c     = c.Card_Year__c;
            		opp.ChargentSFA__Card_Number__c   = c.Card_Number__c;
            		opp.ChargentSFA__Card_Name__c     = c.Name;
            		updateOppList.add(opp);
                    
                    }
                
 
                	for (Credit_Card_Detail__c card : [SELECT Id from Credit_Card_Detail__c WHERE Account__c = :c.Account__c AND Platinum_Subscription_Card__c = TRUE AND id != :c.id]) {
                    
                    card.Platinum_Subscription_Card__c = FALSE;
                    falseCardList.add(card);               
        			} 
                }    
            }

        update updateOppList;
        update falseCardList;

    }
    
    public static void updateCard(List<Credit_Card_Detail__c> ccList, Map<Id,Credit_Card_Detail__c> oldMap) {
     
        if (alreadyProcessed == true) return;
        alreadyProcessed = true;
        
        List<Opportunity> updateOppList = new List<Opportunity>();
        List<Credit_Card_Detail__c> falseCardList = new List<Credit_Card_Detail__c>();
        
        	for (Credit_Card_Detail__c c : ccList) {
  				if (c.Platinum_Subscription_Card__c == TRUE && c.Platinum_Subscription_Card__c != oldMap.get(c.Id).Platinum_Subscription_Card__c) {

            		for (Opportunity opp : [SELECT Id,ChargentSFA__Card_Type__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Name__c FROM Opportunity WHERE AccountId = :c.Account__c AND Name LIKE 'Platinum Subscription' LIMIT 1]) {
                                       
            		opp.ChargentSFA__Card_Type__c     = c.Card_Type__c;
            		opp.ChargentSFA__Card_Month__c    = c.Card_Month__c;
            		opp.ChargentSFA__Card_Year__c     = c.Card_Year__c;
            		opp.ChargentSFA__Card_Number__c   = c.Card_Number__c;
            		opp.ChargentSFA__Card_Name__c     = c.Name;
            		updateOppList.add(opp);
                    
                    }
                
 
                	for (Credit_Card_Detail__c card : [SELECT Id from Credit_Card_Detail__c WHERE Account__c = :c.Account__c AND Platinum_Subscription_Card__c = TRUE AND id != :c.id]) {
                    
                    card.Platinum_Subscription_Card__c = FALSE;
                    falseCardList.add(card);               
        			} 
                }    
            }

        update updateOppList;
        update falseCardList;

    }
}