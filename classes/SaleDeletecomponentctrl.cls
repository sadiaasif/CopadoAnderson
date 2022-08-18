public class SaleDeletecomponentctrl {
    @AuraEnabled
    public static   Map<String, String> getContenDocumentTitle(Id oppId) {
              
     Map<String, String> TitleNameoptions = new Map<String, String>();
     
        List<id> contentdocmentIDList=new List<id>();
        
       
        for(ContentDocumentLink cdl:[SELECT ContentDocumentId,ContentDocument.title FROM ContentDocumentLink WHERE LinkedEntityId =:oppId ]){
            contentdocmentIDList.add(cdl.ContentDocumentId );
        }
        if(contentdocmentIDList.size()>0){
        for(ContentDocument cd: [Select id,title from ContentDocument where id In:contentdocmentIDList ]){
            System.debug('title=='+cd.Title);
            TitleNameoptions.put(cd.title,cd.title);
        }
        }else{
            for(Attachment att:[Select id,name from Attachment where parentId=:oppId]){
                TitleNameoptions.put(att.name,att.name);
            }
        }
     
        return TitleNameoptions;
    }
    @AuraEnabled
    public static boolean updatedAttachmentNameOnSale( Id oppId,String AttachmentName) {
        List<opportunity> updateopp=new List<opportunity>();
        for (opportunity opp: [Select id,Attachment_Name__c,Delete_the_Sale_Attachment__c from opportunity where id=:oppId]){
            opp.Attachment_Name__c=AttachmentName;
            opp.Delete_the_Sale_Attachment__c=True;
            updateopp.add(opp);
        }
         try{
            update updateopp;
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
       
       
        
    }
    
}