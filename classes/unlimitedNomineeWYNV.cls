public class unlimitedNomineeWYNV implements Schedulable{
    public void execute(SchedulableContext sc)
    {
        nomineeRenewal();
    }
    
    public void nomineeRenewal(){
        
        Map<Id, Opportunity> capRenewals = new Map<Id, Opportunity>([SELECT Id FROM Opportunity WHERE Amount = 1092 AND StageName = 'Qualification' AND 
                                                                     RecordType.Name LIKE '%Renewal%' AND Id IN (SELECT Opportunity__c 
                                                                                                                 FROM SaleEntity__c 
                                                                                                                 WHERE (Type__c = 'Corporation' AND Organizational_State__c = 'Wyoming') 
                                                                                                                 OR Organizational_State__c = 'Nevada')]);
        
        Map<Id, Account> capClients = new Map<Id, Account>([SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity WHERE Id =:capRenewals.keySet())]);
        
        List<OpportunityLineItem> newNomRenewals = new List<OpportunityLineItem>([Select Id FROM OpportunityLineItem WHERE Opportunity.StageName = 'Qualification' 
                                                                                  AND Opportunity.AccountId =: capClients.keySet() AND Opportunity.Name != 'Corporate Assistance Program Renewal' 
                                                                                  AND Product2.Name = 'Nominee Service Annual Renewal' AND CreatedDate = TODAY AND UnitPrice > 0 
                                                                                  AND OpportunityId IN (SELECT Opportunity__c 
                                                                                                        FROM SaleEntity__c 
                                                                                                        WHERE (Type__c = 'Corporation' AND Organizational_State__c = 'Wyoming') 
                                                                                                        OR Organizational_State__c = 'Nevada')
                                                                                 ]);
        
        if(!newNomRenewals.isEmpty()) {

            for(OpportunityLineItem oppLI : newNomRenewals){
                oppLI.UnitPrice = 0;              
            }
            
            update newNomRenewals;
        }
        
    }
}