global class WyStatutoryTrustRenewalLateFeeBatchcls implements 
    Database.Batchable<sObject>, Database.Stateful {
    
   
  private String query; 
        global Integer recordsProcessed = 0;
       global   DebugInfo__c Dinfo=new DebugInfo__c();
        
         private String CampaignName; 
       
        global WyStatutoryTrustRenewalLateFeeBatchcls(string query){
            this.query = query;
            
        }
     
    global Database.QueryLocator start(Database.BatchableContext bc) { 
          
      
        return Database.getQueryLocator(this.query);
    }
    global void execute(Database.BatchableContext bc, List<Opportunity> QualWYRenewalOpps){
         ID contactIDR;
        Id AccountID;
        ID OwnerId;
        Decimal PlatinumSaleCount=0;
        String TrustName='';
        Set<Id> QualWYRenewalIds= new set<Id>();
       set<id> QualWYAccountIds=new set<Id>();
          Map<String, Object> inputs = new Map<String, Object>();
          List<Task> taskforLateFeeSaleList=new List<Task>();
        for(opportunity QualWYRenewalOpp:QualWYRenewalOpps){
            QualWYRenewalIds.add(QualWYRenewalOpp.id);
            QualWYAccountIds.add(QualWYRenewalOpp.accountID);
        }
        List<OpportunityLineitem> WYAnnualRenewalLatefeeList = new  List<OpportunityLineitem>();
        Id ProductID=[Select Id from Product2 where name ='WY Statutory Trust Annual Renewal Late Fee' ]?.id;
    Id  PricebookEntryId =[Select id,Pricebook2.name from PricebookEntry where Product2Id =:ProductID and Pricebook2.name='Renewals']?.id;
        for(Id QualWYRenewalId:QualWYRenewalIds ){
            opportunityLineitem wyAnnualRLatefee= new opportunityLineitem();
            wyAnnualRLatefee.OpportunityId=QualWYRenewalId;
            wyAnnualRLatefee.Product2Id=ProductID;
            wyAnnualRLatefee.PricebookEntryId=PricebookEntryId;
            wyAnnualRLatefee.Quantity=1;
            wyAnnualRLatefee.TotalPrice=100;
            WYAnnualRenewalLatefeeList.add(wyAnnualRLatefee);
            AccountID=[Select accountID from opportunity where id=:QualWYRenewalId]?.accountID;
            PlatinumSaleCount=[Select account.Platinum_Sale_Closed_Won__c  from opportunity where id=:QualWYRenewalId]?.account.Platinum_Sale_Closed_Won__c;
            TrustName=[Select Trust__r.name  from opportunity where id=:QualWYRenewalId]?.Trust__r.name;
                inputs.put('AccountID',AccountID);
               Flow.Interview.Account_Get_Primary_contact_flow myFlow = 
    		new Flow.Interview.Account_Get_Primary_contact_flow(inputs);
  			myFlow.start();
                if (myFlow!=null) {
                      contactIDR = (String) myFlow.getVariableValue('ConatctID');
                }
                 OwnerId=[select Id from Group where Type = 'Queue' AND DeveloperNAME = 'BCP']?.Id;
            if(PlatinumSaleCount>=1){
                              task t=new task();
            t.OwnerId=OwnerId;
            t.Subject='WY Renewal Sale Late fee added to WY Statutory Trust Annual Renewal Sale';
            t.Client__c=AccountID;
                t.WhoId=contactIDR;
                t.ActivityDate=System.today();
                t.WhatId=QualWYRenewalId;
                   t.Description='This is an automated task created when Late fee is added to the WY Statutory Trust Annual Renewal Sale. Related Trust Name -'+TrustName;
                taskforLateFeeSaleList.add(t);
                
            }else{
                  OwnerId=[select Id from Group where Type = 'Queue' AND DeveloperNAME = 'RenewalAdvisors']?.Id;
                 task t=new task();
            t.OwnerId=OwnerId;
            t.Subject='WY Renewal Sale Late fee added to WY Statutory Trust Annual Renewal Sale';
            t.Client__c=AccountID;
                t.ActivityDate=System.today();
                t.WhatID=QualWYRenewalId;
                 t.WhoId=contactIDR;
                t.Description='This is an automated task created when Late fee is added to the WY Statutory Trust Annual Renewal Sale. Related Trust Name -'+TrustName;
                taskforLateFeeSaleList.add(t);
            }
        }
        if(WYAnnualRenewalLatefeeList.size()>0){
            insert WYAnnualRenewalLatefeeList;
            
        }
     
        List<account> PlatinumClientsList=[Select id,name from account where Platinum_Sale_Closed_Won__c>=1 and id IN:  QualWYAccountIds];
        

        
  
        if(taskforLateFeeSaleList.size()>0){
             insert taskforLateFeeSaleList;
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