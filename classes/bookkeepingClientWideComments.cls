public class bookkeepingClientWideComments {
    
    public static boolean alreadyProcessed;
    
    public static void ClientWideComments(List<Bookkeeping__c> newList, Map<Id,Bookkeeping__c> oldMap){
        
        if (alreadyProcessed == true) return;
        alreadyProcessed = true;
        
        List<Bookkeeping__c> updateList = new List<Bookkeeping__c>();

		for (Bookkeeping__c bk : newList) {
        
            if (bk.Client_Wide_Comments__c != OldMap.get(bk.Id).Client_Wide_Comments__c && bk.Set_of_Books__c == null) {
            
        		for (Bookkeeping__c allBk : [SELECT Id,Client_Wide_Comments__c 
                                             From Bookkeeping__c 
                                             WHERE Client_Name__c = :bk.Client_Name__c 
                                             AND Id != :bk.id AND Set_of_Books__c = null]) {
   
                    allBk.Client_Wide_Comments__c = bk.Client_Wide_Comments__c;
                	updateList.add(allBk);
                    
                }
                                   
            }
        }
        
      update updateList;  
  
    }
    
}