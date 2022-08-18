// Deactivated by Nick Frates on 1/15/2021 ~12:00pm
//
//
//
trigger campaignMemberTrigger on CampaignMember (before insert,before update) {


      campaignMemberTriggerHandler ath=new campaignMemberTriggerHandler();


      if(trigger.isBefore && trigger.isUpdate) {


            ath.campMemberStatus(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');
            ath.createSalesRecord(trigger.new, trigger.old, trigger.newMap, trigger.oldMap, 'Before', 'Update');

      }

      if(trigger.isBefore && trigger.isInsert) {

            ath.campMemberStatus(trigger.new, null, null, null, 'Before', 'Insert');
     }
}