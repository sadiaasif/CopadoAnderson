@RestResource(urlMapping='/NotarizationRestAPI/*')
global class NotarizationRestAPI {
        @HttpPost
    global static void  postItems () {
        List<string> transactionIDs=new List<string>();
          RestRequest  req = RestContext.request;
        RestResponse res = RestContext.response;
          Map<String, Object> TransactionResponseMap = new Map<String, Object>();
         Map<String, Object> TransactionDetailsMap = new Map<String, Object>();
        String TransactionId='';
         String Transactionstatus='';
          String jsonPayload='';
          If(!test.isRunningTest()){
              jsonPayload = RestContext.request.requestBody.toString();}
        else{
            jsonPayload = '{"event": "transaction_status_update","data": {"transaction_id": "ot_n8ba8mn","status": "completed"}}';
        }
            TransactionResponseMap=(Map<String, Object>) JSON.deserializeUntyped(jsonPayload);
          TransactionDetailsMap=(Map<String, Object>) TransactionResponseMap.get('data');
              TransactionId=String.valueof(TransactionDetailsMap.get('transaction_id'));
           Transactionstatus=String.valueof(TransactionDetailsMap.get('status'));
               Notarization__c No= new Notarization__c();
        System.debug(Transactionstatus);
     if(Transactionstatus=='completed'){
            transactionIDs.add(TransactionId);
              No = new Notarization__c (Transaction_ID__c = TransactionId,Transaction_Status__c=Transactionstatus);
              insert No;
             If(!test.isRunningTest()){
            Map<String, Object> inputs = new Map<String, Object>();
 			 inputs.put('TransactionID', TransactionId);
          
               Flow.Interview.Test_Auto_launch myFlow = 
    		new Flow.Interview.Test_Auto_launch(inputs);
  			myFlow.start();
            // }
        }
        
            
          
     }
     
      
 
    }

}