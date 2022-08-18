global class ActionComponentForCommCtrl {
       @AuraEnabled
    public static List<string> getContactListPicklict(Id accId) {
          String sObjName = accId.getSObjectType().getDescribe().getName();
        System.debug('objectName=='+sObjName);
       
        List<String> ConNameoptions = new List<String>();
      List<contact> contactList=new List<contact>();
 	if(sObjName=='Account'){
            contactList=[Select Id, Name  From contact where AccountId=:accId];
        for(contact con: contactList){
            ConNameoptions.add(con.name);
            
        } 
        }
         if(sObjName=='opportunity'){
             Id oppaccid=[Select Accountid from opportunity where id=:accId].Accountid;
               contactList=[Select Id, Name  From contact where AccountId=:oppaccid];
        for(contact con: contactList){
            ConNameoptions.add(con.name);
            
        } 
         }
             if(sObjName=='Entities__c'){
             Id Enaccid=[Select Primary_Client__c from Entities__c where id=:accId].Primary_Client__c;
               contactList=[Select Id, Name  From contact where AccountId=:Enaccid];
        for(contact con: contactList){
            ConNameoptions.add(con.name);
            
        } 
         }           
        if(sObjName=='Case'){
             Id Caseaccid=[Select AccountId from Case where id=:accId].AccountId;
               contactList=[Select Id, Name  From contact where AccountId=:Caseaccid];
        for(contact con: contactList){
            ConNameoptions.add(con.name);
            
        } 
         }
      
        return ConNameoptions;
    }
         @AuraEnabled
    public static Boolean CreateTask(Id accId,String Comments,string subject,String contactName,string userId) {
        System.debug('ConName=='+contactName);
        contact con=new Contact();
        Id oppaccid;
          Id Enaccid;
        Id Caseaccid;
        String getsObjName = accId.getSObjectType().getDescribe().getName();
         User CurrentUser=[Select Id,Name from User where id =:userId limit 1];
        if(getsObjName=='opportunity'){
             oppaccid=[Select Accountid from opportunity where id=:accId].Accountid;
             con=[Select Id from contact where name=:contactName and AccountId=:oppaccid limit 1];
        }else if(getsObjName=='Account'){
              con=[Select Id from contact where name=:contactName and AccountId=:accId limit 1];
        }else if(getsObjName=='Entities__c'){
              Enaccid=[Select Primary_Client__c from Entities__c where id=:accId].Primary_Client__c;
            con=[Select Id from contact where name=:contactName and AccountId=:Enaccid limit 1];
        }else if(getsObjName=='Case'){
              Caseaccid=[Select AccountId from Case where id=:accId].AccountId;
             con=[Select Id from contact where name=:contactName and AccountId=:Caseaccid limit 1];
        }
       
        Id conID;
        if(con!=null){
            conID= con.id;
        }
        Task Logacalltask=new Task();
        Logacalltask.OwnerId=CurrentUser.id;
        Logacalltask.Description=Comments;
        Logacalltask.Subject=subject;
        Logacalltask.WhoId=conID;
       if(getsObjName=='Account'){
             Logacalltask.Client__c=accId;
       }else if(getsObjName=='opportunity'){
             Logacalltask.Client__c=oppaccid;
       }else if(getsObjName=='Entities__c'){
               Logacalltask.Client__c=Enaccid;
       }else if(getsObjName=='Case'){
             Logacalltask.Client__c=Caseaccid;
       }
       
      Logacalltask.WhatId=accId;
        Logacalltask.status='Completed';
         Logacalltask.ActivityDate=System.Today();
        
 try{
            insert Logacalltask;    
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
    }
}