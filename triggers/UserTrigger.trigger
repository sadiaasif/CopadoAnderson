/*****************************************************************************************************************************
@ Trigger:       UserTrigger
@ Version:       1.0
@ Author:        Sadia Asif
@ Description:   This trigger is used to AssignPermissionSet to “For Partner Community User” and Updating values of 
                 LoginHistoryCount and updateLoginCount based on last login of current user in last 6 months     
*****************************************************************************************************************************/
trigger UserTrigger on User (before update, after insert) {
    
    public static String partnerUserProfileId = Label.PartnerUserProfileId;
    public static String Role='Bookkeeping';
    Set<ID> usersId = new Set<Id>();
    Set<ID> setofuserId = new Set<Id>();
    //code change
     Set<ID> setofuserId2 = new Set<Id>();
    Set<Id> contactIdsSet = new Set<Id>();
    Integer daysLoggedIn = 0;
    DateTime lastLogin;
    
    if (trigger.isInsert && trigger.isAfter)  {
        
        for (User usr :trigger.new) {
            if(usr.ProfileId == partnerUserProfileId){
                usersId.add(usr.Id);
            }
            else if(usr.Job_Role__c == Role){
                setofuserId.add(usr.Id);
            }
        }
        // Call handler class to update permission Set on user record
        if(!usersId.isEmpty()){
            AssignPermissionSetUser.AssignPermissionSetToUsers(usersId);
        }  
        
        if(!setofuserId.isEmpty()){
             ID jobID = System.enqueueJob(new RoleAutomationService(setofuserId,false));
            
        }  
    }

    if (trigger.isUpdate && trigger.isbefore) {
        
        Id systemAdmin = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].id;
        
        if(userInfo.getProfileId() == systemAdmin) {
            
            for (User u : Trigger.new) {
                
                if(u.UpdateLoginCount__c != Trigger.oldMap.get(u.id).UpdateLoginCount__c) {
                    system.debug(u.UpdateLoginCount__c);
                    
                    for (LoginHistory l : [SELECT LoginTime FROM LoginHistory WHERE UserId = :u.id AND LoginTime >= Last_N_Months:6]) {
                        
                        if(lastLogin == null) { 
                            lastLogin = l.LoginTime; daysLoggedIn += 1;
                        }
                        
                        if(!l.LoginTime.isSameDay(LastLogin)) { 
                            lastLogin = l.LoginTime; daysLoggedIn += 1;
                        }
                        
                        u.LoginHistoryCount__c = daysLoggedIn;
                        u.updateLoginCount__c = false;
                    }
                }
            }
        }
        
         for (User usr :trigger.new) {
             System.debug('@@Job Role'+ usr.Job_Role__c);
             if(usr.Job_Role__c == Role && usr.Job_Role__c !=trigger.oldMap.get(usr.Id).Job_Role__c){ setofuserId.add(usr.Id);
                 System.debug('In If Condition with Bookeeping');
             }
             else if(usr.Job_Role__c != Role && usr.Job_Role__c !=trigger.oldMap.get(usr.Id).Job_Role__c){ setofuserId2.add(usr.Id);
                    System.debug('In If Condition with Not Bookeeping');
           }
        }
        if(!setofuserId.isEmpty()){ ID jobID = System.enqueueJob(new RoleAutomationService(setofuserId,false));     
          } 
        else if(!setofuserId2.isEmpty() ){ ID jobID = System.enqueueJob(new RoleAutomationService(setofuserId2,true));
           }
        //new code
       /*    for (User usr :trigger.new) {
             if(usr.Job_Role__c != Role && usr.Job_Role__c !=trigger.oldMap.get(usr.Id).Job_Role__c){ 
                 setofuserId2.add(usr.Id);
           }
           }
         if(!setofuserId2.isEmpty() ){ ID jobID = System.enqueueJob(new RoleAutomationService(setofuserId2,true));
           } */
    }
    
    
}