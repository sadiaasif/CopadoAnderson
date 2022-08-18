trigger taskTrigger on Task (before insert,before update) {
    
     taskTriggerHandler1 ath=new taskTriggerHandler1();
     BKLoggedCallHandler bk=new BKLoggedCallHandler();
     bookkeepingFieldsFromTasks bkTasks = new bookkeepingFieldsFromTasks();
     

   if(trigger.isBefore && trigger.isUpdate) {

         ath.taskReassignment(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');
         ath.taskProcessingStage(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');
         ath.taskBookkeepingStages(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');
         ath.taskAndersonStage(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');
         //bkTasks.passUpdateFields(trigger.new,trigger.oldMap);
       
   }

   if(trigger.isBefore && trigger.isInsert) {

         ath.taskReassignment(trigger.new, null, null, null, 'Before', 'Insert');
         ath.taskProcessingStage(trigger.new, null, null, null, 'Before', 'Insert');
         ath.taskBookkeepingStages(trigger.new, null, null, null, 'Before', 'Insert');
         ath.taskAndersonStage(trigger.new, null, null, null, 'Before', 'Insert');
        // bk.taskDuplication(trigger.new);
        // bkTasks.passInsertFields(trigger.new);
   }
   

}