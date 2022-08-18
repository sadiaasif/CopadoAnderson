public with sharing class GetAccount {
    @AuraEnabled 
    public static account getAccount(string recordId){
        // query current user information  
        Account Acc = [SELECT Id, Name, Account_Number__c FROM Account Where id =:recordId];
        return Acc;
    }
}