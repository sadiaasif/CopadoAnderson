public class eventSuccessExtension {

            public Boolean isSuccess {get; set;}
            public ID oppID;
            public list<ChargentSFA__Transaction__c> transList=new list<ChargentSFA__Transaction__c>();

            public eventSuccessExtension() {

                         isSuccess=False;

            }

            public void onLoad(){

                    oppID=ApexPages.currentPage().getParameters().get('id');

                      if(oppID!=null)  {

                                transList=[SELECT ChargentSFA__AVS_Response_Code__c,ChargentSFA__Response_Status__c,ChargentSFA__Opportunity__c,ChargentSFA__Response_Message__c FROM ChargentSFA__Transaction__c where ChargentSFA__Opportunity__c=:oppID];


                      }


                     if(!transList.isEmpty()){
                         System.debug('ChargentSFA__Response_Status__c: '+ transList[0].ChargentSFA__Response_Status__c );
                         if(transList[0].ChargentSFA__Response_Status__c=='Approved'){
                             
                             isSuccess=True;
                             ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.INFO, 'Thank you for your registration');
                             ApexPages.addMessage(myMsg);
                             
                         }
                         else {
                             
                             ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error, transList[0].ChargentSFA__Response_Message__c);
                             ApexPages.addMessage(myMsg);
                             
                         }


                    }

                    else {

                            ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error, 'Some Error Occured Please Go Back and Filled Form Again');
                            ApexPages.addMessage(myMsg);
                     }
            }

            public PageReference redirectToEventForm(){

                      oppID=ApexPages.currentPage().getParameters().get('id');

                      List<Opportunity> oppList=new List<Opportunity>();

                      if(oppID!=null){

                                oppList=[Select id,ChargentSFA__Charge_Amount__c,ChargentSFA__Payment_Method__c,Billing_FirstName__c,Billing_LastName__c,ChargentSFA__Billing_Email__c,Billing_PhoneNumber__c,Billing_Company_Street__c,Billing_Postal_Code__c,Billing_Country__c,Amount,ChargentSFA__Card_Number__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Name__c,ChargentSFA__Balance_Due__c,ChargentSFA__Gateway__c from Opportunity where id=:oppID];

                                transList=[SELECT ChargentSFA__AVS_Response_Code__c,ChargentSFA__Response_Status__c,ChargentSFA__Opportunity__c,ChargentSFA__Response_Message__c FROM    ChargentSFA__Transaction__c where ChargentSFA__Opportunity__c=:oppID];

                      }

                      if(!transList.isEmpty()){

                           if(transList[0].ChargentSFA__Response_Status__c=='Approved'){

                                  PageReference pageRef = new PageReference('/apex/eventForm');
                                  pageRef.setRedirect(True);
                                  system.debug('pageref is'+pageref);
                                  return pageRef;


                           }
                          else {

                                if(!oppList.isEmpty()){

                                     delete oppList[0];

                                }
                                PageReference pageRef = new PageReference('/apex/eventForm');
                                pageRef.setRedirect(True);
                                system.debug('pageref is'+pageref);
                                return pageRef;

                          }


                    }

                    else {

                          if(!oppList.isEmpty()){

                               delete oppList[0];

                          }
                          PageReference pageRef = new PageReference('/apex/eventForm');
                          pageRef.setRedirect(True);
                          system.debug('pageref is'+pageref);
                          return pageRef;

                     }


            }



}