public with sharing class campaignMemberTriggerHandler {
   public campaignMemberTriggerHandler() {

   }
   public void campMemberStatus(List<CampaignMember> newRecordsList, List<CampaignMember> oldRecordsList, Map<Id, CampaignMember> newMap, Map<Id, CampaignMember> oldMap, String eventType, String triggerType){

     list<CampaignMember> campMemberList=new list<CampaignMember>();
     for(CampaignMember campMember : newRecordsList){
    campMember.Status=campMember.Attendee_Invitation_Status__c;
    System.debug('campMember is'+campMember);
    campMemberList.add(campMember);
     }
   }

   public void createSalesRecord(List<CampaignMember> newRecordsList, List<CampaignMember> oldRecordsList, Map<Id, CampaignMember> newMap, Map<Id, CampaignMember> oldMap, String eventType, String triggerType){

      list<Opportunity> oppList=new list<Opportunity>();
      Map<Id,String> campNameMap=new Map<Id,String>();
      Map<id,id> campContactIDMap=new Map<id,id>();
      Map<id,boolean> campAttendeeMap=new Map<id,boolean>();

      for(CampaignMember campMember : [Select id,Campaign.Name,Contact.accountID,attendee__r.evt__Is_Primary__c from CampaignMember where id=:newRecordsList]){

            campNameMap.put(campMember.id,campMember.Campaign.Name);
            campContactIDMap.put(campMember.id,campMember.Contact.accountID);
            campAttendeeMap.put(campMember.id,campMember.attendee__r.evt__Is_Primary__c);
      }


      for(CampaignMember campMember: newRecordsList){

          CampaignMember campaignMemberStatus=(CampaignMember)trigger.oldMap.get(campMember.id);
          String oldStatus=campaignMemberStatus.Status;

          System.debug('old status is'+oldStatus);
          System.debug('campaign member status is'+campMember.Status);

          if(campMember.Status=='Attended'  && oldStatus!='Attended') {

                System.debug('the value is'+campAttendeeMap.get(campMember.id));

                if(campAttendeeMap.get(campMember.id)){

                      Opportunity opp=new Opportunity();
                      opp.Name=campNameMap.get(campMember.id);
                      opp.accountID=campContactIDMap.get(campMember.id);
                      opp.OwnerID=System.label.Anderson_ID;
                      opp.StageName='New Consult';
                      opp.CloseDate=System.today();
                      opp.Sale_Campaign__c = campMember.CampaignId;
                      oppList.add(opp);
                }
          }
      }

      if(!oppList.isEmpty()){
          insert oppList;
      }

   }
}