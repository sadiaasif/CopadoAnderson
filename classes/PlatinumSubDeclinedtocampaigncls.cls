global class PlatinumSubDeclinedtocampaigncls  implements   Database.Batchable<sObject>,    Database.AllowsCallouts, Database.Stateful {
      private String query; 
        global Integer recordsProcessed = 0;
       global   DebugInfo__c Dinfo=new DebugInfo__c();

        List<task> taskList=new List<task>();
        global PlatinumSubDeclinedtocampaigncls(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
      global void execute(Database.BatchableContext bc, List<opportunity> SalePlatinumSubscriptionDeclinedList){
       List<opportunity> Saleupdate=new List<opportunity>();
          List<CampaignMember> memberInsertList=new List<CampaignMember>();
          List<Id> accountID=new List<Id>();
          ID contactIDR;
		Id DeclinedcampaignID =  [Select id, name from campaign where Name='Platinum Subscription Declined' limit 1]?.id;
          for(opportunity opp: SalePlatinumSubscriptionDeclinedList){
             accountID.add(opp.accountId);
          }  
          for(Id accid:accountID){
              	 Map<String, Object> inputs = new Map<String, Object>();
 			 inputs.put('AccountID', accid);
           
                Flow.Interview.Account_Get_Primary_contact_flow myFlow = 
    		new Flow.Interview.Account_Get_Primary_contact_flow(inputs);
  			myFlow.start();
              if (myFlow!=null) {
                  contactIDR = (String) myFlow.getVariableValue('ConatctID');
                  System.debug('ContactID=='+contactIDR);
                  List<CampaignMember> cmpresent=[Select id from CampaignMember where ContactId=: contactIDR and CampaignId=:DeclinedcampaignID ];
                  if(cmpresent.size()==0){
                       CampaignMember cm=new CampaignMember(ContactId=contactIDR,CampaignId=DeclinedcampaignID);
                memberInsertList.add(cm);
                  }
                 
              }
     
          }
          insert memberInsertList;
        
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