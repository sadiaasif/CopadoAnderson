global class FlagInActiveClientsbatchCls implements Database.Batchable<sObject> {
 private String query; 
     
      global FlagInActiveClientsbatchCls(string query){
            this.query = query;
            
        }
     global database.QueryLocator start(Database.BatchableContext BC) {
    
       return Database.getQueryLocator(this.query);    

        
    }   
     global void execute(Database.BatchableContext bc,List<account> flagInActiveclients){
        List <account> flagInactivetoinactiveClientList = New List <account>();
       
        for(account flagInactiveClient : flagInActiveclients)
        {
            flagInactiveClient.Inactive_Client__c  = False; 
            flagInactivetoinactiveClientList.add(flagInactiveClient);
    }
         if(!flagInactivetoinactiveClientList.isEmpty()){
             update flagInactivetoinactiveClientList;
         }

         
     }
    
         global void finish(Database.BatchableContext BC){
        system.debug('Batch execution completed.');
    }                          
        
   
}