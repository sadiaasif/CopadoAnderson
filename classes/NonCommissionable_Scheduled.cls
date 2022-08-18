public class NonCommissionable_Scheduled implements Schedulable{
public void execute(SchedulableContext sc)
    {
        NonCommissionableItems();
    }
    
    public void NonCommissionableItems(){
     
        List<AggregateResult> NonCommissionableList = new List<AggregateResult>([SELECT SUM(TotalPrice) totalItemPrice, OpportunityId Id
                                                                                      FROM OpportunityLineItem WHERE 
                                                                                      Product2.Non_Commissionable__c = TRUE 
                                                                                      AND OpportunityId IN (SELECT Id FROM Opportunity 
                                                                                                             WHERE Amount > 0 AND LastModifiedDate = TODAY 
                                                                                                             AND (RecordType.Name = 'Entity Formation' 
                                                                                                                  OR RecordType.Name = 'Infinity Subscription' 
                                                                                                                  OR RecordType.Name = 'Tax Compliance' 
                                                                                                                  OR RecordType.Name = 'Bookkeeping')
                                                                                                            ) 
                                                                                      GROUP BY OpportunityId]);
        Map<String, Decimal> NCMap = new Map<String, Decimal>();
        List<Opportunity> oppIds = new List<Opportunity>();
        
        if(NonCommissionableList.size() > 0){
            for(AggregateResult aggResult : NonCommissionableList){
                NCMap.put((String)aggResult.get('Id'), (Decimal)aggResult.get('totalItemPrice'));
            }
            for(Opportunity opp : [Select Id, Total_Non_Commissionable_Amount__c FROM Opportunity WHERE Id =:NCMap.keySet()]){
                opp.Total_Non_Commissionable_Amount__c = NCMap.get(opp.Id);
                oppIds.add(opp);
            }
        }
        update oppIds;
    }
}