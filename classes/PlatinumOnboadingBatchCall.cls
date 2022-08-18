global class PlatinumOnboadingBatchCall implements Schedulable {
     global void execute(SchedulableContext sc) {
      Id batchJobId1 = Database.executeBatch(new PlatinumOnboardingBatch('Select id, Name,CampaignID__c,Campaign2ID__c from Contact where AccountId IN:NewoppIDlawsale and Account_Roles__c=\'Primary Contact\'','New Client Law Sale'), 200);
System.debug('Batch1--'+batchJobId1);
    
Id batchJobId2 = Database.executeBatch(new PlatinumOnboardingBatch('Select id, Name,CampaignID__c,Campaign2ID__c from Contact where AccountId IN:NewoppIDtaxsale and Account_Roles__c=\'Primary Contact\'','New Client Tax Sale'), 200);
System.debug('Batch2--'+batchJobId2);
            
Id batchJobId3 = Database.executeBatch(new PlatinumOnboardingBatch('Select id, Name,CampaignID__c,Campaign2ID__c from Contact where AccountId IN:NewoppIDlawandtaxsale and Account_Roles__c=\'Primary Contact\'','New Client Law and Tax Sale'), 200);
             System.debug('Batch3--'+batchJobId3);
         


     /*     Id batchJobId4 = Database.executeBatch(new PlatinumOnboardingBatch('Select id, Name,CampaignID__c,Campaign2ID__c from Contact where AccountId IN:ExistingppIDlawsalewelcomecall and Account_Roles__c=\'Primary Contact\'','Existing Client Law Sale'), 200);
System.debug('Batch4--'+batchJobId4);
Id batchJobId5 = Database.executeBatch(new PlatinumOnboardingBatch('Select id, Name,CampaignID__c,Campaign2ID__c from Contact where AccountId IN:ExistingppIDtaxsalewelcomecall and Account_Roles__c=\'Primary Contact\'','Existing Client Tax Sale'), 200);
System.debug('Batch5--'+batchJobId5);
Id batchJobId6 = Database.executeBatch(new PlatinumOnboardingBatch('Select id, Name,CampaignID__c,Campaign2ID__c from Contact where AccountId IN:ExistingppIDlawandtaxpandwelcomecall and Account_Roles__c=\'Primary Contact\'','Existing Client Tax and Law Sale'), 200);
System.debug('Batch6--'+batchJobId6);*/
    
    }

}