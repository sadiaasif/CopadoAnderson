global class PasswordBatch implements Database.Batchable<Sobject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        	set<string> myset = new set<string>(); 
            LIST<Password_Change_History__c> pch = [SELECT Id, SetupAuditId__c FROM Password_Change_History__c];
            for(Password_Change_History__c m :pch){ 
                    myset.add(m.SetupAuditId__c); 
                } 
        system.debug(' myset == ' + myset);
        String paramString = 'changedpassword';
        String paramReset ='resetpassword';
        return Database.getQueryLocator('SELECT Id, Action, CreatedDate, CreatedById FROM SetupAuditTrail where id NOT IN :myset and (Action = :paramString OR Action =:paramReset)'+(Test.isRunningTest()?' LIMIT 1':''));
    }
    global  void execute(DataBase.BatchableContext Bc,list<SetupAuditTrail> scope) 
    {
        system.debug(' scope == ' + scope);
       Map<Id,ID>map_Account_user = new Map<ID,Id>(); 
        List<User>lstUser = [select id,accountid from user];
        for(User objUser : lstUser){
            map_Account_user.put(objUser.id,objUser.accountid);
            
        }
        List<Password_Change_History__c> resultss = new List<Password_Change_History__c>();
        for(SetupAuditTrail SA : scope ){
            
            Password_Change_History__c PCH = new Password_Change_History__c();
            PCH.Message__c = sa.Action;
            PCH.SetupAuditId__c = sa.id;
            PCH.UserName__c = sa.CreatedById;
            PCH.Date__c = sa.CreatedDate;
            if(map_Account_user.get(sa.CreatedById)!=null){
           	PCH.resetpassword__c = map_Account_user.get(sa.CreatedById);
            }
            resultss.add(PCH); 
           
        }
        
        Database.upsert (resultss);
        system.debug('---->'+resultss);                                                                              
    } 
    
    global void finish(Database.BatchableContext BC)
    {
        
    }
    
    
}