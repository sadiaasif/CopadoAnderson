public class FormAssemblyHandler {
    
    @InvocableMethod
    public static void createSecureQueryParameter(List<Id> OppId) {
       
        List<Opportunity> updateList = new List<Opportunity>();
        
      	 for (opportunity o : [SELECT Id, DocuSign_Payment_Form__c FROM Opportunity WHERE Id IN :OppId]) {

            String data = 'sid'+o.Id; // strip '&' and '=' from string.
            Blob mac = Crypto.generateMac('HMacSHA256', Blob.valueOf(data), Blob.valueOf('65d0a096ceca0e83f35941d7ac56b353'));
            String sig = EncodingUtil.urlEncode(EncodingUtil.base64Encode(mac), 'UTF-8');
            
             o.DocuSign_Payment_Form__c  = 'https://www.andersonadvisors.com/docusign-payment/?sid='+o.Id+'&signature='+sig;
            updateList.add(o); 
        }
        
        update updateList;
        
    }
    
}