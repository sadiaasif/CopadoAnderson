global class ManualPensionRenewalsLateFee300 implements Schedulable 
{
     global void execute(SchedulableContext sc) 
     {
        
         Id batchJobId1 = Database.executeBatch(new PensionRenewalsLateFee300('SELECT id,name,year_end_month__c, StageName, Pension_Due_Date_2__c FROM Opportunity WHERE RecordType.DeveloperName=\'Pension_Renewal\' AND (StageName=\'Qualification\' OR StageName=\'Fulfillment/Partial Payment\') AND Pension_Due_Date_2__c!=NULL AND Year_End_Month__c!=NULL',Date.today()), 25);
         System.debug('Batch1--'+batchJobId1);
         
     }

}