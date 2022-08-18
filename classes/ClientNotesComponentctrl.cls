public class ClientNotesComponentctrl {
 @AuraEnabled
    public static List<Note__c> getstructureNotes(Id accId) {
   
        return [Select id,Name,Notes__c,Notes_Type__c,CreatedBy.name,CreatedDate,LastModifiedDate from Note__c where Client__c=:accId and (Notes_Type__c='Advisor' or Notes_Type__c='Structure' )];
    }
     @AuraEnabled
    public static List<Note__c> getTaxNotes(Id accId) {
   
        return [Select id,Name,Notes__c,Notes_Type__c,CreatedBy.name,CreatedDate,LastModifiedDate from Note__c where Client__c=:accId and (Notes_Type__c='Tax' or Notes_Type__c='Tax Consult'  or Notes_Type__c='Keep more solution'  ) ];
    }
     @AuraEnabled
     public static boolean updatedAllNotesRecords( List < Note__c > updatedNoteRecordList ) {    
            
        try {
            
           
           
            
            update updatedNoteRecordList;  
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
            
    } 
     @AuraEnabled
    public static boolean updatedNotesRecords( Id accId,String Notes,String noteType,Id userId ) {
           User CurrentUser=[Select Id,Name from User where id =:userId limit 1];
        Note__c note=new Note__c();
        note.Notes__c=Notes;
        note.Notes_Type__c=noteType;
        note.name= system.today().format()+' - '+CurrentUser.Name +' - '+noteType;
       note.Client__c=accId;
        try{
            insert note;    
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
        
       
    }
        @AuraEnabled
    public static Map<String, String> getNotesTypepicklist() {
          
     Map<String, String> NotesTypeoptions = new Map<String, String>();
       
        Schema.DescribeFieldResult NotesTypeValue = Note__c.Notes_Type__c.getDescribe();
       
        List<Schema.PicklistEntry> pList = NotesTypeValue.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
       
            NotesTypeoptions.put(p.getValue(), p.getLabel());
        }
        return NotesTypeoptions;
    }
  
}