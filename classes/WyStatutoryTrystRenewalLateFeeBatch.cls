global class WyStatutoryTrystRenewalLateFeeBatch implements Schedulable {
global void execute(SchedulableContext sc) {
   String exeQuery='Select id ,Name,accountid from opportunity where name =\'WY Statutory Trust Annual Renewal\' and StageName=\'Qualification\' and ( NOT Service_Item_List__c like\'' +'%'+[Select ASID__c from Product2 where name ='WY Statutory Trust Annual Renewal Late Fee']?.ASID__c+';%'  +'\')';
      Id batchJobId1 = Database.executeBatch(new WyStatutoryTrustRenewalLateFeeBatchcls(exeQuery), 5);
System.debug('Batch1--'+exeQuery);


    
    }
}