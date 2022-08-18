trigger contactTrigger on contact (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    contactTriggerHandler.handleTrigger(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap, Trigger.operationType);
}