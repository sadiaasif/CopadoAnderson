/**
 *  Author Sudhir Dudeja
 *  Version v 1.0
 *  Decsription [evt__Attendee__c This trigger would use to associate the sales rep of attendes with the sales rep object ]
 *  Date 7th Nov 2016
 */

trigger attendeeTrigger on evt__Attendee__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

   attendeeTriggerHandler ath=new attendeeTriggerHandler();
   if(trigger.isBefore && trigger.isUpdate){
      ath.addSalesRep(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');
      ath.campMemberStatusToAttendeeStatus(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');

    }
   if(trigger.isBefore && trigger.isInsert){
      ath.addSalesRep(trigger.new, null, null, null, 'Before', 'Insert');
   }
   if(trigger.isAfter && trigger.isInsert){
        ath.campMemberStatusToAttendeeStatus(trigger.new, null, null, null, 'After', 'Insert');
    }
}