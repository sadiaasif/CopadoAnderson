public class CheckPlatinumSubDeclinedCampignBatchCall  implements Schedulable {
    public void execute(SchedulableContext sc) {
        Id PlatinumrecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        Id DeclinedcampaignID =  [Select id, name from campaign where Name='Platinum Subscription Declined' limit 1]?.id;
     String saleQuery='';
         Id batchJobId1;
        if(!Test.isRunningTest()){
        saleQuery='Select id,Account__c from campaignmember where CampaignId=\''+DeclinedcampaignID+'\' ';
        }else{
             saleQuery='Select id,Account__c from campaignmember where CampaignId=\''+DeclinedcampaignID+'\'  ';
        }
          if(!Test.isRunningTest()){
          batchJobId1 = Database.executeBatch(new CheckPlatinumSubDeclinedCampigncls(saleQuery), 5);
         }else{
              batchJobId1 = Database.executeBatch(new CheckPlatinumSubDeclinedCampigncls(saleQuery), 200);
         }
      
    }
}