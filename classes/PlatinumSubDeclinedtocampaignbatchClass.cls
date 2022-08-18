public class PlatinumSubDeclinedtocampaignbatchClass  implements Schedulable {
    public void execute(SchedulableContext sc) {
        Id PlatinumrecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
     String saleQuery='';
         Id batchJobId1;
        if(!Test.isRunningTest()){
        saleQuery='Select id,AccountId from opportunity where StageName=\'Declined-\' and RecordTypeId=\''+PlatinumrecordTypeId+'\' ';
        }else{
             saleQuery='Select id,AccountId from opportunity where StageName=\'Declined-\' and RecordTypeId=\''+PlatinumrecordTypeId+'\' ';
        }
          if(!Test.isRunningTest()){
          batchJobId1 = Database.executeBatch(new PlatinumSubDeclinedtocampaigncls(saleQuery), 5);
         }else{
              batchJobId1 = Database.executeBatch(new PlatinumSubDeclinedtocampaigncls(saleQuery), 200);
         }
      
    }
}