global class SFFbuploadBatchCall implements Schedulable {
    global void execute(SchedulableContext sc) {
     
        Id StandardrenewalRecordId = Schema.SObjectType.opportunity.getRecordTypeInfosByDeveloperName().get('Standard_Renewal').getRecordTypeId();

        Id StaterenewalRecordId = Schema.SObjectType.opportunity.getRecordTypeInfosByDeveloperName().get('State_Renewal').getRecordTypeId();
        string taskQuery='';
        if(!Test.isRunningTest()){
            taskQuery='select id, name, AccountID, Billing_City__c, ChargentSFA__Billing_City__c from opportunity where stageName=\'Closed won\' and Name!=\'Platinum Subscription\' and closeDate=Today AND ChargentSFA__Transaction_Count__c > 0 and RecordType.Name = \'Entity Formation\'  and RecordType.Name != \'Pension Renewal\'and RecordTypeID !=\''+StandardrenewalRecordId+'\' and RecordTypeID !=\''+StaterenewalRecordId+'\' '; 
        }else{
            taskQuery='select id, name, AccountID, Billing_City__c, ChargentSFA__Billing_City__c from opportunity where stageName=\'Closed won\' and Name!=\'Platinum Subscription\' and closeDate=Today AND ChargentSFA__Transaction_Count__c > 0 and RecordType.Name = \'Entity Formation\'  and RecordType.Name != \'Pension Renewal\'and RecordTypeID !=\''+StandardrenewalRecordId+'\' and RecordTypeID !=\''+StaterenewalRecordId+'\' Limit 10';
        }
        
         
         Id batchJobId1;
          if(!Test.isRunningTest()){
          batchJobId1 = Database.executeBatch(new SFFBuploadBatchClass(taskQuery), 5);
         }else{
             batchJobId1 = Database.executeBatch(new SFFBuploadBatchClass(taskQuery), 200);
         }
      
    }
}