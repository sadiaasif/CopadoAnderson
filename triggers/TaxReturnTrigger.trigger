trigger TaxReturnTrigger on Tax_Return__c (before insert,before update) {

    if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)){
        ClientEntityTaxReturnsController.updateComments(Trigger.new,Trigger.oldMap);
    }
}