public with sharing class taskTriggerHandler {
	public taskTriggerHandler() {
	}

    public void taskReassignment(List<Task> newRecordsList, List<Task> oldRecordsList, Map<Id, Task> newMap, Map<Id, Task> oldMap, String eventType, String triggerType){

         list<String> clientName=new list<String>();
        map<id,string> taskMap=new map<id,string>();
        map<string,id> userDetails=new map<string,id>();

        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Tax').getRecordTypeId();

        System.debug('recordTypeID is'+recordTypeID);

        for(Task tt : newRecordsList){

            System.debug('recordtype id is'+tt.recordTypeId);

            if(tt.recordTypeId==recordTypeID){
                      clientName.add(tt.Tax_Supervisor__c);
            	 clientName.add(tt.Bookkeeping_Admin__c);
                      clientName.add(tt.CSR__c);
           	 clientName.add(tt.Tax_Preparer__c);
           	 break;
            }

        }


        if(!clientName.isEmpty()){

            System.debug('Clientname is'+clientName);

            for(User usr : [Select id, name from user where name=:clientName]){
                userDetails.put(usr.name,usr.id);
            }
        }

        if(!userDetails.isEmpty()){
            System.debug('userdetails are'+userDetails);
            for(Task tt : newRecordsList){
                if(tt.Tax_Stage__c=='Waiting on Bookkeeping' && userDetails.containsKey(tt.Bookkeeping_Admin__c)){
                    tt.OwnerId=userDetails.get(tt.Bookkeeping_Admin__c);
                }
                else  if((tt.Tax_Stage__c=='Assigned' || tt.Tax_Stage__c=='In Progress'  || tt.Tax_Stage__c=='Review Notes' || tt.Tax_Stage__c=='Review Notes - Waiting on Client' || tt.Tax_Stage__c=='Ready to File') && userDetails.containsKey(tt.Tax_Preparer__c)){
                    tt.OwnerId=userDetails.get(tt.Tax_Preparer__c);
                }
                else  if((tt.Tax_Stage__c=='Review' || tt.Tax_Stage__c=='Call Client to Review Return'  ) && userDetails.containsKey(tt.Tax_Supervisor__c)){
                    tt.OwnerId=userDetails.get(tt.Tax_Supervisor__c);
                }
                else  if( (tt.Tax_Stage__c=='Review Complete' || tt.Tax_Stage__c=='Waiting on 8879 & Invoice' ||  tt.Tax_Stage__c=='Waiting on 8879 Only' || tt.Tax_Stage__c=='Waiting on Invoice Only' )  && userDetails.containsKey(tt.CSR__c)){
                    tt.OwnerId=userDetails.get(tt.CSR__c);
                }
            }
        }
    }



      public void taskProcessingStage(List<Task> newRecordsList, List<Task> oldRecordsList, Map<Id, Task> newMap, Map<Id, Task> oldMap, String eventType, String triggerType){

        list<String> clientName=new list<String>();
        map<id,string> taskMap=new map<id,string>();
        map<string,id> userDetails=new map<string,id>();

      	Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Processing').getRecordTypeId();

        System.debug('recordTypeID is'+recordTypeID);

        for(Task tt : newRecordsList){

            System.debug('recordtype id is'+tt.recordTypeId);

            if(tt.recordTypeId==recordTypeID){
                 clientName.add(tt.Processors__c);
                 clientName.add(tt.Processor_Reviewer__c);
                 clientName.add(tt.CSR__c);
                 clientName.add(tt.Mail_Clerks__c);
                 break;
            }

        }



        if(!clientName.isEmpty()){

            System.debug('Clientname is'+clientName);

            for(User usr : [Select id, name from user where name=:clientName]){
                userDetails.put(usr.name,usr.id);
            }
        }

        if(!userDetails.isEmpty()){
            System.debug('userdetails are'+userDetails);
            for(Task tt : newRecordsList){
                if( ( (tt.Processing_Stage__c=='Processor' ) || (tt.Processing_Stage__c=='Conversion Requested')  || (tt.Processing_Stage__c=='Amendment Requested') || (tt.Processing_Stage__c=='IRS Complete, Waiting on SOS')  || (tt.Processing_Stage__c=='Back to Processor') ||  (tt.Processing_Stage__c=='SOS Complete, Waiting on IRS') || (tt.Processing_Stage__c=='Waiting on SOS & IRS') ) && userDetails.containsKey(tt.Processors__c)){
                    tt.OwnerId=userDetails.get(tt.Processors__c);
                }
                else  if((tt.Processing_Stage__c=='Waiting on Client' || tt.Processing_Stage__c=='Name Rejected' ) && userDetails.containsKey(tt.CSR__c)){
                    tt.OwnerId=userDetails.get(tt.CSR__c);
                }
                else  if(tt.Processing_Stage__c=='Supervisor Review' && userDetails.containsKey(tt.Processor_Reviewer__c)){
                    tt.OwnerId=userDetails.get(tt.Processor_Reviewer__c);
                }
                else  if( ( tt.Processing_Stage__c=='Ready to Ship' || tt.Processing_Stage__c=='Ready to Ship, Bank info Needed' || tt.Processing_Stage__c=='Ready to Ship, Waiting on SOS/IRS' )&& userDetails.containsKey(tt.Mail_Clerks__c)){
                    tt.OwnerId=userDetails.get(tt.Mail_Clerks__c);
                }

            }
        }
    }

     public void taskBookkeepingStages(List<Task> newRecordsList, List<Task> oldRecordsList, Map<Id, Task> newMap, Map<Id, Task> oldMap, String eventType, String triggerType){

        list<String> clientName=new list<String>();
        map<id,string> taskMap=new map<id,string>();
        map<string,id> userDetails=new map<string,id>();

        Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Bookkeeping Task').getRecordTypeId();

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

            for(User usr : [Select id, name from user where name=:clientName]){
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

        list<String> clientName=new list<String>();
        map<id,string> taskMap=new map<id,string>();
        map<string,id> userDetails=new map<string,id>();

      	Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Anderson System').getRecordTypeId();

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

            for(User usr : [Select id, name from user where name=:clientName]){
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