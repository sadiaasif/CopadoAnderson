/** A Rest webservice class is used to make the payment.
* @author Sharukh khan
* @version 1.0 - apr 20, 2020
*/

@RestResource(urlmapping='/Charge/*')
global class ChargeAPI {
    
    @HttpGet
    global static String Charge()
    {
        RestResponse res=RestContext.response;
        RestRequest req=RestContext.request;
        String opportunityId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        system.debug('opportunityId:'+opportunityId);
        String accountingCoordinator = '';
        Map<String,string> tranMap=new Map<String,string>();
        Final String Tax_Compliance = 'Tax Compliance';
        Final String Task_Subject = 'Tax Payment Received';
        Final String Kambria = 'Kambria Stephen';
        Final String Approved = 'Approved';
        boolean trans_approved = False;
        String transactionId;
        String transactionStatus;
        String transactionMsg;
        Decimal transactionAmount;
        try
        {  
            Opportunity opp = [SELECT Id, RecordTypeId,RecordType.Name, Name, AccountId, Account.Name, Account.Accounting_Coordinators__c, Account.OwnerId FROM Opportunity where Id = :opportunityId Limit 1];
            system.debug('Lstopp'+Opp.AccountId);
            RecordType tskRecTyp = [SELECT Id, Name, Description, IsActive, SobjectType FROM RecordType where Name = 'Call' and SobjectType = 'Task' LIMIT 1];
            if(opp.Account.Accounting_Coordinators__c != null && opp.Account.Accounting_Coordinators__c != ''){
                accountingCoordinator = opp.Account.Accounting_Coordinators__c;
            }
            else {
                accountingCoordinator = Kambria;
            }
            
            ChargentSFA.TChargentOperations.TChargentResult result= ChargentSFA.TChargentOperations.ChargeOpportunity_click(opportunityId); 
            system.debug('=== Billing Result ===' + result);
            ChargentSFA__Transaction__c transLog = [Select Id,Name,ChargentSFA__Response_Status__c,ChargentSFA__Response_Message__c,ChargentSFA__Opportunity__c,ChargentSFA__Amount__c,Client__c  from ChargentSFA__Transaction__c where ChargentSFA__Opportunity__c = :opportunityId Order By CreatedDate Desc Limit 1];
            system.debug('=== transLog.size() ===' + transLog);
            if(transLog != Null) {         
                if(transLog.ChargentSFA__Response_Status__c == Approved){
                    trans_approved = True;
                }
                transactionId = transLog.Name;
                transactionStatus = transLog.ChargentSFA__Response_Status__c;
                transactionMsg = transLog.ChargentSFA__Response_Message__c;
                transactionAmount = transLog.ChargentSFA__Amount__c;
                                
                if((trans_approved && opp.RecordType.Name == Tax_Compliance) || Test.isRunningTest()){
                    Id usr = [Select Id,Name from User where Name = :accountingCoordinator].Id; 
                    system.debug('creating task == ');
                    Task tsk = new Task();
                    tsk.WhatId = opp.AccountId;
                    tsk.RecordTypeId = tskRecTyp.Id;
                    tsk.Subject = Task_Subject;
                    tsk.OwnerId = usr;
                    tsk.Date_Due__c = Date.today().addDays(1);
                    tsk.Status = 'open';
                    tsk.Priority = 'Normal';
                    try{
                    	insert tsk;
                    }
                    catch(DMLException e){
                        system.debug('The following exception has occurred: ' + e.getMessage());
                    }
                }
                
                tranMap.put('ID',transactionId);
                tranMap.put('Status',transactionStatus);
                tranMap.put('Amount',String.valueOf(transactionAmount));
                tranMap.put('Message',transactionMsg);
                system.debug('tranMap=='+tranMap);
                string jsonstring = JSON.serialize(tranMap);
                system.debug('jsonstring=='+jsonstring);
                return jsonstring;
            }  
            else {
                return null;
            }
            
        }
        catch(Exception e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            return null;
        }  
    }
    
}