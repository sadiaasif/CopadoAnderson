@isTest
private class testeventSuccessExtension
{
	@isTest
	static void itShould()
	{

                        account acc = new account();
                        acc.Name = 'test';
                        acc.E_Mail__c = 'test@test.com';
                        acc.RecordTypeId = '012U0000000D8qm';
                        insert acc;

                         Opportunity opp = new Opportunity();
                         opp.Name = 'test';
                         opp.AccountId = acc.Id;
                         opp.CloseDate = System.today();
                         opp.StageName = 'Prospecting';
                         opp.Amount = 1.90;
                         opp.Entity_Type__c = 'S-Corporation';
                         opp.Entrity_Name__c = 'Test';
                         opp.ChargentSFA__Billing_Address__c = 'Test';
                         opp.ChargentSFA__Billing_City__c = 'Test';
                         opp.ChargentSFA__Billing_Company__c = 'Test';
                         opp.ChargentSFA__Billing_Country__c = 'Test';
                         opp.ChargentSFA__Billing_State__c = 'test';
                         opp.ChargentSFA__Billing_Fax__c = '123456';
                         opp.ChargentSFA__Billing_First__c = 'test';
                         opp.ChargentSFA__Billing_Last__c = 'test';
                         opp.ChargentSFA__Billing_Phone__c = '1234567890';
                         opp.ChargentSFA__Billing_Postcode__c = '123456';
                         opp.ChargentSFA__Payment_Method__c = 'Credit Card';
                         opp.ChargentSFA__Card_Type__c = 'Visa';
                         opp.ChargentSFA__Billing_Email__c = 'test@test.com';
                         opp.ChargentSFA__Payment_Count__c = 25;
                         opp.ChargentSFA__Payment_Start_Date__c = system.today();
                         opp.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
                         opp.ChargentSFA__Payment_Stop__c = 'Count';
                         opp.ChargentSFA__Payment_Status__c = 'Partial';
                         opp.ChargentSFA__Payment_Frequency__c = 'Daily';
                         opp.ChargentSFA__Payment_Status__c = 'Recurring';
                         opp.ChargentSFA__Card_Number__c='1234567891234567';
                         insert opp;




                        //eventFormExtension efe=new eventFormExtension();
                        //ApexPages.StandardController sc = new ApexPages.StandardController(opp);
                        Test.setCurrentPageReference(new PageReference('Page.eventSuccess'));
                        System.currentPageReference().getParameters().put('id', opp.id);

                        eventSuccessExtension ese=new eventSuccessExtension();
                        ese.onLoad();

                        //List<Apexpages.Message> msgs1 = ApexPages.getMessages();

                        // boolean isErrorMessage1 = false;


                        // for(Apexpages.Message msg : msgs1) {
                        //          if (msg.getDetail().contains('Please fill Address'))
                        //           isErrorMessage1  = true;

                        //}


                         //system.assert(isErrorMessage1);

                        ese.redirectToEventForm();


                        eventSuccessExtension ese1=new eventSuccessExtension();

                         Opportunity opp1 = new Opportunity();
                         opp1.Name = 'test';
                         opp1.AccountId = acc.Id;
                         opp1.CloseDate = System.today();
                         opp1.StageName = 'Prospecting';
                         opp1.Amount = 1.90;
                         opp1.Entity_Type__c = 'S-Corporation';
                         opp1.Entrity_Name__c = 'Test';
                         opp1.ChargentSFA__Billing_Address__c = 'Test';
                         opp1.ChargentSFA__Billing_City__c = 'Test';
                         opp1.ChargentSFA__Billing_Company__c = 'Test';
                         opp1.ChargentSFA__Billing_Country__c = 'Test';
                         opp1.ChargentSFA__Billing_State__c = 'test';
                         opp1.ChargentSFA__Billing_Fax__c = '123456';
                         opp1.ChargentSFA__Billing_First__c = 'test';
                         opp1.ChargentSFA__Billing_Last__c = 'test';
                         opp1.ChargentSFA__Billing_Phone__c = '1234567890';
                         opp1.ChargentSFA__Billing_Postcode__c = '123456';
                         opp1.ChargentSFA__Payment_Method__c = 'Credit Card';
                         opp1.ChargentSFA__Card_Type__c = 'Visa';
                         opp1.ChargentSFA__Billing_Email__c = 'test@test.com';
                         opp1.ChargentSFA__Payment_Count__c = 25;
                         opp1.ChargentSFA__Payment_Start_Date__c = system.today();
                         opp1.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
                         opp1.ChargentSFA__Payment_Stop__c = 'Count';
                         opp1.ChargentSFA__Payment_Status__c = 'Partial';
                         opp1.ChargentSFA__Payment_Frequency__c = 'Daily';
                         opp1.ChargentSFA__Payment_Status__c = 'Recurring';
                         opp1.ChargentSFA__Card_Number__c='1234567891234567';
                         insert opp1;

                        ChargentSFA__Transaction__c ct=new ChargentSFA__Transaction__c();
                        ct.ChargentSFA__Gateway_Date__c=System.today();
                        ct.ChargentSFA__Gateway_ID__c='12123123';
                        ct.ChargentSFA__Opportunity__c=opp1.id;
                        ct.ChargentSFA__Amount__c=1;
                        ct.ChargentSFA__Type__c='Charge';
                        ct.ChargentSFA__Response_Status__c='Approved';
                        ct.ChargentSFA__Payment_Method__c='Credit Card';
                        insert ct;

                        Test.setCurrentPageReference(new PageReference('Page.eventSuccess'));
                        System.currentPageReference().getParameters().put('id', opp1.id);


                        ese1.redirectToEventForm();

                        ct.ChargentSFA__Response_Status__c='Error';
                        update ct;
                        ese1.redirectToEventForm();


	}
}