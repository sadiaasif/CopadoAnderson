global class UpdateAccountsPrimaryContact implements 
    Database.Batchable<sObject>, Database.Stateful {
            private String query; 
       
       
        global UpdateAccountsPrimaryContact(string query){
            this.query = query;
           
        }
        global Database.QueryLocator start(Database.BatchableContext bc) { 
             
    
    

         return Database.getQueryLocator(this.query);
        }
        global void execute(Database.BatchableContext bc,List<Account> scope){
         Map<id,Contact> conmap=new Map<id,Contact>();
            set<ID> accid=new set<ID>();
            for(Account a:scope){
                if(a.contacts.size()==1){
                    for(Contact con:a.contacts){
                   conmap.put(con.id,con);
                 }
                }
                 
            }
            for(contact c :conmap.values() ){
                c.Account_Roles__c='Primary Contact';
                
            }
          
            update conmap.values();
          
            
        }
          global void finish(Database.BatchableContext bc){
          }
}