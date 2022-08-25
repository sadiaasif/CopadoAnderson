@isTest
private class TesteventFormExtension
{
	@isTest
	static void itShould()
	{

                            Events__c  event=new Events__c ();
                            event.Name='test event';
                            event.Event_cost__c=100;
                            event.Coupon_Name__c='test';
                            event.Coupon_Name_2__c='test1';
                            event.Discount_Percent__c ='10';
                            event.Discount_Percent_2__c='10';
                            event.Campaign_Name__c='test cam';
                            insert event;

                            eventFormExtension efe=new eventFormExtension();

                            Test.setCurrentPage(Page.eventForm);

                            efe.checkCreditCard();

                            efe.opp.ChargentSFA__Card_Number__c=null;

                            List<Apexpages.Message> msgs = ApexPages.getMessages();

                             boolean isErrorMessage = false;


                             for(Apexpages.Message msg : msgs) {
                                      if (msg.getDetail().contains('Please enter a credit card number'))
                                       isErrorMessage  = true;

                            }

                             //Assert that the Page Message was Properly Displayed
                             system.assert(isErrorMessage);




                             efe.opp.Billing_FirstName__c='test first name';

                             efe.opp.Billing_LastName__c='test last name';

                             efe.opp.Billing_Company_Street__c='test street name';

                             efe.opp.Billing_Postal_Code__c='100';

                             efe.opp.Billing_Country__c='India';

                             efe.opp.ChargentSFA__Card_Number__c='1234567891234567';

                              efe.listValue='test event';



                              efe.saveEvent();

                              efe.discount='test';

                              efe.quantity=10;

                              efe.calculatePrice();


                              efe.quantity=1;
                              efe.discount='test1';

                              efe.calculatePrice();


                               efe.discount='test2';

                              efe.calculatePrice();


                                efe.listValue='--None--';

                                efe.calculatePrice();


                                eventFormExtension efe1=new eventFormExtension();








                                efe1.opp.Billing_Company_Street__c=null;

                                efe1.opp.Billing_FirstName__c='test first name';

                                efe1.opp.Billing_LastName__c='test last name';

                                efe1.opp.Billing_Postal_Code__c='100';

                                efe1.opp.Billing_Country__c='India';

                                efe1.opp.ChargentSFA__Card_Number__c='1234567891234567';

                                 efe1.listValue='test event';



                                 efe1.saveEvent();

                                 efe1.discount='test';

                                 efe1.quantity=10;



                                 efe1.calculatePrice();

                                 List<Apexpages.Message> msgs1 = ApexPages.getMessages();

                                  boolean isErrorMessage1 = false;


                                  for(Apexpages.Message msg : msgs1) {
                                           if (msg.getDetail().contains('Please fill Address'))
                                            isErrorMessage1  = true;

                                 }

                                  //Assert that the Page Message was Properly Displayed
                                  system.assert(isErrorMessage1);


                                  //efe1.chargeCredit();


                                  //efe1.transactionStatus='Approved';

                                  //efe1.sendMail();




                                // account acc = new account();
                                // acc.Name = 'test';
                                // acc.E_Mail__c = 'test@test.com';
                                // acc.RecordTypeId = '012U0000000D8qm';
                                // insert acc;


                                //Opportunity opp = new Opportunity();
                                //  opp.Name = 'test';
                                //  opp.AccountId = acc.Id;
                                //  opp.CloseDate = System.today();
                                //  opp.StageName = 'Prospecting';
                                //  opp.Amount = 1079.90;
                                //  opp.Entity_Type__c = 'S-Corporation';
                                //  opp.Entrity_Name__c = 'Test';
                                //  opp.ChargentSFA__Billing_Address__c = 'Test';
                                //  opp.ChargentSFA__Billing_City__c = 'Test';
                                //  opp.ChargentSFA__Billing_Company__c = 'Test';
                                //  opp.ChargentSFA__Billing_Country__c = 'Test';
                                //  opp.ChargentSFA__Billing_State__c = 'test';
                                //  opp.ChargentSFA__Billing_Fax__c = '123456';
                                //  opp.ChargentSFA__Billing_First__c = 'test';
                                //  opp.ChargentSFA__Billing_Last__c = 'test';
                                //  opp.ChargentSFA__Billing_Phone__c = '1234567890';
                                //  opp.ChargentSFA__Billing_Postcode__c = '123456';
                                //  opp.ChargentSFA__Payment_Method__c = 'Credit Card';
                                //  opp.ChargentSFA__Card_Type__c = 'Visa';
                                //  opp.ChargentSFA__Billing_Email__c = 'test@test.com';
                                //  opp.ChargentSFA__Payment_Count__c = 25;
                                //  opp.ChargentSFA__Payment_Start_Date__c = system.today();
                                //  opp.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
                                //  opp.ChargentSFA__Payment_Stop__c = 'Count';
                                //  opp.ChargentSFA__Payment_Status__c = 'Partial';
                                //  opp.ChargentSFA__Payment_Frequency__c = 'Daily';
                                //  opp.ChargentSFA__Payment_Status__c = 'Recurring';
                                //   insert opp;


                                //  ChargentSFA.TChargentOperations.TChargentResult Charge=ChargentSFA.TChargentOperations.ChargeOpportunity_Click(opp.id);

                                //  efe1.ChargentResult=Charge;


                             //List<Apexpages.Message> msgs1 = ApexPages.getMessages();

                             // boolean isErrorMessage1 = false;


                             // for(Apexpages.Message msg : msgs1) {
                             //          if (msg.getDetail().contains('Please enter a valid credit card number'))
                             //           isErrorMessage1  = true;

                             //}

                             ////Assert that the Page Message was Properly Displayed
                             //system.assert(isErrorMessage1);

                             //  efe.checkCreditCard();




	}
}