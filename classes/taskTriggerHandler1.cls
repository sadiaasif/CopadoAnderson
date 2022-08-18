public without sharing class  taskTriggerHandler1 {
   
  public static boolean alreadyProcessed = false; 
  public static boolean stopRun = false;
  public static boolean runOnce = true;
  public static boolean firstRun = true;
  
  public taskTriggerHandler1() {
      
  }
 
    public void taskReassignment(List<Task> newRecordsList, List<Task> oldRecordsList, Map<Id, Task> newMap, Map<Id, Task> oldMap, String eventType, String triggerType){

      if (alreadyProcessed == true) return;
          alreadyProcessed = true;

        
        list<String> clientName=new list<String>();
        map<id,string> taskMap=new map<id,string>();
        map<string,id> userDetails=new map<string,id>();

        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Tax').getRecordTypeId();
        Id profileId = [Select Id From Profile Where Name='Partner Community User'].id;     
        
        System.debug('recordTypeID is '+recordTypeID);
        System.debug('profileId is '+profileId);
        
        
        for(Task tt : newRecordsList){

            System.debug('recordtype id is'+tt.recordTypeId);

            if(tt.recordTypeId==recordTypeID){
                      clientName.add(tt.Tax_Supervisor__c);
               clientName.add(tt.Bookkeeping_Admin__c);
                      clientName.add(tt.CSR__c);
              clientName.add(tt.Tax_Preparer__c);
                clientName.add(tt.Tax_Advisors_Admin__c);
              break;
            }

        }


        if(!clientName.isEmpty()){

            System.debug('Clientname is'+clientName);

            for(User usr : [Select id, name from user where name=:clientName AND ProfileId != :profileId]){
                userDetails.put(usr.name,usr.id);
            }
        }

        if(!userDetails.isEmpty()){
            System.debug('userdetails are'+userDetails);
              
            for(Task tt : newRecordsList){
               
                if(tt.Tax_Stage__c=='Waiting on Bookkeeping' && userDetails.containsKey(tt.Bookkeeping_Admin__c)){
                    tt.OwnerId=userDetails.get(tt.Bookkeeping_Admin__c);
                }
                else  if((tt.Tax_Stage__c=='Assigned' || tt.Tax_Stage__c=='In Progress'  || tt.Tax_Stage__c=='Review Notes' || tt.Tax_Stage__c=='Review Notes - Waiting on Client' ||  tt.Tax_Stage__c=='e-File Rejected' || tt.Tax_Stage__c=='Call Client to Review Return' ) && userDetails.containsKey(tt.Tax_Preparer__c)){
                    tt.OwnerId=userDetails.get(tt.Tax_Preparer__c);
                   
                }
                else  if((tt.Tax_Stage__c=='Review') || (tt.Tax_Stage__c=='Review Notes Cleared') && userDetails.containsKey(tt.Tax_Supervisor__c)){
                    
                    tt.OwnerId=userDetails.get(tt.Tax_Supervisor__c);
                }
                else  if( (tt.Tax_Stage__c=='Review Complete'||tt.Tax_Stage__c=='Review Complete- Paper File' ||tt.Tax_Stage__c=='Return Ready for Review - Paper Filing'  ||tt.Tax_Stage__c=='Paper File Sent to Client'|| tt.Tax_Stage__c=='Waiting on 8879 & Invoice' ||  tt.Tax_Stage__c=='Waiting on 8879 Only' || tt.Tax_Stage__c=='Waiting on Invoice Only' || tt.Tax_Stage__c=='Ready to File' || tt.Tax_Stage__c=='IRS Accepted' || tt.Tax_Stage__c=='Completed' )  && userDetails.containsKey(tt.Tax_Advisors_Admin__c)){
                    tt.OwnerId=userDetails.get(tt.Tax_Advisors_Admin__c);
                }
            }
        }
    }



      public void taskProcessingStage(List<Task> newRecordsList, List<Task> oldRecordsList, Map<Id, Task> newMap, Map<Id, Task> oldMap, String eventType, String triggerType){

        if (stopRun == true) return;
          stopRun = true;
          
        list<String> clientName=new list<String>();
        map<id,string> taskMap=new map<id,string>();
        map<string,id> userDetails=new map<string,id>();

        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Processing').getRecordTypeId();
        Id profileId = [Select Id From Profile Where Name='Partner Community User'].id; 
        Id AndersonAdvisors = [SELECT Id from User Where Name = 'Anderson Advisors'].id;  

        System.debug('recordTypeID is'+recordTypeID);

        for(Task tt : newRecordsList){

            System.debug('recordtype id is'+tt.recordTypeId);

            if(tt.recordTypeId==recordTypeID){
                 clientName.add(tt.Processors__c);
                
                 clientName.add(tt.CAM__c);
                 clientName.add(tt.CSR__c);
                 clientName.add(tt.Mail_Clerks__c);
                 break;
            }

        }



        if(!clientName.isEmpty()){

            System.debug('Clientname is'+clientName);

            for(User usr : [Select id, name from user where name=:clientName AND ProfileId != :profileId]){
                userDetails.put(usr.name,usr.id);
                System.debug('Name=='+usr.name);
                 System.debug('Name=='+usr.id);
            }
        }

        if(!userDetails.isEmpty()){
            System.debug('userdetails are'+userDetails);
            
            for(Task tt : newRecordsList){
                 System.debug('OwnerID=='+tt.OwnerId);
                          System.debug('Processors__c=='+tt.Processors__c);
                System.debug('Processors__c in user details=='+tt.Processors__c);
                        System.debug('Processing_Stage__c=='+tt.Processing_Stage__c);
                if( ( (tt.Processing_Stage__c=='Processor' ) || (tt.Processing_Stage__c=='Conversion Requested') || (tt.Processing_Stage__c=='Amendment Requested')||(tt.Processing_Stage__c=='IRS Complete, Waiting on SOS' ||tt.Processing_Stage__c=='Binder Shipped- Back to Processor' || tt.Processing_Stage__c=='SOS Complete, Waiting on IRS' || tt.Processing_Stage__c=='Waiting on SOS & IRS')  ) && userDetails.containsKey(tt.Processors__c)){
                         
                    tt.OwnerId=userDetails.get(tt.Processors__c);
                }
                
              
                
                else  if((tt.Processing_Stage__c=='Back to CSR' || tt.Processing_Stage__c=='Name Rejected' ) && userDetails.containsKey(tt.CSR__c)){
                    tt.OwnerId=userDetails.get(tt.CSR__c);
                }
                else  if(tt.Processing_Stage__c=='Supervisor Review' && userDetails.containsKey(tt.Processor_Reviewer__c)){
                    tt.OwnerId=userDetails.get(tt.Processor_Reviewer__c);
                }
                else  if( ( tt.Processing_Stage__c=='Ready to Ship' || tt.Processing_Stage__c=='Ready to Ship, Bank info Needed' || tt.Processing_Stage__c=='Ready to Ship, Waiting on SOS/IRS' || tt.Processing_Stage__c=='Ready to Submit to IRS' )&& userDetails.containsKey(tt.Mail_Clerks__c)){
                    tt.OwnerId=userDetails.get(tt.Mail_Clerks__c);
                }    
           
                else if( tt.Processing_Stage__c=='Back to Processor') {
                    
                    if( string.isEmpty(tt.Processors__c) ) {
                        tt.OwnerId = AndersonAdvisors;
                    }
                    
                    if ( string.isEmpty(tt.Processors__c)  ) {
                        tt.OwnerId = AndersonAdvisors;
                    }
                    
                    if ( !string.isEmpty(tt.Processors__c) && userDetails.containsKey(tt.Processors__c)) {
                        tt.OwnerId = userDetails.get(tt.Processors__c);
                        
                        System.debug('OwnerID=='+tt.OwnerId);
                          System.debug('Processors__c=='+tt.Processors__c);
                        System.debug('Processing_Stage__c=='+tt.Processing_Stage__c);
                    }
                    
                     if ( !string.isEmpty(tt.Processors__c) && userDetails.containsKey(tt.Processors__c)) {
                        tt.OwnerId = userDetails.get(tt.Processors__c);
                    }
                }
                 
                else if (tt.Processing_Stage__c=='Review/Update Structure' && userDetails.containsKey(tt.CAM__c)) {
              tt.OwnerId=userDetails.get(tt.CAM__c);
                    }   
            }
        }
    }

     public void taskBookkeepingStages(List<Task> newRecordsList, List<Task> oldRecordsList, Map<Id, Task> newMap, Map<Id, Task> oldMap, String eventType, String triggerType){

          if (firstRun == false) return;
          firstRun = false;

        list<String> clientName=new list<String>();
        map<id,string> taskMap=new map<id,string>();
        map<string,id> userDetails=new map<string,id>();

        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Bookkeeping Task').getRecordTypeId();
        Id profileId = [Select Id From Profile Where Name='Partner Community User'].id; 

        System.debug('recordTypeID is'+recordTypeID);

        for(Task tt : newRecordsList){

            System.debug('recordtype id is'+tt.recordTypeId);

            if(tt.recordTypeId==recordTypeID){
                  clientName.add(tt.Bookkeeping_Admin__c);
               clientName.add(tt.Bookkeeping_Reviewer__c);
                 break;
            }

        }

        if(!clientName.isEmpty()){

            System.debug('Clientname is'+clientName);

            for(User usr : [Select id, name from user where name=:clientName AND ProfileId != :profileId]){
                userDetails.put(usr.name,usr.id);
            }
        }

        if(!userDetails.isEmpty()){
            System.debug('userdetails are'+userDetails);
            for(Task tt : newRecordsList){
                if( ( (tt.Bookkeeping_Stages__c=='Not Started' ) || (tt.Bookkeeping_Stages__c=='Supporting Documents Received')  || (tt.Bookkeeping_Stages__c=='In Progress') || (tt.Bookkeeping_Stages__c=='Waiting on Client')  || (tt.Bookkeeping_Stages__c=='Review Notes') ||  (tt.Bookkeeping_Stages__c=='Send Financials') || (tt.Bookkeeping_Stages__c=='Completed') ) && userDetails.containsKey(tt.Bookkeeping_Admin__c)){
                    tt.OwnerId=userDetails.get(tt.Bookkeeping_Admin__c);
                }
                else  if((tt.Bookkeeping_Stages__c=='Review') && userDetails.containsKey(tt.Bookkeeping_Reviewer__c)){
                    tt.OwnerId=userDetails.get(tt.Bookkeeping_Reviewer__c);
                }
            }
        }
    }


    public void taskAndersonStage(List<Task> newRecordsList, List<Task> oldRecordsList, Map<Id, Task> newMap, Map<Id, Task> oldMap, String eventType, String triggerType){

         if (runOnce == false) return;
          runOnce = false;
 
        list<String> clientName=new list<String>();
        map<id,string> taskMap=new map<id,string>();
        map<string,id> userDetails=new map<string,id>();

        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Anderson System').getRecordTypeId();
        Id profileId = [Select Id From Profile Where Name='Partner Community User'].id; 

        System.debug('recordTypeID is'+recordTypeID);

        for(Task tt : newRecordsList){

            System.debug('recordtype id is'+tt.recordTypeId);

            if(tt.recordTypeId==recordTypeID){
                 clientName.add(tt.Tax_Advisors_Admin__c);
                 clientName.add(tt.Tax_Preparer__c);
                 clientName.add(tt.CSR__c);
                 break;
            }

        }

        if(!clientName.isEmpty()){

            System.debug('Clientname is'+clientName);

            for(User usr : [Select id, name from user where name=:clientName AND ProfileId != :profileId]){
                userDetails.put(usr.name,usr.id);
            }
        }

        if(!userDetails.isEmpty()){
            System.debug('userdetails are'+userDetails);
            for(Task tt : newRecordsList){
                if( ( (tt.Anderson_System_Stage__c=='Not Started' ) || (tt.Anderson_System_Stage__c=='Client Introduction Walkthrough')  || (tt.Anderson_System_Stage__c=='Platinum and or Tax Package Walkthrough') || (tt.Anderson_System_Stage__c=='Services Checklist Walkthrough - Schedule Binder Reviews if Needed')  || (tt.Anderson_System_Stage__c=='BCP - Binder Review If Needed') ||  (tt.Anderson_System_Stage__c=='Schedule KMS Call') || (tt.Anderson_System_Stage__c=='KMS - Waiting on Tax Returns') || (tt.Anderson_System_Stage__c=='KMS - Follow Up by CSR') || (tt.Anderson_System_Stage__c=='BCP - Platinum / Tax Package Call') || (tt.Anderson_System_Stage__c=='BCP - Reminder Call for Deadlines') || (tt.Anderson_System_Stage__c=='Tax Returns Call') || (tt.Anderson_System_Stage__c=='RRF - Update Strategy Questionnaire for Changes') || (tt.Anderson_System_Stage__c=='ASA - Schedule Qualified People to do a Retirement Planning Review')  || (tt.Anderson_System_Stage__c=='WPB - Schedule with Advisor to Review Blueprint and Needs')) && userDetails.containsKey(tt.CSR__c)){
                    tt.OwnerId=userDetails.get(tt.CSR__c);
                }
                else  if((tt.Anderson_System_Stage__c=='BCP - Binder Review Completed' || tt.Anderson_System_Stage__c=='KMS - Scheduled Tax Review' || tt.Anderson_System_Stage__c=='KMS - Review Call Complete' ) && userDetails.containsKey(tt.Tax_Preparer__c)){
                    tt.OwnerId=userDetails.get(tt.Tax_Preparer__c);
                }
                else  if(tt.Anderson_System_Stage__c=='KMS - Delieverable Sent' && userDetails.containsKey(tt.Tax_Advisors_Admin__c)){
                    tt.OwnerId=userDetails.get(tt.Tax_Advisors_Admin__c);
                }

            }
        }
    }

}