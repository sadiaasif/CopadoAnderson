Trigger UpdateCaseStatus on Case (before update, before insert) {

    
    if(Trigger.isUpdate) {
    
   /* if(trigger.new[0].OwnerId != trigger.old[0].OwnerId && trigger.old[0].OwnerId != null && trigger.new[0].RecordTypeId == '0120B000000N93u'){ 
    if(!CaseController.triggerExecution){
            trigger.new[0].Status = 'In Progress';
            }
    }*/
    }
    
    if(Trigger.isInsert) {
        
        getHelpDeskInfo.insertQueueLength(trigger.new);
        
    }
    
}