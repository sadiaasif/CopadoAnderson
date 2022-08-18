/**
* Trigger to used to  restrict create duplicate record for same client and also handle update funtionality for not change the client name.
* 
* @author ranjitk
* @version 1.0 - Sep 20, 2018
*/ 
trigger RestrictMultipleRecord on Infinity_Calculator__c (before insert,before update) {
    
    Map<Id,Infinity_Calculator__c> mapKey = new Map<Id,Infinity_Calculator__c>();
    if(Trigger.isInsert){
        For(Infinity_Calculator__c infinite : Trigger.new){
            mapKey.put(infinite.Account__c, infinite);
        } 
        
        if(!mapKey.isEmpty()){
            for(Infinity_Calculator__c cal : [Select Account__c from Infinity_Calculator__c where Account__c IN: mapKey.keySet()]){
                if(mapKey.containsKey(cal.Account__c)){
                    mapKey.get(cal.Account__c).addError('Please select another client.');
                }  
                
            }      
        }   
    }
    
    if(Trigger.isUpdate){
        For(Infinity_Calculator__c infinitecal : Trigger.new){
            if(infinitecal.Account__c !=  trigger.oldmap.get(infinitecal.id).Account__c){
                infinitecal.Account__c.addError('Please select same client');  
            }
        }  
    }
    
}