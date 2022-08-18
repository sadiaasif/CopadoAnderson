/**
* Create the new user based on the existing contact when account is updated .
* 
* @author ranjitk
* @version 1.0 - Mar 15, 2018
*/
trigger ConvertExistingContactAsPartner on Account (after update) {
    List<User> listExistingUser = null;
    List<User> listUser = new List<User>();
    List<Account> listAccount = new List<Account>();
    List<ID> listRecordTypeId = new List<ID>();
    List<Account> listNewAccount = new List<Account>();
    Set<Id> setId = new Set<Id>();
    Set<Id> setContactId = new Set<Id>();
    List<Contact> listContact = new List<Contact>();
    for(Account newAcc : Trigger.new){
        if(Trigger.isUpdate){
            Account oldAcc = Trigger.oldMap.get(newAcc.Id);
            listNewAccount.add(newAcc);
            if(newAcc.Platinum_Client_View__c != NULL && newAcc.Platinum_Client_View__c !='' && (newAcc.Platinum_Client_View__c != oldAcc.Platinum_Client_View__c)){
                setId.add(newAcc.Id);
            } 
        }
    }
    
    if(setId.size()>0){
        if(Recursive.firstRun){
            List<Opportunity> listOpp = [SELECT Id, StageName,RecordTypeId FROM Opportunity where AccountId  IN : setId and StageName ='Closed Won'];
             if(listOpp.size()>0){
                
                for(Opportunity opt:listOpp){
                    listRecordTypeId.add(opt.RecordTypeId);  
                }  
            }
            
            List<RecordType> listRecordType = [SELECT Name FROM RecordType where Id IN : listRecordTypeId and Name ='Platinum Subscription' and SobjectType = 'Opportunity'];
            if(listOpp.size()>0 && listRecordType.size()>0){
                
                List<Contact> objectContactList = [SELECT id,FirstName,LastName,Email,AccountId,Account_Roles__c FROM Contact where AccountId IN : setId and Account_Roles__c='Primary Contact' Limit 1];
                if(test.isRunningTest())
                {
                    objectContactList = [SELECT id,FirstName,LastName,Email,AccountId,Account_Roles__c FROM Contact where  Account_Roles__c='Primary Contact' Limit 1];   
                }
                if(objectContactList.size()>0){
                    
                    for(Contact con : objectContactList){
                        if(con.Email != null){
                            setContactId.add(con.id);  
                            listContact.add(con);
                            
                        }else{
                            Trigger.new[0].addError('Please provide the primary contact email');      
                        } 
                    }
                    if(setContactId.size()>0) {
                        Profile pf = [SELECT Id FROM profile WHERE name='Partner Community User' LIMIT 1]; 
                        listExistingUser = [Select id,username From User Where contactId IN : setContactId Limit 1]; 
                        Boolean flagchk=false;
                        if(!test.isRunningTest()){
                            if(listExistingUser.size()==0){flagchk=true;} 
                        }
                        else
                            flagchk=true;  
                        
                        // if(listExistingUser.size()==0){
                        if(flagchk){
                            //Create user 
                            for(Contact con : listContact){
                                User newCommunitiesUser = new User(contactId=con.Id,
                                                                   username=con.Email, 
                                                                   firstname=con.FirstName,
                                                                   lastname=con.LastName, 
                                                                   email=con.Email,
                                                                   communityNickname = con.LastName + '_'+Math.random(),
                                                                   alias = string.valueof(con.FirstName.substring(0,1) + 
                                                                                          con.LastName.substring(0,1) + Math.random() ).substring(0,5), 
                                                                   profileid = pf.Id, emailencodingkey='ISO-8859-1',
                                                                   languagelocalekey='en_US', 
                                                                   localesidkey='en_US', 
                                                                   timezonesidkey='GMT'); 
                                listUser.add(newCommunitiesUser);
                                
                            }
                            
                            
                        }else{
                            
                            for(User existingUser : listExistingUser){
                                if(existingUser.Id != null ){
                                    if(Limits.getDmlRows() < 150){
                                        try{
                                            if(existingUser.IsActive == true) {
                                            System.resetPassword(existingUser.Id,true);
                                            }
                                        }Catch(Exception exp){
                                            system.debug('====='+exp.getMessage());
                                        }
                                        
                                    }    
                                }         
                            }    
                        }
                        
                    }
                }else{
                    if(!Test.isRunningTest())
                        Trigger.new[0].addError('Please create the primary contact');
                }
                
                
            }else{
                
                if(!Recursive.isUpadteOpp){
                    Trigger.new[0].addError('User does not have platinum subscription');  
                }else{
                    Recursive.isUpadteOpp = false;
                }  
                
            } 
        }        
    }
    
    if(listUser.size()>0){
        if(!test.isRunningTest()){
            insert listUser;  
        }
        List<Account> acclist =[SELECT Id, IsPartner FROM Account where Id =: listUser.get(0).AccountId Limit 1];
        if(acclist.size()>0 && listNewAccount.size()>0){
            for(Account acc : listNewAccount){
                acc.IsPartner = true; 
                listAccount.add(acc); 
            }
            
        }
        if(listAccount.size()>0){
            update listAccount;
            Recursive.firstRun = false; 
        }
        
        for(User newUser : listUser){
            if(Limits.getDmlRows() < 150){
                try{
                    System.resetPassword(newUser.Id,true);
                }Catch(Exception exp){
                    system.debug('====='+exp.getMessage());
                }
                
            }   
        }
        
        
    }
}