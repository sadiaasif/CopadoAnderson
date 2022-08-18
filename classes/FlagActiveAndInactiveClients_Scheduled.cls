public class FlagActiveAndInactiveClients_Scheduled implements Schedulable{
    public void execute(SchedulableContext sc)
    {
        flagInactiveClients();
        flagActiveClients();
    }
    
    public void flagInactiveClients(){
        
        
        List<Account> accounts = new List<Account>([ Select Id, Inactive_Client__c, Total_Value_of_All_Sales__c  FROM Account
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
                
        if(!accounts.isEmpty()) {
            for(Account acc : accounts){
                acc.Inactive_Client__c  = TRUE;              
            }
            
            update accounts;
            
        }
        
    }

    public void flagActiveClients(){
        
        
        List<Account> accounts = new List<Account>([ Select Id, Name, Inactive_Client__c, LastModifiedDate, Total_Value_of_All_Sales__c  FROM Account
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
        if(!accounts.isEmpty()) {
            for(Account acc : accounts){
                acc.Inactive_Client__c  = FALSE;              
            }
            
            update accounts;
            
        }
        
    }
}