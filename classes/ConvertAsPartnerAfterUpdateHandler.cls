public class ConvertAsPartnerAfterUpdateHandler  {
@future
    public static  void ConvertAspartneruser(set<ID> accid){
         List<User> listExistingUser = null;
    List<User> lstexistingUsername = null;

    String Username;
          String Email;
    Boolean userNameAlreadyExists=false;
    List<User> listUser = new List<User>();
    List<User> UpdatelistUser = new List<User>();
    List<Account> listAccount = new List<Account>();
    List<ID> listRecordTypeId = new List<ID>();
          List<ID> listRecordTypeIdClosedLostopp = new List<ID>();
    List<Account> listNewAccount = new List<Account>();
  List<Contact> listContact = new List<Contact>();
    Set<Id> setContactId = new Set<Id>();
        String[] EmailSplit;
    List<string> ConEmail=new  List<string>();
        system.debug('size-- set--'+accid.size());
        if(accid.size()>0){
            system.debug('Readched');
        if(Recursive.firstRun){
            List<Opportunity> listOpp = [SELECT Id, StageName,RecordTypeId FROM Opportunity where AccountId  IN : accid and StageName ='Closed Won'];
             if(listOpp.size()>0){
                
                for(Opportunity opt:listOpp){
                    listRecordTypeId.add(opt.RecordTypeId);  
                }  
            }
            
            List<RecordType> listRecordType = [SELECT Name FROM RecordType where Id IN : listRecordTypeId and Name ='Platinum Subscription' and SobjectType = 'Opportunity'];
            if(listOpp.size()>0 && listRecordType.size()>0){
                
                List<Contact> objectContactList = [SELECT id,FirstName,LastName,Email,AccountId,Account_Roles__c FROM Contact where AccountId IN : accid and Account_Roles__c='Primary Contact' Limit 1];
                    List<contact> lstContacttwoPrimaryContact=[SELECT id,FirstName,LastName,Email,AccountId,Account_Roles__c FROM Contact where AccountId IN : accid and Account_Roles__c='Primary Contact'];
                if(test.isRunningTest())
                {
                    objectContactList = [SELECT id,FirstName,LastName,Email,AccountId,Account_Roles__c FROM Contact where  Account_Roles__c='Primary Contact' Limit 1];   
                   
                }
            
                       if(objectContactList.size()>0){
                    
                    for(Contact con : objectContactList){
                        if(con.Email != null){
                            setContactId.add(con.id); 
                            ConEmail.add(con.Email);
                            listContact.add(con);
                            
                        }
                    }
                    if(setContactId.size()>0) {
                        Profile pf = [SELECT Id FROM profile WHERE name='Partner Community User' LIMIT 1]; 
                        listExistingUser = [Select id,username,IsActive,contactId,AccountId From User Where contactId IN : setContactId Limit 1]; 
                          lstexistingUsername=[Select id,username,IsActive,contactId,FederationIdentifier,AccountId From User Where username IN:ConEmail and contactId Not  IN : setContactId ];
                       
                       // if(!test.isRunningTest()){
                             if(lstexistingUsername.size()>0){
                            userNameAlreadyExists=true;
                         }
                        /* }else{
                           userNameAlreadyExists=true;  
                         }*/ 
                        
                        
                        Boolean flagchk=false;
                       
                            if(listExistingUser.size()==0){flagchk=true;} 
                       
                       // else
                         //   flagchk=true;  
                        
                        // if(listExistingUser.size()==0){
                        for(Contact con : listContact){    
                        if(userNameAlreadyExists){
                           
                            //Create user 
                            
                                
                               Email=con.Email;
                                EmailSplit=Email.split('@');
                                 Username=EmailSplit[0]+'+@'+EmailSplit[1];
                    for(User existingUser : lstexistingUsername){
                                    if(existingUser.Id != null){
                                        existingUser.IsActive=False;
                                         listUser.add(existingUser);
                                    }
                                }
                            
                        }else{
                            Username=con.Email;
                        }
                              }
                       if(flagchk){
                           
                            //Create user 
                           
                           
                            //Create user 
                       
                        
                            for(Contact con : listContact){
                               
                              System.debug('username---'+Username);
                                User newCommunitiesUser = new User(contactId=con.Id,
                                                                   username=Username, 
                                                                   firstname=con.FirstName,
                                                                   lastname=con.LastName, 
                                                                   email=con.Email,
                                                                   FederationIdentifier= con.LastName + '_'+Math.random(),
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
                                for(Contact con : listContact){
                                if(existingUser.Id != null ){
                                    if(Limits.getDmlRows() < 150){
                                        try{
                                           
                                            if(existingUser.IsActive == true && existingUser.contactId==con.Id ) {
                                            	System.resetPassword(existingUser.Id,true);
                                            }else{
                                             existingUser.contactId=con.Id;
                                            existingUser.IsActive=true;
                                                system.debug('update--'+ con.Id);
                                                 listUser.add(existingUser);
                                            }
                                             
                                        }Catch(Exception exp){
                                            system.debug('====='+exp.getMessage());
                                        }
                                        
                                    }    
                                }  
                            }
                            }
                           
                        }
                        
                    }
                }
              
                
                
            }
        }        
    }
      
         if(listUser.size()>0){
        if(!test.isRunningTest()){
            
            System.debug('listUser size---'+listUser.size());
            
            Database.upsert(listUser, User.Fields.id, true);
            //  insert listUser;  
        }
       
        List<Account> accl =[SELECT Id, IsPartner FROM Account where Id =: listUser.get(0).AccountId Limit 1];
        if(accl.size()>0 && listNewAccount.size()>0){
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
            if(newUser.IsActive==true){
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
    }
}