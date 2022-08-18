public class FlagActiveClientsbatchCall  implements Schedulable{
 public void execute(SchedulableContext sc) {
      
     String accountQuery='';
         Id batchJobId1;
        if(!Test.isRunningTest()){
        accountQuery='Select Id, Inactive_Client__c, Total_Value_of_All_Sales__c  FROM Account WHERE  Inactive_Client__c=false AND NAME!=\'Advisors, Anderson\' AND Id NOT IN (SELECT AccountId FROM Opportunity WHERE ((RecordType.Name = \'Entity Formation\' OR RecordType.Name = \'Tax Compliance\') AND Amount >=1500  AND StageName = \'Closed Won\'  AND CloseDate > N_DAYS_AGO:181 AND Account.First_Entity_Formation_or_Tax_Sale__c > N_DAYS_AGO:181) OR ((RecordType.Name = \'Entity Formation\' OR RecordType.Name = \'Tax Compliance\') AND Amount >=1500 AND StageName = \'Closed Won\' AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182) OR ((RecordType.Name = \'Platinum Subscription\' OR RecordType.Name = \'Bookkeeping Subscription\') AND StageName = \'Closed Won\' AND Last_Transaction__c >= N_DAYS_AGO:35) OR ((RecordType.Name = \'State Renewal\' OR RecordType.Name = \'Standard Renewal\') AND (CloseDate >= NEXT_N_DAYS:365 OR CloseDate = YESTERDAY) AND (StageName = \'Closed Won\' OR StageName = \'Qualification\')AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182) )  ';
        }else{
         accountQuery='Select Id, Inactive_Client__c, Total_Value_of_All_Sales__c  FROM Account WHERE  Inactive_Client__c=false AND NAME!=\'Advisors, Anderson\' AND Id NOT IN (SELECT AccountId FROM Opportunity WHERE ((RecordType.Name = \'Entity Formation\' OR RecordType.Name = \'Tax Compliance\') AND Amount >=1500  AND StageName = \'Closed Won\'  AND CloseDate > N_DAYS_AGO:181 AND Account.First_Entity_Formation_or_Tax_Sale__c > N_DAYS_AGO:181) OR ((RecordType.Name = \'Entity Formation\' OR RecordType.Name = \'Tax Compliance\') AND Amount >=1500 AND StageName = \'Closed Won\' AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182) OR ((RecordType.Name = \'Platinum Subscription\' OR RecordType.Name = \'Bookkeeping Subscription\') AND StageName = \'Closed Won\' AND Last_Transaction__c >= N_DAYS_AGO:35) OR ((RecordType.Name = \'State Renewal\' OR RecordType.Name = \'Standard Renewal\') AND (CloseDate >= NEXT_N_DAYS:365 OR CloseDate = YESTERDAY) AND (StageName = \'Closed Won\' OR StageName = \'Qualification\')AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182) )  ';
        }
          if(!Test.isRunningTest()){
          batchJobId1 = Database.executeBatch(new FlagActiveClientsbatchCls(accountQuery), 100);
         }else{
              batchJobId1 = Database.executeBatch(new FlagActiveClientsbatchCls(accountQuery), 200);
         }
      
    }
}