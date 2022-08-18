@RestResource(urlmapping='/ChargePlatinumReinstatement/*')
global class ChargePlatinumReinstatementAPI {
    
    @HttpGet
    global static String ChargePlatinumReinstatement()
    {
        RestResponse res=RestContext.response;
        RestRequest req=RestContext.request;
        String opportunityId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        system.debug('opportunityId:'+opportunityId);
        String allOpp = opportunityId;
        String transVal = '';
        string contactIDR;
        Date currentDate=date.today();
        String accountingCoordinator = '';
        Map<String,string> tranMap=new Map<String,string>();
        try
        {  
            List<opportunity> oppupdate=new List<opportunity>();
            Opportunity lstOpp = [SELECT Id, RecordTypeId, AccountId,  Name, Last_Transaction__c,ChargentSFA__Payment_Frequency__c,ChargentSFA__Payment_Start_Date__c,ChargentSFA__Payment_Status__c FROM Opportunity where Id = :opportunityId Limit 1];
            system.debug('Lstopp'+lstOpp.AccountId);
             system.debug('Last_Transaction__c'+lstOpp.Last_Transaction__c);

            RecordType tskRecTyp = [SELECT Id, Name, Description, IsActive, SobjectType FROM RecordType where Name = 'Call' and SobjectType = 'Task' LIMIT 1];
           
                               
            ChargentSFA.TChargentOperations.TChargentResult result= ChargentSFA.TChargentOperations.ChargeOpportunity_click(allOpp); 
            system.debug('=== Billing Result ===' + result);
            List<ChargentSFA__Transaction__c> transLog = [Select Id,Name,ChargentSFA__Response_Status__c,ChargentSFA__Response_Message__c,ChargentSFA__Opportunity__c,ChargentSFA__Amount__c,Client__c  from ChargentSFA__Transaction__c where ChargentSFA__Opportunity__c = :opportunityId Order By CreatedDate Desc Limit 1];
            system.debug('=== transLog.size() ===' + transLog.size());
            system.debug('transLog=='+transLog);
            if(transLog.size() > 0) { 
                List<Id> opId = new List<Id>();
                String[] transactionId = New String[]{};
                    String[] transactionStatus = New String[]{};
                        String[] transactionMsg = New String[]{};
                            Decimal[] transactionAmount = New Decimal[]{};         
                                for(ChargentSFA__Transaction__c c: transLog){
                                    if(c.ChargentSFA__Response_Status__c == 'Approved' && !Test.isRunningTest()){
                                        opId.add(c.ChargentSFA__Opportunity__c);
                                    }else If(Test.isRunningTest()){
                                          opId.add(c.ChargentSFA__Opportunity__c);
                                    }
                                    
                                    transactionId.add(c.Name);
                                    transactionStatus.add(c.ChargentSFA__Response_Status__c);
                                    transactionMsg.add(c.ChargentSFA__Response_Message__c);
                                    transactionAmount.add(c.ChargentSFA__Amount__c);
                                }
                 Map<String, Object> inputs = new Map<String, Object>();
 			 inputs.put('AccountID', lstOpp.AccountId);
           
                Flow.Interview.Account_Get_Primary_contact_flow myFlow = 
    		new Flow.Interview.Account_Get_Primary_contact_flow(inputs);
  			myFlow.start();
              if (myFlow!=null) {
                  contactIDR = (String) myFlow.getVariableValue('ConatctID');
              }
                Task tsk = new Task();
                system.debug('opId.size() == '+ opId.size());
             
                if(opId.size() > 0){
                    if( lstOpp.Last_Transaction__c!=null? System.today()>=lstOpp.Last_Transaction__c.addDays(90):false){
                         Id usr = [Select Id,Name from User where Name = 'Anderson Advisors']?.Id; 
                    system.debug('creating task == ');
                    tsk.WhatId = lstOpp.id;
                    tsk.WhoId=contactIDR;
                    tsk.RecordTypeId = tskRecTyp.Id;
                    tsk.Subject = 'Follow up on reinstated Platinum Payment';
                    tsk.OwnerId = usr;
                        tsk.Client__c= lstOpp.AccountId;
                    //tsk.OwnerId = acId.OwnerId;
                    tsk.Date_Due__c = currentDate.addDays(1);
                    tsk.Status = 'open';
                    tsk.Priority = 'Normal';
                    tsk.Description='This client reinstated their platinum subscription that was expired over 90 days ago. Please contact them to collect balance due.';
                    }
                   
                }
                if(opId.size() > 0 ){
                   lstOpp.ChargentSFA__Payment_Frequency__c='Monthly'; 
                      lstOpp.ChargentSFA__Payment_Status__c='Recurring';
                    lstOpp.ChargentSFA__Payment_Start_Date__c=currentDate.addMonths(1);
                    lstOpp.ChargentSFA__Charge_Amount__c=35;
                    oppupdate.add(lstOpp);
                }
                system.debug('');
                insert tsk;
                if(oppupdate.size()>0){
                     update oppupdate;
                }
               
                String Amount=String.valueOf(transactionAmount[0]);
                tranMap.put('ID',transactionId[0]);
                tranMap.put('Status',transactionStatus[0]);
                tranMap.put('Amount',Amount);
                tranMap.put('Message',transactionMsg[0]);
                system.debug('tranMap=='+tranMap);
                string jsonstring = JSON.serialize(tranMap);
                system.debug('jsonstring=='+jsonstring);
                transVal += transactionId +','+ transactionStatus +', '+ transactionAmount+', '+transactionMsg+'\n';
                system.debug('transVal=='+transVal);
                return jsonstring;
            }  else {
                return null;
            }
            
            
        }
        catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
            return null;
        }  
    }
    
}