public with sharing class eventFormExtension {

    public List<Events__c> eventList {get; set;}
    public List<SelectOption> options{get;set;}
    public List<SelectOption> monthOptions{get;set;}
    public List<SelectOption> yearOptions{get;set;}
    public string listValue  {get;set;}
    //public string selectedMonth  {get;set;}
    //public string selectedYear  {get;set;}
    public string discount  {get;set;}
    public Integer quantity  {get;set;}
    //public Decimal opp.Amount  {get;set;}
    public Opportunity opp {get; set;}
    public Boolean isError {get; set;}
    public Boolean isSuccess {get; set;}
    public ChargentSFA.TChargentOperations.TChargentResult ChargentResult;
    public string transactionStatus;
    public string transactionMsg {get; set;}
    public string transactionID;
    public Database.SaveResult sr;
    public boolean guestBoolean {get; set;}
    public String guestName {get; set;}
    public String toemail {get; set;}
    public String toemail1 {get; set;}
    public list<Account> accList {get;set;}
    public ID opportunityID {get; set;}



    public eventFormExtension() {

        isError=false;
        isSuccess=false;
        guestBoolean=false;
        //sr=Database.SaveResult();
        accList=new list<Account>();
        Events__c event=new Events__c();
        eventList=new List<Events__c>();
        options = new List<SelectOption>();
        monthOptions = new List<SelectOption>();
        yearOptions = new List<SelectOption>();
        opp=new Opportunity();
        eventList=[Select Name,Event_cost__c,Coupon_Name__c,Discount_Percent__c from Events__c ];

        System.debug('event list is'+eventList);

        for(Integer i=1;i<10;i++){
                            monthOptions.add(new SelectOption(String.valueOf(0)+String.valueOf(i),String.valueOf(0)+String.valueOf(i)));
        }
        monthOptions.add(new SelectOption('10','10'));
        monthOptions.add(new SelectOption('11','11'));
        monthOptions.add(new SelectOption('12','12'));

         for(Integer i=system.today().year();i<2050;i++){
                yearOptions.add(new SelectOption(String.valueOf(i),String.valueOf(i)));

        }

            if(!eventList.isEmpty()){

                            options.add(new SelectOption('--None--', '--None--'));
                            for(Events__c eve : eventList){

                                        options.add(new SelectOption(eve.Name, eve.Name));

                            }

            }
    }

     public void checkCreditCard(){

                System.debug('value of credit card is'+opp.ChargentSFA__Card_Number__c);

              if (opp.ChargentSFA__Card_Number__c == null){


                            ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error, 'Please enter a credit card number');
                            ApexPages.addMessage(myMsg);
                }

             else {
                    Pattern MyPattern = Pattern.compile('[^0-9]');
                    Matcher MyMatcher = MyPattern.matcher(opp.ChargentSFA__Card_Number__c);
                    boolean reply = MyMatcher.find();
                    system.debug('reply is'+reply);
                    if (reply){

                            ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error, 'Please enter a valid credit card number');
                            ApexPages.addMessage(myMsg);

                    }
                }


    }

    public pageReference  saveEvent(){


                 System.debug('Opportunity'+opp);
                 opp.CloseDate=System.today();
                 opp.Event_Transaction__c='Unsuccessfull';
                 opp.StageName='Qualification';
                 opp.Name=System.today()+' Event';
                 opp.AVSFQB__Generate_Object__c='Invoice Generated From Even Form';
                 opp.ChargentSFA__Gateway__c=label.GatewayID;

                 Account  acc=new Account();

                 if(opp.Billing_FirstName__c!=null || opp.Billing_LastName__c!=null){

                           acc.Name=opp.Billing_FirstName__c + opp.Billing_LastName__c;

                 }

                 if(opp.Billing_FirstName__c!=null){

                          acc.First_Name__c=opp.Billing_FirstName__c;

                 }
                 if(opp.Billing_LastName__c!=null){
                          acc.Last_Name__c=opp.Billing_LastName__c;

                 }

                    if(opp.Billing_Company_Street__c!=null){

                            acc.BillingStreet=opp.Billing_Company_Street__c;
                    }

                    else {

                           ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error, 'Please fill Address');
                           ApexPages.addMessage(myMsg);
                    }

                 if(opp.Billing_Postal_Code__c!=null){

                            acc.BillingPostalCode=opp.Billing_Postal_Code__c;

                 }
                 else {

                           ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error, 'Please fill Postal Code');
                           ApexPages.addMessage(myMsg);
                 }

                if(opp.ChargentSFA__Card_Name__c==null){
                            ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error, 'Please add Card Holder Name');
                            ApexPages.addMessage(myMsg);
                }

                 if(opp.Billing_Country__c!=null){

                            acc.BillingCountry=opp.Billing_Country__c;

                 }

                 if(acc.Name!=null){

                             accList=[Select id,name from Account where E_Mail__c=:opp.ChargentSFA__Billing_Email__c limit 1];
                            if(!accList.isEmpty()){
                                    opp.AccountId=accList[0].id;
                            }
                            else {
                            acc.E_Mail__c=opp.ChargentSFA__Billing_Email__c;
                            insert acc;
                            opp.AccountId=acc.id;

                            }
                 }



                Savepoint sp = Database.setSavepoint();

                if(opp.ChargentSFA__Card_Number__c!=null){

                     try {

                                  Events__c event=[Select Coupon_Name__c,Campaign_Name__c,Discount_Percent__c,Discount_Percent_2__c,Coupon_Name_2__c,Event_cost__c from Events__c where name=:listValue limit 1];

                                  system.debug('campaign name is'+ event.Campaign_Name__c);

                                 if(event.Campaign_Name__c!=null || event.Campaign_Name__c!=''){

                                        Campaign camp=[select id,Name from Campaign  where  name=:event.Campaign_Name__c limit 1];

                                        opp.CampaignId=camp.id;

                                        //update opp;

                                  }

                                  sr = Database.insert(opp, false);

                                 System.debug('SR value'+sr.Success);

                                  if (sr.isSuccess()) {

                                           System.debug('opp id is'+opp.ID);
                                           opportunityID=opp.ID;
                                           System.debug('opp id is'+opportunityID);
                                           helperChargentClass.processRecords(opp.ID);
                                           isSuccess=true;
                                           long now = datetime.now().gettime();
                                           while(datetime.now().gettime()-now<5000); // Busy loop for 5000 ms
                                           PageReference pageRef = new PageReference('/apex/eventSuccess'+'?id='+opp.ID);
                                           system.debug('pageref is'+pageref);
                                           pageRef.setRedirect(False);
                                           return pageRef;

                                           //ID jobID=  System.enqueueJob(new helperChargentClass(opp.ID));
                                }





                     } catch(Exception e) {

                                 System.debug(e.getMessage());
                                 ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error, 'There is an error: ' + ' ' + e.getMessage());
                                 ApexPages.addMessage(myMsg);
                                 opp.ChargentSFA__Card_Number__c=null;
                                 Database.rollback(sp);

                     }

                }

                //else {
                //  update opp;
                //}
                return null;

    }

    //public void changeBoolean(){

    //  System.debug('is error value is'+isError);

    //        if(isSuccess){
    //          isSuccess=false;
    //        }
    //        if(isError){
    //          System.debug('is error value is'+isError);
    //          isError=false;
    //        }

    //}

    //public void chargeCredit(){



    //            System.debug('Calling charge credit');
    //            System.debug('opp id is'+opp.id);

    //            System.debug('Opportunity is'+opp);

    //            //System.debug('ChargentResult is'+ChargentSFA.TChargentOperations.ChargeOpportunity_Click(opp.id));

    //             ChargentResult = ChargentSFA.TChargentOperations.ChargeOpportunity_Click(opp.id);

    //             System.debug('ChargentResult is'+ChargentResult);


    //             List<String> tmp = ChargentResult.Message.split('\r\n');

    //            if(tmp.size() == 3){

    //                transactionStatus = tmp[1].substring(tmp[1].indexOf('"') + 1,tmp[1].length() -1);
    //                transactionMsg = tmp[2].substring(tmp[2].indexOf('"') + 1,tmp[2].length() -1);
    //                 transactionID = tmp[0].mid(tmp[0].indexOf('(')+1,tmp[0].indexOf(')') - tmp[0].indexOf('(')-1);
    //            }
    //             else {
    //                 transactionStatus = 'UNKNOWN';
    //                  transactionMsg = 'UNKNOWN Response';
    //              }

    //                  system.debug('transaction Status is'+transactionStatus);
    //                  system.debug('transaction message is'+transactionMsg);
    //                  system.debug('transaction ID is'+transactionID);

    //            // if (ChargentResult.Message.indexOf('Approved') < 0) {

    //            //    isError = false;
    //            //    System.debug('apr value is'+isError);

    //            //}

    //       if(transactionStatus=='Approved' || transactionStatus=='Error'){

    //          sendMail();
    //          isSuccess=true;
    //       }

    //}


    //  public void sendMail(){

    //       if(transactionStatus=='Approved'){

    //              //if (sr.isSuccess()) {

    //                            ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.INFO, 'Thanks for registering the event');
    //                            ApexPages.addMessage(myMsg);
    //                            isSuccess=true;

    //                          //toemail='prdudeja@gmail.com';
    //                          toemail='andersonformmail@gmail.com';
    //                          toemail1='eterrell@andersonadvisors.com';



    //                          String[] toAddresses1 = new String[]{toemail,toemail1};


    //                          Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

    //                          email.setSubject('Event Form');
    //                          email.setToAddresses(toAddresses1);
    //                          email.setPlainTextBody('Thank you for Submitting the form here are the details '+  '' + '\t\n' +''+

    //                                  'First Name :' + opp.Billing_FirstName__c +  '' + '\t\n' +''+
    //                                  'Last Name :' + opp.Billing_LastName__c +   '' + '\t\n' +''+
    //                                  'Email :' + opp.ChargentSFA__Billing_Email__c +  '' + '\t\n' +''+
    //                                  'Phone :' + opp.Billing_PhoneNumber__c +  '' + '\t\n' +''+
    //                                  'Address :' + opp.Billing_Company_Street__c +  '' + '\t\n' +''+
    //                                  'ZIP/Postal Code :' + opp.Billing_Postal_Code__c +  '' + '\t\n' +''+
    //                                  'Country :' + opp.Billing_Country__c +  '' + '\t\n' +''+
    //                                  'Event Name :' + listValue +  '' + '\t\n' +''+
    //                                  'Discount Name :' + discount +  '' + '\t\n' +''+
    //                                  'Quantity :' + quantity +  '' + '\t\n' +''+
    //                                  'Amount :' + opp.Amount +  '' + '\t\n' +''+
    //                                  'CreditCard Number :' + opp.ChargentSFA__Card_Number__c +  '' + '\t\n' +''+
    //                                  'CreditCard Month :' + opp.ChargentSFA__Card_Month__c +  '' + '\t\n' +''+
    //                                  'CreditCard Year :' + opp.ChargentSFA__Card_Year__c +  '' + '\t\n' +''+
    //                                  'CreditCard Security Code :' + opp.ChargentSFA__Card_Security__c +  '' + '\t\n' +''+
    //                                  'CreditCard Holder Name :' + opp.ChargentSFA__Card_Name__c

    //                              );

    //                              Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});



    //                //}


    //           }

    //        else if (transactionStatus=='Error') {


    //               ApexPages.Message myMsg=new ApexPages.Message(ApexPages.Severity.Error, transactionMsg);
    //               ApexPages.addMessage(myMsg);
    //               isError=true;
    //               system.debug('inside transaction status');
    //               opp.ChargentSFA__Card_Number__c=null;
    //               opp.ChargentSFA__Card_Security__c=null;


    //        }

    //}





    public void calculatePrice(){


                System.debug(listValue);

                System.debug('quantity is' +quantity);
                if(quantity>1){

                           guestBoolean=true;
                           System.debug('Value of guestBoolean is' +guestBoolean);
                }
                else if (quantity==1) {

                            guestBoolean=false;
                            System.debug('Value of guestBoolean is' +guestBoolean);
                }

                if(listValue!='--None--'){

                            Events__c event=[Select Coupon_Name__c,Discount_Percent__c,Discount_Percent_2__c,Coupon_Name_2__c,Event_cost__c from Events__c where name=:listValue limit 1];
                            System.debug('event is'+event);
                            System.debug('discount is'+discount);

                            if(event.Coupon_Name__c==discount){
                                Decimal tempHold=((Decimal.valueOf(event.Discount_Percent__c)/100)*event.Event_cost__c);
                                opp.Amount=event.Event_cost__c-tempHold;

                                System.debug('event cost is'+event.Event_cost__c);
                                System.debug('event discount is'+event.Discount_Percent__c);
                                System.debug('tempHold is'+tempHold);
                                System.debug('amount is'+opp.Amount);

                                System.debug('quantity is'+quantity);

                                if(quantity!=0){
                                        System.debug('quantity is' +quantity);
                                        System.debug('amount is'+opp.Amount);
                                        opp.Amount*=quantity;
                                }
                                System.debug('total value is'+opp.Amount);

                            }
                            else if(event.Coupon_Name_2__c==discount){
                                        System.debug('event cost is'+event.Event_cost__c);
                                        System.debug('event discount is'+event.Discount_Percent_2__c);
                                Decimal tempHold=((Decimal.valueOf(event.Discount_Percent_2__c)/100)*event.Event_cost__c);


                                        System.debug('tempHold is'+tempHold);

                                        opp.Amount=event.Event_cost__c-tempHold;

                                        System.debug('amount is'+opp.Amount);

                                System.debug('quantity is'+quantity);

                                if(quantity!=0){
                                        opp.Amount*=quantity;
                                }
                                System.debug('total value is'+opp.Amount);

                            }
                            else {
                                opp.Amount=event.Event_cost__c;
                                if(quantity!=0){
                                        opp.Amount*=quantity;
                                }
                                System.debug('total value is'+opp.Amount);
                            }

                }
                else {
                                opp.Amount=null;
                }

    }


}