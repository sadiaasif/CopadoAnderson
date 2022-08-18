public class EntityCount {
    
    public static boolean alreadyProcessed = false;
    
    public static void countEntities(List<Account> newList, Map<Id,Account> oldMap) {
        
        if (alreadyProcessed == true) return;
        alreadyProcessed = true;
        
        for (Account acc : newList) {
			
            if(acc.Event_Snapshot__c == oldMap.get(acc.Id).Event_Snapshot__c) {
            
            Integer count = [Select count() FROM Entities__c Where Primary_Client__c = :acc.Id AND Status__c != 'Inactive'];
            acc.Entity_Count__c = count;
            
            }
        }
  
    }

}