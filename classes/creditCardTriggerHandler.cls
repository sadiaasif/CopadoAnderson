public class creditCardTriggerHandler {
    
    public static boolean alreadyProcessed = false;
    
    public static void calculateExpirationDate(List<Credit_Card_Detail__c> newList){
        
        if (alreadyProcessed == true) return;
        alreadyProcessed = true;
        
        String cardYear;
        String cardMonth;
        
        for (Credit_Card_Detail__c creditcard : newList) {

                if(String.isNotEmpty(creditcard.Card_Year__c) && creditcard.Card_Year__c.length() == 2) {
                    cardYear = '20'+creditcard.Card_Year__c;
                }
                
                if(String.isNotEmpty(creditcard.Card_Year__c) && creditcard.Card_Year__c.length() == 4) {
                    cardYear = creditcard.Card_Year__c;
                }
                
                if(String.isNotEmpty(creditcard.Card_Month__c) && creditcard.Card_Month__c != '00') {
                    cardMonth = creditcard.Card_Month__c;
                }
                
                if(String.isNotEmpty(cardMonth) && String.isNotEmpty(cardYear)) {
                    date monthBeforeExpirationDate = date.parse(cardMonth+'/1/'+cardYear);
                    date expirationDate = monthBeforeExpirationDate.addMonths(1);
                    if(creditcard.Day_After_Expiration__c != expirationDate) {
                    creditcard.Day_After_Expiration__c = expirationDate;
                }
                
            }
  
        }
        
    }
    
}