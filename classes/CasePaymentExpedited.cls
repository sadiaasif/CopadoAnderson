/** A Rest webservice class for Expedited payment.
* @author Sharukh khan
* @version 1.0 - may 8, 2020
*/

@RestResource(urlmapping='/ChargeExpedited/*')
global class CasePaymentExpedited {
    @HttpPost
    global static String ChargeExpedited(Id oppId, String subj, String descr,String usrAccId,String usrRecId)
    {
        try
        {    
            ChargentSFA.TChargentOperations.TChargentResult result= ChargentSFA.TChargentOperations.ChargeOpportunity_click(oppId);
            system.debug('=== Case Expedite Payment Result === ' + result);
            List<ChargentSFA__Transaction__c> transLog = [Select Id,Name,ChargentSFA__Response_Status__c,ChargentSFA__Response_Message__c,ChargentSFA__Opportunity__c,ChargentSFA__Amount__c from ChargentSFA__Transaction__c where ChargentSFA__Opportunity__c = :oppId Order By CreatedDate Desc Limit 1];
            if(transLog.size() > 0) {   
                String[] transactionId = New String[]{};
                    String[] transactionStatus = New String[]{};
                        String[] transactionMsg = New String[]{};
                            Decimal[] transactionAmount = New Decimal[]{};
                                system.debug('=== transLog ===' + transLog);          
                for(ChargentSFA__Transaction__c c: transLog){
                    transactionId.add(c.Name);
                    transactionStatus.add(c.ChargentSFA__Response_Status__c);
                    transactionMsg.add(c.ChargentSFA__Response_Message__c);
                    transactionAmount.add(c.ChargentSFA__Amount__c);
                }
                String transVal = transactionId +','+ transactionStatus +','+ transactionAmount+','+transactionMsg ;
                system.debug(' == transVal == ' + transVal ); 
                if(String.valueOf(transactionStatus) == '(Approved)') { 
                    Case cse = new Case();
                    cse.Subject = subj;
                    cse.Description = descr;
                    cse.AccountId = usrAccId;
                    cse.RecordTypeId = usrRecId;
                    cse.Origin = 'Partner Community';
                    cse.Priority = 'Expedited';
                    insert cse;
                } else {                              
                    system.debug('== Payment Error == ');
                }  
                return transVal;
            } else {                
                return null; 
            }
        }
        catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            return null;
        }            
    }
}