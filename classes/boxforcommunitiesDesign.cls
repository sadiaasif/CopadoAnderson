public  class  boxforcommunitiesDesign {
   public static String FolderID{ get; set; }
     public static String recordId { get; set; }
     public static id record18digitId { get; set; }
         public static String url { get; set; }
          public static String newurl { get; set; }
      public static String Createdurl { get; set; }
      public static String createdrecordID { get; set; }
    public static boolean createfolderinbox { get; set; }
    public static boolean createdfolderbutton { get; set; }{createfolderinbox=false;}
     public static Boolean disable {get;set;}
    public static PageReference  doinit(){
         disable=true;
       
       recordId=   ApexPages.currentPage().getParameters().get('id');
        record18digitId=recordId;
        system.debug('Record id=='+record18digitId);
        box.Toolkit toolkit = new box.Toolkit();
        
       FolderID=toolkit.getFolderIdByRecordId(record18digitId); 
                  if(FolderID!=null && FolderID!=''){
                 Id userId = UserInfo.getUserId();
box.Toolkit.CollaborationType collabType = box.Toolkit.CollaborationType.EDITOR;
String collabId = toolkit.createCollaborationOnRecord(userId, record18digitId, collabType, false);
system.debug('new collaboration id: ' + collabId);
            toolkit.commitChanges();
          url='https://andersonadvisors.app.box.com/embed_widget/files/0/f/'+FolderID+'?inline=1&partner_id=219&promoted_app_ids=840%2C1476'; 
            }else{
                 List<box__FRUP__c> boxFolders = [Select id, box__Folder_ID__c, box__Record_ID__c, box__Box_user__c,Createdby.Name from box__FRUP__c where box__Record_ID__c=:record18digitId ];
        if(boxFolders.size()>0){
        	 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'The Client has more than one box account.Please Check!'));
             
        }else{
                createfolderinbox=true;
            disable=false;
	//createAttachmentinBox(recordId);
            
        }
            }

     
          system.debug('FolderID id=='+FolderID);
      return null;
    }
    public static void  getthecreatedfolder(){
       
  
        system.debug('Record id=='+createdrecordID);
        box.Toolkit toolkit = new box.Toolkit();
       
       FolderID=toolkit.getFolderIdByRecordId(createdrecordID); 
                  if(FolderID!=null && FolderID!=''){
                 Id userId = UserInfo.getUserId();
box.Toolkit.CollaborationType collabType = box.Toolkit.CollaborationType.EDITOR;
String collabId = toolkit.createCollaborationOnRecord(userId, createdrecordID, collabType, false);
system.debug('new collaboration id: ' + collabId);
            toolkit.commitChanges();
          newurl='https://andersonadvisors.app.box.com/embed_widget/files/0/f/'+FolderID+'?inline=1&partner_id=219&promoted_app_ids=840%2C1476'; 
            }else{
                 List<box__FRUP__c> boxFolders = [Select id, box__Folder_ID__c, box__Record_ID__c, box__Box_user__c,Createdby.Name from box__FRUP__c where box__Record_ID__c=:createdrecordID ];
        if(boxFolders.size()>0){
        	 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'The Client has more than one box account.Please Check!'));
        }
            }

     
          system.debug('FolderID id=='+FolderID);
      
    }
 
    public static void createAttachmentinBox(){
          disable = true;
         createfolderinbox=true;
        string createdFolderID='';
         box.Toolkit toolkit = new box.Toolkit();
         FolderID=toolkit.getFolderIdByRecordId(createdrecordID);
          system.debug('Record id=='+createdrecordID);
        String accountFolderId = toolkit.createFolderForRecordId(createdrecordID, null, true);
    system.debug('new item folder id: ' + accountFolderId);

// If there was an error, accountFolderId will be null. mostRecentError will contain the error message
    if(accountFolderId == null) {
    system.debug('most recent error: ' + toolkit.mostRecentError);
    }
    Id userId = UserInfo.getUserId();
    box.Toolkit.CollaborationType collabType = box.Toolkit.CollaborationType.EDITOR;
    String collabId = toolkit.createCollaborationOnRecord(userId, createdrecordID, collabType, false);
    system.debug('new collaboration id: ' + collabId);
// ALWAYS call this method when finished.Since salesforce doesn't allow http callouts after dml operations, we need to commit the pending database inserts/updates or we will lose the associations created
    toolkit.commitChanges();
   
    boxforcommunitiesDesign.getthecreatedfolder(); 
     
       
    }
        
    }