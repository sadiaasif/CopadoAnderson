@RestResource(urlMapping='/BoxTriggerRestAPi/*')
global with sharing class BoxTriggerRest {
    @HttpPost
    global static void  postItems () {
        String AccountID='';
        Boolean createTask=true;
       RestRequest  req = RestContext.request;
        RestResponse res = RestContext.response;
        String FolderName='';
         String BaseFolderName='';
        String FolderID='';
         String jsonPayload='';
       
         Map<String, Object> o = new Map<String, Object>();
          Map<String, Object> LoginUserdetails = new Map<String, Object>();
           Map<String, Object> source = new Map<String, Object>();
        Map<String, Object> path = new Map<String, Object>();
          List<Object> Folderentries = new List<Object>();
          Map<String, Object> CreatedUser =new Map<String, Object>();
         String NameoftheuserLogin='';
        string emailoftheuserLogin='';
        String nameoftheuserCreated='';
        String emailoftheusercreated='';
        
       
       If(!test.isRunningTest()){
             jsonPayload = RestContext.request.requestBody.toString();
            
          
           
     } else{
         jsonPayload='{"type":"webhook_event","id":"f3f586ea-a5b2-40da-93d4-69746b97fcf0","created_at":"2021-02-23T18:03:51-08:00","trigger":"FILE.UPLOADED","webhook":{"id":"445723342","type":"webhook"},"created_by":{"type":"user","id":"15007422749","name":"Matthew Bassuener","login":"matthew.bassuener@gmail.com"},"source":{"id":"779794570214","type":"file","file_version":{"type":"file_version","id":"832847694614","sha1":"2ca01f58c93cc19a3a2bd98a41dd64e2b1190061"},"sequence_id":"0","etag":"0","sha1":"2ca01f58c93cc19a3a2bd98a41dd64e2b1190061","name":"Completed_ 2020 Tax Organizer for Corporate Returns &1120s Return.pdf","description":"","size":913041,"path_collection":{"total_count":7,"entries":[{"type":"folder","id":"0","sequence_id":null,"etag":null,"name":"All Files"},{"type":"folder","id":"2829937515","sequence_id":"3","etag":"3","name":"Anderson"},{"type":"folder","id":"2830051199","sequence_id":"4","etag":"4","name":"Clients"},{"type":"folder","id":"129562503720","sequence_id":"0","etag":"0","name":"Bassuener, Matthew"},{"type":"folder","id":"129761612226","sequence_id":"0","etag":"0","name":"Viewable-ClientDocs"},{"type":"folder","id":"129761034077","sequence_id":"0","etag":"0","name":"Tax"},{"type":"folder","id":"130050791827","sequence_id":"0","etag":"0","name":"TAX: Bobateca, Inc"}]},"created_at":"2021-02-23T18:03:51-08:00","modified_at":"2021-02-23T18:03:51-08:00","trashed_at":null,"purged_at":null,"content_created_at":"2021-02-23T18:00:25-08:00","content_modified_at":"2021-02-23T18:00:25-08:00","created_by":{"type":"user","id":"15007422749","name":"Matthew Bassuener","login":"matthew.bassuener@gmail.com"},"modified_by":{"type":"user","id":"15007422749","name":"Matthew Bassuener","login":"matthew.bassuener@gmail.com"},"owned_by":{"type":"user","id":"229304299","name":"BoxforSalesforce","login":"boxforsalesforce@andersonadvisors.com"},"shared_link":null,"parent":{"type":"folder","id":"130050791827","sequence_id":"0","etag":"0","name":"TAX: Bobateca, Inc"},"item_status":"active"},"additional_info":[]}';
 
     
          
         
     }
      
        o = (Map<String, Object>) JSON.deserializeUntyped(jsonPayload);
          LoginUserdetails = (Map<String, Object>) o.get('created_by');
           source = (Map<String, Object>) o.get('source');
            path = (Map<String, Object>) source.get('path_collection');
            Folderentries = (List<Object>) path.get('entries');
      System.debug('JSON.deserializeUntyped(jsonPayload)=='+JSON.deserializeUntyped(jsonPayload));

      System.debug('jsonPayload=='+jsonPayload);
            CreatedUser = (Map<String, Object>) source.get('created_by');
       
        Integer i=0;
     for (Object folder : Folderentries) {
           i=i+1;
             Map<String, Object> FolderDetails = (Map<String, Object>)folder;
            for (String attributeName : FolderDetails.keyset()) {
              
                if(i==4){
                FolderID=   String.valueof(FolderDetails.get('id')); 
                }
         // handle response
         System.debug('========> ' + attributeName + ' = ' +  
             FolderDetails.get(attributeName));
                If(String.valueof(FolderDetails.get('name'))=='Bookkeeping'){
                    BaseFolderName=String.valueof(FolderDetails.get('name'));
                }else if(String.valueof(FolderDetails.get('name'))=='Receipts'){
                     BaseFolderName=String.valueof(FolderDetails.get('name'));
                }else if(String.valueof(FolderDetails.get('name'))=='Tax'){
                     BaseFolderName=String.valueof(FolderDetails.get('name'));
                }else if(String.valueof(FolderDetails.get('name'))=='1-Structure'){
                    BaseFolderName=String.valueof(FolderDetails.get('name'));
                }else if(String.valueof(FolderDetails.get('name'))=='Mail'){
                    BaseFolderName=String.valueof(FolderDetails.get('name'));
                }else if(String.valueof(FolderDetails.get('name'))=='Law'){
                    BaseFolderName=String.valueof(FolderDetails.get('name'));
                }
               FolderName=  String.valueof(FolderDetails.get('name'));
          
     }
        }
       
        system.debug('type--'+o.get('id'));
        String fileID=String.valueof(o.get('id'));
       String fileName= String.valueof(source.get('name'));
        
       NameoftheuserLogin=String.valueof(LoginUserdetails.get('name'));
         emailoftheuserLogin=String.valueof(LoginUserdetails.get('login'));
        
         nameoftheuserCreated=String.valueof(CreatedUser.get('name'));
         emailoftheusercreated=String.valueof(CreatedUser.get('login'));

       
        String filecreatedDatetime=String.valueof(source.get('created_at'));
         String fileModifiedDatetime=String.valueof(source.get('modified_at'));
        System.debug('[ Post req --> ]' + JSON.serializePretty( jsonPayload ) ) ; 

        Map<String, String> autoResponse =  req.params;
      
        
        
        res.statusCode = 200;
   
     System.debug('NameoftheuserLogin==='+NameoftheuserLogin);
        System.debug('emailoftheuserLogin==='+emailoftheuserLogin);
System.debug('Entry 1--'+ fileID);
// AccountID =[Select id, box__Folder_ID__c, box__Record_ID__c, box__Box_user__c, Createdby.Name from box__FRUP__c where box__Folder_ID__c=:FolderID Limit 1]?.box__Record_ID__c;
        
            
            // Get the list of Box_Rest__c that match the account_name sent in the request.
  if(!emailoftheuserLogin.contains('@andersonadvisors.com') ){
      List<Box_Listener__c> boxList=[Select id,Parent_Folder_ID__c,Folder_Name__c from Box_Listener__c where Parent_Folder_ID__c=:FolderID and Folder_Name__c=:FolderName ];
      If(boxList.size()>0){
         createTask=false;
      }else{
          createTask=true; 
      }
             Box_Listener__c boxl = new Box_Listener__c (File_Id__c = fileID, Uploaded_File_Name__c=fileName,File_Created_Date_and_time__c=filecreatedDatetime,File_Modified_Date_and_time__c=fileModifiedDatetime,File_Created_By__c=nameoftheuserCreated,File_Created_By_Email_Address__c=emailoftheusercreated,Folder_Name__c=FolderName,Parent_Folder_ID__c=FolderID,Login_User_name__c=NameoftheuserLogin,Login_User_Email__c=emailoftheuserLogin,Base_Folder_Name__c=BaseFolderName);
    
      boxl.Create_case_and_Task__c=createTask;
            insert boxl;
     
      
 
       }
            
    }
}