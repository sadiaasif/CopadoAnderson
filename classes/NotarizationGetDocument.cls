public class NotarizationGetDocument {
    
   @InvocableMethod( label='Create get Document and Upload'  category='Callout' )
  public static void makePostCallouttogetDocument(List<String> TransactionId){
  
      Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.notarize.com/transactions/'+TransactionId[0]);
        request.setMethod('GET');
 	request.setHeader('ApiKey', 'EfVgPVWQPBvmFseUWGLfo1kJ');
      HttpResponse response = http.send(request);
 if (response.getStatusCode() == 200) {
        List<Object> Documents = new List<Object>();

       
        // Parse the JSON response
       Map<string,string> NotarizeAttachmentMap=new Map<string,string>();
       List<wrapnotarize> wrapList=new List<wrapnotarize>();
            System.debug(response.getBody());
     Map<String,string> notartizedetailsmap=new Map<string,string>();
        String responseBody = response.getBody();
        String Documenturl='';
     String DocumentName='';
     String DocumentNameandURl='';
      List<Attachment> DocAttachments= New List<Attachment>();
      List<String> Documenturls=new List<String>();
       Map<String, Object> signerInfo = new Map<String, Object>();
        Map<String, Object> TrasactionDocumentResponse = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
         Documents=(List<Object>)TrasactionDocumentResponse.get('documents');
    // TransactionName=String.valueof(TrasactionDocumentResponse.get('transaction_name'));
      signerInfo=(Map<String, Object>)TrasactionDocumentResponse.get('signer_info');
        String Emailofthesigner=String.valueof(signerInfo.get('email'));
       String Firstnameofthesigner=String.valueof(signerInfo.get('first_name'));
       String LastNameofthesigner=String.valueof(signerInfo.get('last_name'));
      notartizedetailsmap.put('SignorEmail',Emailofthesigner);
       notartizedetailsmap.put('SignorFirstName',Firstnameofthesigner);
      notartizedetailsmap.put('SignorLastName',LastNameofthesigner);
      Id ParentId=[Select id from Notarization__c where Transaction_ID__c=:TransactionId[0] and Transaction_Status__c='completed']?.id;
    list <String> DocumentNames=new List<String>();
    
      List<Notarization__c> nList=new List<Notarization__c>();
     System.debug('DocSize--'+Documents.size());
     for(Object Documnet:Documents){
              Map<String, Object> DocumnetDetails = (Map<String, Object>)Documnet;
         DocumentNameandURl='';
         for (String attributeName : DocumnetDetails.keyset()) {
             
           
             if(attributeName=='document_name'){
                  DocumentNameandURl+=String.valueof(DocumnetDetails.get('document_name'))+' ;DocmentURL --';
                
                 System.debug('DocumentName--'+DocumentNameandURl);
             }
            if(attributeName=='final_document_url'){
                DocumentNameandURl+=   String.valueof(DocumnetDetails.get('final_document_url'));
              
              
            }
         System.debug('Documenturl---'+DocumentNameandURl);
        
       

         
             
         }
System.debug('DocumentNameandURl.substringBefore==='+DocumentNameandURl.substringBefore(';DocmentURL --'));      
         System.debug('DocumentNameandURl.substringAfter==='+DocumentNameandURl.substringAfter(';DocmentURL --'));     
         NotarizeAttachmentMap.put(DocumentNameandURl.substringBefore(';DocmentURL --'),DocumentNameandURl.substringAfter(';DocmentURL --'));
        for(String doc :NotarizeAttachmentMap.keyset()){
        System.debug('doc--'+doc);
              blob notarizedDoc= NotarizeFileDownloadFileandAttach.DownloadDocument(NotarizeAttachmentMap.get(doc));
                 wrapnotarize wc=new wrapnotarize(ParentId,notarizedDoc,doc);
             wrapList.add(wc);
         }
          
       
      }
     System.debug('Map Size--'+NotarizeAttachmentMap.size()); 
     
                  
      
      NotarizeFileDownloadFileandAttach.updatetheNotarizeRecord(Emailofthesigner,Firstnameofthesigner,LastNameofthesigner,TransactionId[0]);  
      
           NotarizeFileDownloadFileandAttach.AttachtheNotarizeRecord(wrapList);
 } 
 
}
     public class wrapnotarize {
        public string ParentID {get; set;}
        public blob NotarizeDoc {get; set;}
        public string Docname {get; set;}
        
        
        public  wrapnotarize(string ParID,blob Nd,String dn) {
            ParentID = ParID;
            NotarizeDoc = Nd;
            Docname=dn;
        }
    }
}