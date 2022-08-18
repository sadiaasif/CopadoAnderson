trigger CreditCardTrigger on Credit_Card_Detail__c (before insert, before update) {

    if (trigger.isBefore && trigger.isInsert) {
        
        updateInfinitySubscription.insertCard(trigger.new);
        UpdatePlatinumSale.insertCard(trigger.new);
        creditCardTriggerHandler.calculateExpirationDate(trigger.new);
    }
    
    if (trigger.isBefore && trigger.isUpdate) {
        
        updateInfinitySubscription.updateCard(trigger.new, trigger.oldmap);
        UpdatePlatinumSale.updateCard(trigger.new, trigger.oldmap);
        
    }

}