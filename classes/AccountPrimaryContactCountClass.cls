global class AccountPrimaryContactCountClass implements 
    Database.Batchable<sObject>, Database.Stateful {
            private String query; 
       
       
        global AccountPrimaryContactCountClass(string query){
            this.query = query;
           
        }
        global Database.QueryLocator start(Database.BatchableContext bc) { 
             
    
    

         return Database.getQueryLocator(this.query);
        }
        global void execute(Database.BatchableContext bc,List<Account> scope){
         Map<id,account> accmap=new Map<id,account>();
            set<ID> accid=new set<ID>();
            for(Account a:scope){
                 for(Contact con:a.contacts){
                     if(con.Account_Roles__c=='Primary Contact'){
                         accmap.put(a.id,a);
                         
                     }
                 }
            }
            for(Account a :accmap.values() ){
                a.Primary_Contact_Count__c=1;
                
            }
          
            update accmap.values();
          
            
        }
          global void finish(Database.BatchableContext bc){
          }
}