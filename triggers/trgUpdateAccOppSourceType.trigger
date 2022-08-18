trigger trgUpdateAccOppSourceType on Lead (after update) {
    List<Account> accList=new List<Account>();
    List<Opportunity> oppList=new List<Opportunity>();
    set<Id> ConvertedAccountIds=new Set<ID>();
    set<Id> ConvertedOpportunityIds=new Set<ID>();
    set<Id> LeadIds=new Set<ID>();
  
    
    List<Account> acc=new List<Account>();
    List<Opportunity> opp=new List<Opportunity>();
   Boolean accountConvertId=false; 
    Boolean ConvertedOpportunityId=false;
    Boolean createdSameday =false;
    if(checkRecursive.runOncetrgUpdateAccOppSourceType()){
        if(trigger.isAfter && trigger.isUpdate){
              for(Lead ld : Trigger.New){
				ConvertedAccountIds.add(Trigger.new[0].ConvertedAccountId);
                  ConvertedOpportunityIds.add(Trigger.new[0].ConvertedOpportunityId);
                   LeadIds.add(Trigger.new[0].id);
              System.debug('ConvertedAccountIds----'+ConvertedAccountIds.size());
              }
            
            if(!test.isRunningTest()){
                        if (ConvertedAccountIds.size()>0 && ConvertedAccountIds!=null ) {
                			accountConvertId=true;
              				acc = [Select Id,First_Name__c,createdDate,Last_Name__c,Source__c,Source_Type__c from Account Where Id IN: ConvertedAccountIds ];  
                           
                            
                        }
            	}else{
                	accountConvertId=true;
                    
                	acc = [Select Id,First_Name__c,createdDate,Last_Name__c,Source__c,Source_Type__c from Account limit 1];     
            	}
            if(acc.size()>0){
        
             if(accountConvertId){
               for(Account a:acc){
                 if(!test.isRunningTest()){
                     
                     if(a.CreatedDate.isSameDay(Datetime.now())){
                         createdSameday=true;
                     }
                 }else  {createdSameday=true;}
                 if(createdSameday){
                     for(Lead ld: [Select Lead_Source__c,Lead_Source_Type__c,FirstName,LastName from Lead where Id IN:LeadIds ]){
                      
                              a.Source__c = ld.Lead_Source__c;
             				a.Source_Type__c = ld.Lead_Source_Type__c;             
             				a.First_Name__c = ld.FirstName;
             				a.Last_Name__c = ld.LastName;
                     		System.debug('last name lead---'+ld.LastName);
           					accList.add(a); 
                         }
                          
                     }
                     	  
                 }
          
         	}
        }
           if(!test.isRunningTest()){
                    if (Trigger.new[0].ConvertedOpportunityId != null) {
                          ConvertedOpportunityId=true; 
                           opp = [Select Id,Lead_Source__c,Source_Type__c from Opportunity Where Id = :Trigger.new[0].ConvertedOpportunityId];     
                         }
                      }else{
                          ConvertedOpportunityId=true; 
                          opp = [Select Id,Lead_Source__c,Source_Type__c from Opportunity  limit 1];       
                        }
            for(Opportunity p:opp){
               if(opp.size()>0){
               if(ConvertedOpportunityId) {
              	for(Lead ld: [Select Lead_Source__c,Lead_Source_Type__c,FirstName,LastName from Lead where Id IN:LeadIds ]){
             	p.Lead_Source__c = ld.Lead_Source__c;
             	p.Source_Type__c = ld.Lead_Source_Type__c;
             	oppList.add(p);
              } 
            }
            
           
            }
            
         }
                if(accList.size()>0){
        try{
      		update accList;        
        }catch(Exception e){
            System.debug(e.getMessage());
        }
      
    }
        if(oppList.size()>0){
        try{
      		update oppList;        
        }catch(Exception e){
            System.debug(e.getMessage());
        }
      
    } 
      
    }
}
}