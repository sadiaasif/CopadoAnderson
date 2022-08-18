@isTest
public class UpdateCreditCardTest {
    
    @testSetup
    public static void setupData(){
        Account a = new account();
        a.Name = 'Bob Apples';
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        insert a;
        
        Contact c = new Contact();
        c.FirstName = 'Bob';
        c.LastName = 'Apples';
        c.Email = 'bapples@andersonadvisors.com';
        c.Account_Roles__c = 'Primary Contact';
        insert c;
        
        Id InfinitySub = Schema.SObjectType.Opportunity.getRecordTypeInfosBYName().get('Infinity Subscription').getRecordTypeId();
        Opportunity infOpp = new Opportunity();
        infOpp.name = 'Infinity Subscription';
        infOpp.CloseDate = system.today();
        infOpp.AccountId = a.id;
        infOpp.StageName = 'Closed Won';
        infOpp.RecordTypeId = InfinitySub;
        infOpp.ChargentSFA__Payment_Status__c = 'Recurring';
        infOpp.ChargentSFA__Payment_Start_Date__c = system.today();
        insert infOpp;
        
        Id PlatinumSub = Schema.SObjectType.Opportunity.getRecordTypeInfosBYName().get('Platinum Subscription').getRecordTypeId();
        Opportunity platOpp = new Opportunity();
        platOpp.name = 'Platinum Subscription';
        platOpp.CloseDate = system.today();
        platOpp.AccountId = a.id;
        platOpp.StageName = 'Closed Lost';
        platOpp.RecordTypeId = PlatinumSub;
        insert platOpp;
        
        platOpp.StageName = 'Closed Won';
        update platOpp;
        
        
        Credit_Card_Detail__c newCard = new Credit_Card_Detail__c();
        newCard.Account__c = a.id;
        newCard.Card_Month__c = '02';
        newCard.Card_Year__c = '2021';
        newCard.Name = 'Setup fake card';
        insert newCard;
        
        Credit_Card_Detail__c secondCard = new Credit_Card_Detail__c();
        secondCard.Account__c = a.id;
        secondCard.Card_Month__c = '02';
        secondCard.Card_Year__c = '2021';
        secondCard.Name = 'Setup second fake card';
        insert secondCard;
        
    }
    
    @isTest
    public static void insertInfinityCard(){
        
        Account a = [SELECT Id FROM Account LIMIT 1];
        
        List<Credit_Card_Detail__c> insertList = new List<Credit_Card_Detail__c>();
        Credit_Card_Detail__c newCard = new Credit_Card_Detail__c();
        newCard.Account__c = a.id;
        newCard.Card_Month__c = '02';
        newCard.Card_Year__c = '2021';
        newCard.Name = 'Test Card Logic';
        newCard.Infinity_Subscription_Card__c = TRUE;
        insertList.add(newCard);
        
        insert insertList;
        
        
    }
    
    @isTest
    public static void insertPlatinumCard(){
        
        Account a = [SELECT Id FROM Account LIMIT 1];
        
        List<Credit_Card_Detail__c> insertList = new List<Credit_Card_Detail__c>();
        Credit_Card_Detail__c newCard = new Credit_Card_Detail__c();
        newCard.Account__c = a.id;
        newCard.Card_Month__c = '02';
        newCard.Card_Year__c = '2021';
        newCard.Name = 'Test Card Logic';
        newCard.Platinum_Subscription_Card__c = TRUE;
        insertList.add(newCard);
        
        insert insertList;
        
    }  
    
    @isTest
    public static void updateInfinityCard(){
        Credit_Card_Detail__c infCard = [SELECT Id, Infinity_Subscription_Card__c FROM Credit_Card_Detail__c WHERE Name = 'Setup fake card' LIMIT 1];
        Credit_Card_Detail__c secondInfCard = [SELECT Id, Infinity_Subscription_Card__c FROM Credit_Card_Detail__c WHERE Name = 'Setup second fake card' LIMIT 1];
        
        infCard.Infinity_Subscription_Card__c = TRUE;
        update infCard;
        
        secondInfCard.Infinity_Subscription_Card__c = TRUE;
        update secondInfCard;
        
    }
    
    @isTest
    public static void updatePlatinumCard(){
        Credit_Card_Detail__c platCard = [SELECT Id, Platinum_Subscription_Card__c FROM Credit_Card_Detail__c WHERE Name = 'Setup fake card' LIMIT 1];
        Credit_Card_Detail__c secondplatCard = [SELECT Id, Platinum_Subscription_Card__c FROM Credit_Card_Detail__c WHERE Name = 'Setup second fake card' LIMIT 1];
        platCard.Platinum_Subscription_Card__c = TRUE;
        update platCard;
        
        secondPlatCard.Platinum_Subscription_Card__c = TRUE;
        update secondPlatCard;
        
    }
    
    
    
}