trigger ClientStatementTrigger on Client_Statement__c (before insert, before update) {
    
    if (trigger.isBefore && trigger.isInsert) {
        
        newClientStatement.makeItWork(trigger.new);
        
    }

}