global class FlagActiveClientsbatchCls implements Database.Batchable<sObject>{
  private String query; 
      global FlagActiveClientsbatchCls(string query){
            this.query = query;
            
        }
     global database.QueryLocator start(Database.BatchableContext BC) {
    
       return Database.getQueryLocator(this.query);    

        
    }  
     global void execute(Database.BatchableContext bc,List<account> flagactiveclients){
        List <account> flagactivetoinactiveClientList = New List <account>();
       
        for(account flagactiveClient : flagactiveclients)
        {
            flagactiveClient.Inactive_Client__c  = TRUE; 
            flagactivetoinactiveClientList.add(flagactiveClient);
    }
         if(!flagactivetoinactiveClientList.isEmpty()){
             update flagactivetoinactiveClientList;
         }

         
     }
    
         global void finish(Database.BatchableContext BC){
        system.debug('Batch execution completed.');
    }                          
   
    
  /*  public void flagInactiveClients(){
        
        
        List<Account> accountsareactive = new List<Account>([ Select Id, Inactive_Client__c, Total_Value_of_All_Sales__c  FROM Account
                                                            WHERE 
                                                            Inactive_Client__c=false AND
                                                            NAME!='Advisors, Anderson' AND
                                                            
                                                            Id NOT IN(
                                                            SELECT AccountId
                                                            FROM Opportunity
                                                            
                                                            WHERE
                                                            
                                                            Account.Total_Value_of_All_Sales__c >= 1500 AND
                                                            
                                                            (((RecordType.Name = 'State Renewal' OR RecordType.Name = 'Standard Renewal') 
                                                            AND ( ( StageName = 'Qualification' OR ( StageName =  'Closed Won' AND CloseDate = LAST_N_days:365 ))) )
                                                            
                                                            OR ((RecordType.Name = 'Platinum Subscription' OR RecordType.Name = 'Bookkeeping Subscription') 
                                                            AND StageName != 'Closed Lost')
                                                            
                                                            OR ((RecordType.Name = 'Entity Formation' OR RecordType.Name = 'Tax Compliance')
                                                            AND (StageName = 'Closed Won' OR StageName = 'Fulfillment/Partial Payment')
                                                            AND CloseDate = LAST_N_days:365) ))                                                        
                                                            ]);
                
        if(!accountsareactive.isEmpty()) {
            for(Account acc : accountsareactive){
                acc.Inactive_Client__c  = TRUE;              
            }
            
            update accountsareactive;
            
        }
        
           List<Account> accountsareInactive = new List<Account>([ Select Id, Name, Inactive_Client__c, LastModifiedDate, Total_Value_of_All_Sales__c  FROM Account
                                                        WHERE 
                                                        Inactive_Client__c=true AND
                                                        NAME!='Advisors, Anderson' AND
                                                        
                                                        
                                                        Id IN(
                                                        SELECT AccountId
                                                        FROM Opportunity
                                                        
                                                        WHERE
                                                        Account.Total_Value_of_All_Sales__c >= 1500 AND
                                                        
                                                        (((RecordType.Name = 'State Renewal' OR RecordType.Name = 'Standard Renewal') 
                                                        AND ( ( StageName = 'Qualification' OR ( StageName =  'Closed Won' AND CloseDate = LAST_N_days:365 ))) )
                                                        
                                                        OR ((RecordType.Name = 'Platinum Subscription' OR RecordType.Name = 'Bookkeeping Subscription') 
                                                        AND StageName != 'Closed Lost')
                                                        
                                                        OR ((RecordType.Name = 'Entity Formation' OR RecordType.Name = 'Tax Compliance')
                                                        AND (StageName = 'Closed Won' OR StageName = 'Fulfillment/Partial Payment')
                                                        AND CloseDate = LAST_N_days:365) ))                                                         
                                                            ]);
        if(!accountsareInactive.isEmpty()) {
            for(Account acc : accountsareInactive){
                acc.Inactive_Client__c  = FALSE;              
            }
            
            update accountsareInactive;
            
        }
        
    }

    public void flagActiveClients(){
        
        
     
        
    }*/
}