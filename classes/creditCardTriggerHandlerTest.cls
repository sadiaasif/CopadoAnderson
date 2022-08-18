@isTest
public class creditCardTriggerHandlerTest {
    
    @testSetup
    public static void setupData(){
        
        Account a = new account();
        a.Name = 'Bob Apples';
        insert a;
               
        List<Credit_Card_Detail__c> insertList = new List<Credit_Card_Detail__c>();
        
        Credit_Card_Detail__c newCard = new Credit_Card_Detail__c();
        newCard.Account__c = a.id;
        newCard.Card_Month__c = '02';
        newCard.Card_Year__c = '2021';
        newCard.Name = 'Test Card Logic';
        insertList.add(newCard);
        
        insert insertList;

    }
    
    @isTest
    public static void InsertCreditCards() {
        
        Account a = [SELECT Id FROM Account LIMIT 1];
	
        List<Credit_Card_Detail__c> insertList = new List<Credit_Card_Detail__c>();
        
        Credit_Card_Detail__c secondNewCard = new Credit_Card_Detail__c();
        secondNewCard.Account__c = a.id;
        secondNewCard.Card_Month__c = '02';
        secondNewCard.Card_Year__c = '20';
        insertList.add(secondNewCard);
        
        insert insertList;
        
        Credit_Card_Detail__c refreshedCard = [SELECT Id, Day_After_Expiration__c FROM Credit_Card_Detail__c WHERE Name = 'Test Card Logic'];
        system.assert(refreshedCard.Day_After_Expiration__c == date.parse('3/1/2021'));

    }
    
     @isTest
    public static void UpdateCreditCards() {
        
        Credit_Card_Detail__c updateCard = [SELECT Id, Card_Month__c, Platinum_Subscription_Card__c FROM Credit_Card_Detail__c WHERE Name = 'Test Card Logic'];
        updateCard.Card_Month__c = '05';
        updateCard.Platinum_Subscription_Card__c = False;
        update updateCard;
        
        Credit_Card_Detail__c refreshedCard = [SELECT Id, Card_Month__c, Day_After_Expiration__c FROM Credit_Card_Detail__c WHERE Name = 'Test Card Logic'];
        system.debug('refreshedCard.Day_After_Expiration__c: '+refreshedCard.Day_After_Expiration__c);
        system.assert(refreshedCard.Day_After_Expiration__c == date.parse('3/1/2021'));


    }


}