/**
* A controller class used to fetch Message page data.
* 
* @author prateeks
* @version 1.0 - Jan 30, 2018
*/
public without sharing class MessageController {
    
    Public User usObj{get;set;}
    Public Contact con{get;set;}
    Public Account acc{get;set;}
    
    public MessageController(ApexPages.StandardController controller) {          
        usObj=[Select id,Username,AboutMe,Name,FirstName,LastName,Phone,ContactId,SmallPhotoUrl,FullPhotoUrl,AccountId,Email,Alias,ProfileId,Title,MobilePhone,LastLoginDate,CreatedDate,Client_Image__c,IsActive from User where Id=:UserInfo.getUserId() Limit 1];
        system.debug('UserObj=='+usObj);
        con=new Contact();
        acc=new Account();
        try{
            if(usObj.contactid!=null) {    
                con=[Select id,Name,Email,accountid,account.Platinum_Client_View__c,account.Assigned_CAM__c,account.Assigned_CSR__c,account.Phone,account.CAM_Pic__c,account.CAM_Ext__c,account.CAM_Email__c,account.CSR_Pic__c,account.CSR_Ext__c,account.CSR_Email__c,account.Senior_Advisor__c,account.Senior_Advisor_Pic__c,account.Bookkeeper__c,account.Bookkeeper_Pic__c,account.Tax_Preparer__c,account.Tax_Preparer_Pic__c,FirstName, LastName From contact where id =:usObj.contactid limit 1];
                system.debug('con=='+con);
                acc=[Select id,Name,Platinum_Client_View__c,Assigned_CAM__c,Assigned_CSR__c,Account_Number__c,First_Name__c,Last_Name__c From Account where id =:con.accountid limit 1];
            }    
        }catch(Exception e){
            system.debug('==== Exception  ====' + e);
        }        
    }
    /**
* This method is used to show activity history of User on Message page.
* 
* @author prateeks
* @date Dec 20, 2017
* @return <code>Email Activity</code>
*/
    public List<ActivityHistory> getIncomingTaskHistory() {
      
       /* List<ActivityHistory> listacti=new List<ActivityHistory>();
        for(Account lstaccounthist:[SELECT id,(SELECT Id, Status, ActivityType, Description, Subject, CreatedDate FROM ActivityHistories where ActivityType = 'Email' ORDER BY ActivityDate DESC, LastModifiedDate DESC) FROM Account WHERE id =:con.Accountid  LIMIT 1000]){
            try{
                listacti=lstaccounthist.ActivityHistories;
                system.debug('==listacti=='+listacti);
                System.debug('Try==size=='+listacti.size());
            }
            catch(QueryException e)
            {
                for(ActivityHistory ah:lstaccounthist.ActivityHistories)
                {
                    listacti.add(ah);
                    system.debug('==listacti=='+listacti);
                    System.debug('Catch==size=='+listacti.size());
                }
            }
        }*/
        
        try{      
            system.debug('==== con.Accountid  ====' + con.Accountid);
            List<Account>lstaccounthist=[SELECT id,(SELECT Id, Status, ActivityType, Description, Subject, CreatedDate FROM ActivityHistories where ActivityType = 'Email' ORDER BY ActivityDate DESC, LastModifiedDate DESC LIMIT 200) FROM Account WHERE id =:con.Accountid  LIMIT 1000]; 
            system.debug('lstaccount==='+lstaccounthist);
            List<ActivityHistory>listacti=new List<ActivityHistory>();	
            for(Account acc: lstaccounthist){
                listacti.addall(acc.ActivityHistories);
            }
            system.debug('==== listacti  ====' + listacti);
            return listacti;
        } catch(Exception e){
            system.debug('==== Exception  ====' + e);
            return null;
        }
        
        
    }
    
    
    @RemoteAction
    public static List<ActivityHistory> getTaskDescription(Id hisId,Id contAcctId) {
        try{                
            List<Account> activityList = [SELECT id,(SELECT Id, Description FROM ActivityHistories WHERE Id =:hisId ORDER BY ActivityDate DESC, LastModifiedDate DESC) FROM Account WHERE id =:contAcctId LIMIT 1000];
            List<ActivityHistory>activityDesc=new List<ActivityHistory>();	
            for(Account acc: activityList){
                activityDesc.addall(acc.ActivityHistories);
            }
            return activityDesc;
        } catch(Exception e){
            system.debug('==== Exception  ====' + e);
            return null;
        }
        
    }
    
}