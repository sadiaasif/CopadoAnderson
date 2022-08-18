global class helperChargentClass {



     @future(callout=true)
     public static void processRecords(ID oppID) {


                Opportunity opp=new Opportunity();

                ChargentSFA.TChargentOperations.TChargentResult ChargentResult;
                string transactionStatus;
                string transactionMsg;
                string transactionID;
                String toemail ;
                String toemail1;

                System.debug('OppID is'+OppID);



                if(oppID!=null){


                      opp=[Select id,ChargentSFA__Charge_Amount__c,ChargentSFA__Payment_Method__c,Billing_FirstName__c,Billing_LastName__c,ChargentSFA__Billing_Email__c,Billing_PhoneNumber__c,Billing_Company_Street__c,Billing_Postal_Code__c,Billing_Country__c,Amount,ChargentSFA__Card_Number__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Name__c,ChargentSFA__Balance_Due__c,ChargentSFA__Gateway__c from Opportunity where id=:oppID];

                      System.debug('Opp is'+Opp);

                }



                if(opp!=null){


                      System.debug('opp id is'+opp.id);

                      System.debug('Opportunity is'+opp);

                      //System.debug('ChargentResult is'+ChargentSFA.TChargentOperations.ChargeOpportunity_Click(opp[0].id));

                      opp.ChargentSFA__Charge_Amount__c=opp.Amount;
                      System.debug('Opportunity is'+opp);
                      ChargentResult = ChargentSFA.TChargentOperations.ChargeOpportunity_Click(opp.id);

                      System.debug('ChargentResult is'+ChargentResult);


                      List<String> tmp = ChargentResult.Message.split('\r\n');

                      if(tmp.size() == 3){

                        transactionStatus = tmp[1].substring(tmp[1].indexOf('"') + 1,tmp[1].length() -1);
                        transactionMsg = tmp[2].substring(tmp[2].indexOf('"') + 1,tmp[2].length() -1);
                         transactionID = tmp[0].mid(tmp[0].indexOf('(')+1,tmp[0].indexOf(')') - tmp[0].indexOf('(')-1);
                     }

                     else {

                          transactionStatus = 'UNKNOWN';
                          transactionMsg = 'UNKNOWN Response';

                      }

                          system.debug('transaction Status is'+transactionStatus);
                          system.debug('transaction message is'+transactionMsg);
                          system.debug('transaction ID is'+transactionID);

                      // if (ChargentResult.Message.indexOf('Approved') < 0) {

                      //    isError = false;
                      //    System.debug('apr value is'+isError);

                      //}

                //     if(transactionStatus=='Approved' || transactionStatus=='Error'){


                //               if(transactionStatus=='Approved'){

                //                          //opp.Event_Transaction__c='successfull';

                //                          //oppList.add(opp);

                //                          toemail='prdudeja@gmail.com';
                //                          toemail1='prdudeja@gmail.com';
                //                          //toemail='andersonformmail@gmail.com';
                //                          //toemail1='eterrell@andersonadvisors.com';



                //                          String[] toAddresses1 = new String[]{toemail,toemail1};


                //                          Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

                //                          email.setSubject('Event Form');
                //                          email.setToAddresses(toAddresses1);
                //                          email.setPlainTextBody('Thank you for Submitting the form here are the details '+  '' + '\t\n' +''+

                //                          'First Name :' + opp.Billing_FirstName__c +  '' + '\t\n' +''+
                //                          'Last Name :' + opp.Billing_LastName__c +   '' + '\t\n' +''+
                //                          'Email :' + opp.ChargentSFA__Billing_Email__c +  '' + '\t\n' +''+
                //                          'Phone :' + opp.Billing_PhoneNumber__c +  '' + '\t\n' +''+
                //                          'Address :' + opp.Billing_Company_Street__c +  '' + '\t\n' +''+
                //                          'ZIP/Postal Code :' + opp.Billing_Postal_Code__c +  '' + '\t\n' +''+
                //                          'Country :' + opp.Billing_Country__c +  '' + '\t\n' +''+
                //                          'Amount :' + opp.Amount +  '' + '\t\n' +''+
                //                          'CreditCard Number :' + opp.ChargentSFA__Card_Number__c +  '' + '\t\n' +''+
                //                          'CreditCard Month :' + opp.ChargentSFA__Card_Month__c +  '' + '\t\n' +''+
                //                          'CreditCard Year :' + opp.ChargentSFA__Card_Year__c +  '' + '\t\n' +''+
                //                          'CreditCard Holder Name :' + opp.ChargentSFA__Card_Name__c

                //                      );

                //                          Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
                //           }

                //}


           }

      }

}