global class CheckPlatinumSubDeclinedCampigncls implements   Database.Batchable<sObject>,    Database.AllowsCallouts, Database.Stateful {
      private String query; 
        global Integer recordsProcessed = 0;
       global   DebugInfo__c Dinfo=new DebugInfo__c();

        List<task> taskList=new List<task>();
        global CheckPlatinumSubDeclinedCampigncls(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
      global void execute(Database.BatchableContext bc, List<campaignmember> DeclinedCampignmemeberList){
                  Id PlatinumrecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
          List<id> accountIdListNodeclined=new List<id>();
            List<campaignmember> campaignMemeberDeleteList=new List<campaignmember>();
       List<opportunity> delinedPlatinumsubList=new List<opportunity>();
          for(campaignmember cm:DeclinedCampignmemeberList){
             //accountIdList.add(cm.Account__c);
              delinedPlatinumsubList=[Select id,AccountId from opportunity where (StageName!='Declined-' and StageName!='Closed Lost') and RecordTypeId=:PlatinumrecordTypeId and accountID =:cm.Account__c];
              if(delinedPlatinumsubList.size()>0){
                  accountIdListNodeclined.add(delinedPlatinumsubList[0].AccountId);
              }
          }       
       campaignMemeberDeleteList=[Select id from campaignmember where Account__c IN:accountIdListNodeclined ];
          if(campaignMemeberDeleteList.size()>0){
              delete campaignMemeberDeleteList;
              
          }
   
        }
        global void finish(Database.BatchableContext bc){
              
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
         integer cpuTime = Limits.getCpuTime();
            integer Queries = Limits.getQueries();
         
            Dinfo.DebugData__c='Job Name:SFFBuploadBatchClass; Records deleted:'+recordsProcessed;
            insert Dinfo;
        }
    
}