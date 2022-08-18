public class SalePlatinumSubscriptionGatewayBatchcall  implements Schedulable {
    public void execute(SchedulableContext sc) {
        Id PlatinumrecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
     String saleQuery='';
         Id batchJobId1;
        if(!Test.isRunningTest()){
        saleQuery='Select id, name,ChargentSFA__Gateway__c from opportunity where ChargentSFA__Gateway__c=\'\' and RecordTypeId=\''+PlatinumrecordTypeId+'\' '; 
        }else{
              saleQuery='Select id, name,ChargentSFA__Gateway__c from opportunity where ChargentSFA__Gateway__c=\'\' and RecordTypeId=\''+PlatinumrecordTypeId+'\' ';
        }
          if(!Test.isRunningTest()){
          batchJobId1 = Database.executeBatch(new SalePlatinumSubscriptionGatewayUpdatecls(saleQuery), 5);
         }else{
              batchJobId1 = Database.executeBatch(new SalePlatinumSubscriptionGatewayUpdatecls(saleQuery), 200);
         }
      
    }
}