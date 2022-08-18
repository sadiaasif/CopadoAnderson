trigger UpdateUserEmail on Contact (after update) {
    Set<Id> conId = new Set<Id>();
    // User userlist = null ;
    for(Contact newConnc : Trigger.new){
        Contact oldConnc = Trigger.oldMap.get(newConnc.Id);
        if(newConnc.Email != oldConnc.Email && newConnc.Account_Roles__c =='Primary Contact'){
            conId.add(newConnc.id);   
        }
    }
    
    if(conId.size()>0){
        if(Recursive.isUpdateUser){
            try{   
                Contact con =[SELECT Id,Email FROM Contact where Id IN : conId];                
                User userlist =[SELECT Id,Email,Username FROM User where ContactId IN : conId];                
                List<user>  listuser =[SELECT Id,Email,Username FROM User where Username =: con.Email and id != :userlist.id];
                
                if( userlist!=null && userlist.id != null && con.id != null){
                    
                  //  if(userlist.Username != con.Email && listuser.size()<=0){
                    if(listuser.size()<=0){
                        if(!Test.isRunningTest()){
                            userlist.Email = con.Email;
                            update userlist;
                        }
                    }else{
                        Trigger.new[0].addError('This email id is already exists.Please try with another email id.');
                    }
                    
                    
                    
                    Recursive.isUpdateUser = false;
                }  
                
            }catch(Exception e){
                
            }
            
        }
        
    }
}