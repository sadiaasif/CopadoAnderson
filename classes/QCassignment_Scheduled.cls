public class QCassignment_Scheduled implements Schedulable{
    public void execute(SchedulableContext sc)
    {
        QCassignment();
    }
    
    public void QCassignment(){
        
        List<User> QC = new List<User>([SELECT Id FROM User WHERE Title = 'Quality Control Specialist' 
                                        AND IsActive = TRUE]);
        Integer t = QC.size();
        
        List<Account> accounts = new List<Account>([SELECT Id, Auditor__c FROM Account WHERE Id NOT IN 
                                                    (SELECT AccountId FROM Opportunity WHERE 
                                                     RecordType.Name = 'Entity Formation' AND 
                                                     (Amount >=1500 OR Does_Not_Need_Blueprint__c = FALSE) 
                                                     AND First_Transaction__c >= LAST_N_MONTHS:4) 
                                                    AND Platinum_Sale_Closed_Won__c > 0 AND LastActivityDate >= LAST_N_MONTHS:18 
                                                    AND Auditor__c = NULL
                                                    LIMIT 12
                                                   ]);
        
        if(!accounts.isEmpty() && t > 0) {
            for(Integer i = 0; i < t; i++){
                for(Account acc : accounts){
                    acc.Auditor__c = QC[i].Id;              
                }
                
                update accounts;  
            }
            
        }
        
    }
}