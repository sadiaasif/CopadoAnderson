public class CreditCardInfo {

    public static boolean alreadyProcessed = false;
    
    public static void processOpp(List<Opportunity> newList) {
        
        system.debug('Inside credit card info class');
        if (alreadyProcessed == true) return;
        alreadyProcessed = true;
        
        system.debug('After static boolean');
        List<Opportunity> updateList = new List<Opportunity>();
        
        for (Opportunity opp : newList) {
            
            if ( opp.Card_Number__c == null && opp.ChargentSFA__Card_Number__c != null ) {
                
				system.debug('Inside record update section');
                opp.Card_Number__c   = opp.ChargentSFA__Card_Number__c;
                opp.Card_Month__c    = opp.ChargentSFA__Card_Month__c;
                opp.Card_Year__c     = opp.ChargentSFA__Card_Year__c;
      
            }
        }
       
    }
    
}