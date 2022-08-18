/**
* A controller class used to fetch and send email for password.
* 
* @author ranjitk
* @version 1.0 - Apr 06, 2018
*/
public with sharing class PlatinumForgotPassword {
    
    
    public PlatinumForgotPassword(CustomLoginController coustom){   
    }
    
    @RemoteAction
    public static String getForgotPassword(String emailid){
        Set<Id> accId = new Set<Id>();
        List<ID> listRecordTypeId = new List<ID>();
        try {
            User listUser = [SELECT Email, Id, Username,ProfileId, LastName, FirstName, Name, Alias, CommunityNickname,AccountId FROM User where Email=: emailid.trim()];
              
            List<Profile> listProfile =[SELECT Id, Name FROM Profile where id =:listUser.ProfileId and Name='Partner Community User'];
            if(listUser.id != null && listProfile.size()>0){
                List<Opportunity> listOpportunity = [SELECT Id ,StageName, RecordTypeId FROM Opportunity where AccountId = : listUser.AccountId and StageName = 'Closed Won'];
                if(listOpportunity.size()>0){  
                    
                    for(Opportunity opt:listOpportunity){
                        listRecordTypeId.add(opt.RecordTypeId);  
                    }
                    List<RecordType> listRecordType = [SELECT Name FROM RecordType where Id IN : listRecordTypeId and Name ='Platinum Subscription' and SobjectType = 'Opportunity'];
                    if(listRecordType.size()>0 && listUser.id!=null){ 
                        System.resetPassword(listUser.id,true);
                        return 'success'; 
                    }else{
                        return 'notPlatinumSubscription';
                    } 
                }else{
                 return 'invalidEmail';    
                }
                
            }else{
                return 'invalidEmail'; 
            }
           
            
        }catch(exception e) {
            system.debug('exception === ' + e);           
            return null;     
        }
        
    }
    
}