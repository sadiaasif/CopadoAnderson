trigger DeactivatePlatinumUser on Account (after update) {
    
    system.debug('DeactivatePlatinumUser == ');
    
    if(trigger.new[0].Platinum_Client_View__c != trigger.old[0].Platinum_Client_View__c){
        
        system.debug('Entered into trigger == ');
        
        String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'opportunity' and name = 'Platinum Subscription'].Id;
        
        if(trigger.new[0].Platinum_Client_View__c == '' || trigger.new[0].Platinum_Client_View__c == null){            
            
            Opportunity o = [SELECT Id,AccountId,StageName,RecordTypeId  FROM Opportunity where AccountId = :trigger.new[0].id and RecordTypeId = :strRecordTypeId  LIMIT 1];
            
            system.debug('StageName 1 == ' + o.StageName);
            
            if(o.StageName != 'Closed Won') {
                
                Set<Id> usr = new Set<Id>();
                
                for(User u : [SELECT Id FROM User where AccountId = :o.AccountId]) {
                    usr.add(u.id);
                }
                
                 if(System.IsBatch() == false && System.isFuture() == false){
                                          
                        DeactivateUser.UserInactiveMethod(usr);
                      
                } 
                
            }   
            
        } else {
            
            Opportunity o = [SELECT Id,AccountId,StageName,RecordTypeId  FROM Opportunity where AccountId = :trigger.new[0].id and RecordTypeId = :strRecordTypeId LIMIT 1];
            
            system.debug('StageName 2 == ' + o.StageName);
            
            if(o.StageName == 'Closed Won') {
                
                Set<Id> usr = new Set<Id>();
                
                for(User u : [SELECT Id FROM User where AccountId = :o.AccountId]) {
                    usr.add(u.id);
                }
                
                if(System.IsBatch() == false && System.isFuture() == false){
                       
                        DeactivateUser.UserActiveMethod(usr);
                    
                } 
            }    
            
        }
    }
}