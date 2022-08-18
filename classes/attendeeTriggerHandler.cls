public with sharing class attendeeTriggerHandler {
	public attendeeTriggerHandler() {

	}
   public void campMemberStatusToAttendeeStatus(List<evt__Attendee__c> newRecordsList, List<evt__Attendee__c> oldRecordsList, Map<Id, evt__Attendee__c> newMap, Map<Id, evt__Attendee__c> oldMap, String eventType, String triggerType){
    list<CampaignMember> campaignMemberList=[Select id, Name from CampaignMember where Attendee__c=:newRecordsList];
    if(!campaignMemberList.isEmpty()){
     update campaignMemberList;
    }
   }



   public void addSalesRep(List<evt__Attendee__c> newRecordsList, List<evt__Attendee__c> oldRecordsList, Map<Id, evt__Attendee__c> newMap, Map<Id, evt__Attendee__c> oldMap, String eventType, String triggerType){

    //Set<String> salesRepName=new Set<String>();

    //Map<String,ID> saleRepMap=new Map<String,ID>();

    //List<evt__Attendee__c> evntList=new List<evt__Attendee__c>();

    //for(evt__Attendee__c evt : newRecordsList) {

    //  salesRepName.add(evt.Sales_Rep_Hidden__c);

    //}

    // if(!salesRepName.isEmpty()) {

    //   for( Sales_Rep__c srp  :  [Select id,Name from Sales_Rep__c where name=:salesRepName]) {


    //           saleRepMap.put(srp.Name,srp.id);

    //           System.debug('saleRepMap is'+ saleRepMap);

    //   }
    // }

    // if(!saleRepMap.isEmpty()) {

    //         for(evt__Attendee__c evt : newRecordsList) {

    //           if(saleRepMap.containsKey(evt.Sales_Rep_Hidden__c)) {

    //                   evt.Sales_Rep__c=saleRepMap.get(evt.Sales_Rep_Hidden__c);

    //                   evntList.add(evt);
    //           }
    //         }
    // }

    // if(!evntList.isEmpty()) {

    //         System.debug('evntList is'+ evntList);
    // }
   }

}