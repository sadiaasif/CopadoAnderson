trigger accTrigger on Account (before insert,before update) {

   accountTriggerHandler ath=new accountTriggerHandler();

   if(trigger.isBefore && trigger.isInsert) {
       if(!accountTriggerHandler.alreadyProcessed){
  ath.importantNotesInsert(trigger.new, null, null, null, 'Before', 'Insert');               
       }
  
      
     

   }
    
    
    
   if(trigger.isBefore && trigger.isUpdate) {
       
 if(!accountTriggerHandler.alreadyProcessed){
   ath.importantNotesUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');
 }
       
     /* if(!entityCount.alreadyProcessed) {
       entityCount.countEntities(trigger.new, trigger.oldMap);       
     } */
      
       }

   }