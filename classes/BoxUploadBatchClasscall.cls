global class BoxUploadBatchClasscall implements Schedulable {
    global void execute(SchedulableContext sc) {
     
        string taskQuery='';
        if(!Test.isRunningTest()){
            taskQuery='select id, File_Id__c, Uploaded_File_Name__c, File_Created_Date_and_time__c, File_Modified_Date_and_time__c,Base_Folder_Name__c,File_Created_By__c,File_Created_By_Email_Address__c,Folder_Name__c,Parent_Folder_ID__c,Login_User_name__c,Login_User_Email__c from Box_Listener__c where CreatedDate=Today and Processed__c=false '; 
        }else{
            taskQuery='select id, File_Id__c, Uploaded_File_Name__c, File_Created_Date_and_time__c, File_Modified_Date_and_time__c,Base_Folder_Name__c,File_Created_By__c,File_Created_By_Email_Address__c,Folder_Name__c,Parent_Folder_ID__c,Login_User_name__c,Login_User_Email__c from Box_Listener__c where CreatedDate=Today and Processed__c=false limit 1';
        }
        
         
         Id batchJobId1;
          if(!Test.isRunningTest()){
          batchJobId1 = Database.executeBatch(new BoxUploadBatchClasscallCreatecase(taskQuery), 5);
         }else{
             batchJobId1 = Database.executeBatch(new BoxUploadBatchClasscallCreatecase(taskQuery), 200);
         }
      
    }
}