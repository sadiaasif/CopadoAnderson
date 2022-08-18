trigger accountTrigger on Account (before insert, before update) {
    
    accountTriggerHandler ath=new accountTriggerHandler();
    formatAccountPhones format = new formatAccountPhones();
    
    if(trigger.isBefore && trigger.isInsert) {
        
        if(!accountTriggerHandler.alreadyProcessed){
            ath.importantNotesInsert(trigger.new, null, null, null, 'Before', 'Insert');               
        }
        
        if(!formatAccountPhones.insertRun){
            format.evaluateAndCleanPhoneNumbers(trigger.new, 'Before Insert');
        }
       
    }
  
    if(trigger.isBefore && trigger.isUpdate) {
       
        if(!accountTriggerHandler.firstRun){
            ath.importantNotesUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');
        }
        
        if(!formatAccountPhones.updateRun){
            format.evaluateAndCleanPhoneNumbers(trigger.new, 'Before Update');
        }
        
    }
    
}