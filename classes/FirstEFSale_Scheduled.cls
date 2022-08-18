public class FirstEFSale_Scheduled implements Schedulable{
    public void execute(SchedulableContext sc)
    {
        FirstEFSale();
    }
    
    public void FirstEFSale(){
        
        Map<Id, AggregateResult> firstEFsale = new Map<Id, AggregateResult>([SELECT Id, AccountId, MIN(First_Transaction__c) 
                       FROM Opportunity 
                       WHERE Account.First_Entity_Formation_Sale__c = NULL 
                       AND Account.LastModifiedDate = TODAY 
                       AND RecordType.Name = 'Entity Formation' 
                       AND ChargentSFA__Transaction_Total__c >= 1000 
                       GROUP BY AccountId, Id]);
        
        List<Opportunity> opps = new List<Opportunity>([Select Id, AccountId, First_Transaction__c
                                 FROM Opportunity
                                 WHERE Id =:firstEFsale.keySet()]);
        
        List<Account> accIds = new List<Account>();
        Map<Id, DateTime> AccMap = new Map<Id, DateTime>();
        
		if(!opps.isEmpty()) {
            for(Opportunity oppsB : opps){
                 AccMap.put(oppsB.AccountId, oppsB.First_Transaction__c);               
            }
            
            for(account acc: [SELECT Id, First_Entity_Formation_Sale__c FROM Account WHERE Id in: AccMap.keyset()]){
                acc.First_Entity_Formation_Sale__c = AccMap.get(acc.Id);
                accIds.add(acc);
            }
                      
         
            update accIds;
        }
        
    }
}