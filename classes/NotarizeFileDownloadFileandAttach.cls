public class NotarizeFileDownloadFileandAttach {
    public static blob DownloadDocument(String DocumentURl){
       
        Http h = new Http(); 
        HttpRequest req = new HttpRequest(); 
      
        DocumentURl = DocumentURl.replace(' ', '%20'); 
        //Set the end point URL
        req.setEndpoint(DocumentURl); 
        req.setMethod('GET'); 
        req.setHeader('Content-Type', 'application/pdf'); 
        req.setCompressed(true); 
        req.setTimeout(60000); 
        //Now Send HTTP Request
        HttpResponse res  = h.send(req); 
        system.debug('Response from Server: ' + res.getBody()); 
        //getBodyAsBlob method was will convert the response into Blob 
        blob retFile = res.getBodyAsBlob();
        return retFile;
    }

    public static void AttachtheNotarizeRecord(List<NotarizationGetDocument.wrapnotarize> wpList ){
    List<Attachment> DocAttachments= New List<Attachment>();
        for(NotarizationGetDocument.wrapnotarize wn:wpList){
             Attachment attach = new Attachment(); 
        attach.ParentId = wn.ParentID; 
        attach.Name = wn.Docname; 
        attach.Body =wn.NotarizeDoc;
            System.debug('wn.Docname--'+wn.Docname);
   DocAttachments.add(attach);
        }
     
  insert DocAttachments;
    }
    
     public static void updatetheNotarizeRecord(String Emailofthesigner,String Firstnameofthesigner,string LastNameofthesigner,String TransactionId){
       Id accountId=[Select AccountId from contact where Email=:Emailofthesigner limit 1 ]?.AccountId;
         List<Notarization__c> nList=new List<Notarization__c>();
         for(Notarization__c n:[Select id, SignorEmail__c,SignorFirstName__c,SignorLastName__c from Notarization__c where Transaction_ID__c=:TransactionId  and Transaction_Status__c='completed' ]){
          n.SignorEmail__c=Emailofthesigner;
          n.SignorFirstName__c=Firstnameofthesigner;
          n.SignorLastName__c=LastNameofthesigner;
          n.AccountId__c=accountId;
     nList.add(n);
    }
         update nList;
}
    
}