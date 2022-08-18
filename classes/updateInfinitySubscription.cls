public class updateInfinitySubscription {
    
    public static boolean firstRun = false;

    public static void insertCard(List<Credit_Card_Detail__c> ccList) {
     
        if (firstRun == true) return;
        firstRun = true;
        
        List<Opportunity> updateOppList = new List<Opportunity>();
        List<Credit_Card_Detail__c> falseCardList = new List<Credit_Card_Detail__c>();
        
        	for (Credit_Card_Detail__c c : ccList) {
  
            	if (c.Infinity_Subscription_Card__c == TRUE) {

            		for (Opportunity opp : [SELECT Id,ChargentSFA__Card_Type__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Name__c FROM Opportunity WHERE AccountId = :c.Account__c AND RecordType.Name = 'Infinity Subscription' AND ChargentSFA__Payment_Status__c = 'Recurring'   LIMIT 1]) {
                                       
            		opp.ChargentSFA__Card_Type__c     = c.Card_Type__c;
            		opp.ChargentSFA__Card_Month__c    = c.Card_Month__c;
            		opp.ChargentSFA__Card_Year__c     = c.Card_Year__c;
            		opp.ChargentSFA__Card_Number__c   = c.Card_Number__c;
            		opp.ChargentSFA__Card_Name__c     = c.Name;
            		updateOppList.add(opp);
                    
                    }
                
 
                	for (Credit_Card_Detail__c card : [SELECT Id from Credit_Card_Detail__c WHERE Account__c = :c.Account__c AND Infinity_Subscription_Card__c = TRUE AND id != :c.id]) {
                    
                    card.Infinity_Subscription_Card__c = FALSE;
                    falseCardList.add(card);               
        			} 
                }    
            }

        update updateOppList;
        update falseCardList;

    }
    
    public static void updateCard(List<Credit_Card_Detail__c> ccList, Map<Id,Credit_Card_Detail__c> oldMap) {
     
        if (firstRun == true) return;
        firstRun = true;
        
        List<Opportunity> updateOppList = new List<Opportunity>();
        List<Credit_Card_Detail__c> falseCardList = new List<Credit_Card_Detail__c>();
        
        	for (Credit_Card_Detail__c c : ccList) {
  				System.debug('cond chk: '+( c.Infinity_Subscription_Card__c == TRUE && c.Infinity_Subscription_Card__c != oldMap.get(c.Id).Infinity_Subscription_Card__c ));
            	if (c.Infinity_Subscription_Card__c == TRUE && c.Infinity_Subscription_Card__c != oldMap.get(c.Id).Infinity_Subscription_Card__c) {

            		for (Opportunity opp : [SELECT Id,ChargentSFA__Card_Type__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Name__c FROM Opportunity WHERE AccountId = :c.Account__c AND RecordType.Name = 'Infinity Subscription' AND ChargentSFA__Payment_Status__c = 'Recurring'   LIMIT 1]) {
                                       
            		opp.ChargentSFA__Card_Type__c     = c.Card_Type__c;
            		opp.ChargentSFA__Card_Month__c    = c.Card_Month__c;
            		opp.ChargentSFA__Card_Year__c     = c.Card_Year__c;
            		opp.ChargentSFA__Card_Number__c   = c.Card_Number__c;
            		opp.ChargentSFA__Card_Name__c     = c.Name;
            		updateOppList.add(opp);
                    
                    }
                
 
                	for (Credit_Card_Detail__c card : [SELECT Id from Credit_Card_Detail__c WHERE Account__c = :c.Account__c AND Infinity_Subscription_Card__c = TRUE AND id != :c.id]) {
                    
                    card.Infinity_Subscription_Card__c = FALSE;
                    falseCardList.add(card);               
        			} 
                }    
            }

        update updateOppList;
        update falseCardList;

    }


}