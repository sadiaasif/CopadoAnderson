public class NPSenrollment_Scheduled implements Schedulable{
    public void execute(SchedulableContext sc)
    {
        NPSenrollment();
    }
    
    public void NPSenrollment(){
        
        List<Contact> currentNPSRecipients = [SELECT Id FROM Contact WHERE NPS_Recipient__c = TRUE];
        
        Set<Account> accountSet = new Set<Account>();
        
        List<Contact> contacts = new List<Contact>([SELECT Id, AccountId, NPS_Recipient__c FROM Contact WHERE AccountId IN (  SELECT AccountId FROM Opportunity WHERE
                                                                                                                            
                                                                                                                            // Entity Formation Sales - 6 week
                                                                                                                            ((RecordType.Name = 'Entity Formation' OR RecordType.Name = 'Tax Compliance') 
                                                                                                                             AND Amount >=1500
                                                                                                                             AND StageName = 'Closed Won' 
                                                                                                                             AND CloseDate <= N_DAYS_AGO:43
                                                                                                                             AND CloseDate > N_DAYS_AGO:181
                                                                                                                             AND Account.First_Entity_Formation_or_Tax_Sale__c <= N_DAYS_AGO:43 
                                                                                                                             AND Account.First_Entity_Formation_or_Tax_Sale__c > N_DAYS_AGO:181)
                                                                                                                            
                                                                                                                            OR
                                                                                                                            
                                                                                                                            // Entity Formation Sales - 6 month
                                                                                                                            ((RecordType.Name = 'Entity Formation' OR RecordType.Name = 'Tax Compliance') 
                                                                                                                             AND Amount >=1500
                                                                                                                             AND StageName = 'Closed Won' 
                                                                                                                             AND CloseDate >= N_DAYS_AGO:31
                                                                                                                             AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182)
                                                                                                                            
                                                                                                                            OR
                                                                                                                            
                                                                                                                            // Subscription Sales - 6 month
                                                                                                                            ((RecordType.Name = 'Platinum Subscription' OR RecordType.Name = 'Bookkeeping Subscription')
                                                                                                                             AND StageName = 'Closed Won'
                                                                                                                             AND Last_Transaction__c >= N_DAYS_AGO:35
                                                                                                                             AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182)
                                                                                                                            
                                                                                                                            OR
                                                                                                                            
                                                                                                                            // Renewals - 6 month
                                                                                                                            ((RecordType.Name = 'State Renewal' OR RecordType.Name = 'Standard Renewal')
                                                                                                                             AND (CloseDate >= NEXT_N_DAYS:365 OR CloseDate = YESTERDAY)
                                                                                                                             AND (StageName = 'Closed Won' OR StageName = 'Qualification')
                                                                                                                             AND Account.First_Entity_Formation_or_Tax_Sale__c < N_DAYS_AGO:182)
                                                                                                                           )
                                                    
                                                    
                                                    
                                                    AND NPS_Recipient__c = FALSE 
                                                    AND Account_Roles__c = 'Primary Contact'
                                                    AND AccountId != null
                                                    AND (Account.Last_NPS_Sent__c <= N_DAYS_AGO:181 OR Account.Last_NPS_Sent__c = null)
                                                    ORDER BY Account.First_Entity_Formation_or_Tax_Sale__c DESC
                                                    LIMIT 16]);
        
        if(currentNPSRecipients.size() <= 112) {
            
            if(!contacts.isEmpty()) {
                for(Contact con : contacts){
                    con.NPS_Recipient__c = TRUE;
                    
                    for(Account acc : [SELECT Last_NPS_Sent__c FROM Account WHERE Id = :con.AccountId]){
                        acc.Last_NPS_Sent__c = Date.today();
                        accountSet.add(acc);
                    }
                }
                
                
                update contacts;
            }
        }
        if(currentNPSRecipients.size() <= 112) { 
            
            if(!accountSet.isEmpty()){
                List<account> accounts = new List<Account>(accountSet);
                update accounts;
            }
        }
        
    }
}