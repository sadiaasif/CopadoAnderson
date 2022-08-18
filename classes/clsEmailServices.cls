global class clsEmailServices implements Messaging.InboundEmailHandler {

global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                  Messaging.InboundEnvelope env){

  // Create an inboundEmailResult object for returning 
  // the result of the Force.com Email Service
  Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
  
  String myPlainText = '';
  String emailBody = '';
  
  if(email.plainTextBody != null)
    emailBody = email.plainTextBody;
  else
    emailBody = email.htmlBody;
  // Add the email plain text into the local variable
  
  try
  {
    
        myPlainText = emailBody.substring(0, email.plainTextBody.indexOf('<stop>'));
  }
  catch (System.StringException e)
  {
       myPlainText = emailBody;
       System.debug('No <stop> in email: ' + e);
  }
  
  // new Task object to be created
  
  Task newTask = new Task();
  
      // Try to lookup any Accounts based on the email from address
      // If there is more than 1 account with the same email address
      // an exception will be thrown and the catch statement will be called
  try {
       List<Account> accounts = [Select Id, Name,E_Mail__c,Other_E_Mail__c,Spouse_E_Mail__c,Spouse_Other_E_Mail__c
           From Account Where E_Mail__c = : email.fromAddress OR E_Mail__c = : email.toAddresses OR Other_E_Mail__c = : email.fromAddress OR Other_E_Mail__c = : email.toAddresses OR Spouse_E_Mail__c = : email.fromAddress OR Spouse_E_Mail__c = : email.toAddresses OR Spouse_Other_E_Mail__c = : email.fromAddress OR Spouse_Other_E_Mail__c = : email.toAddresses];
       System.debug('^^^^^Accounts'+accounts);
       Set <Id> accId = new Set<Id>();
       for(Account a: accounts){
       
           accId.add(a.id);
       }
       List<Opportunity> lstopp = [select id,AccountId  from Opportunity where AccountId IN: accId];
       System.debug('#########lstopp'+ lstOpp);
    // Add a new Task to the opportunity records we just found above
     Set<Id> newAccId = new Set<Id>();
     
     if(lstopp.size() > 0){
         for(Opportunity op: lstopp){
                 accId.remove(op.AccountId);
                 newTask = new Task();
                 newTask.Description = myPlainText;
                 newTask.Priority = 'Normal';
                 newTask.Status = 'Completed';
                 newTask.Subject = email.subject;
                 newTask.ActivityDate = Date.today();
                 newTask.IsReminderSet = false;
                 newTask.ReminderDateTime = System.now()+1;
                 newTask.WhatId = op.Id;
                 insert newTask; 
        }
    }
   
   List<Account> lstAcc = [Select Id, Name,E_Mail__c,Other_E_Mail__c,Spouse_E_Mail__c,Spouse_Other_E_Mail__c
           From Account Where id IN:accId];
        for(Account a: lstAcc){
             newTask = new Task();
             newTask.Description = myPlainText;
             newTask.Priority = 'Normal';
             newTask.Status = 'Completed';
             newTask.Subject = email.subject;
             newTask.ActivityDate = Date.today();
             newTask.IsReminderSet = false;
             newTask.ReminderDateTime = System.now()+1;
             newTask.WhatId = a.Id;
             insert newTask;
         }  
    
    System.debug('New Task Object: ' + newTask );
    
    //Isert attachment into Account
    if(email.binaryAttachments != null && email.binaryAttachments.size() > 0){
      List<Attachment> attachList = new List<Attachment>();
      for(Account acc : accounts){
          for(Messaging.InboundEmail.BinaryAttachment a : email.binaryAttachments){
            Attachment attach = new Attachment();
            attach.Body = a.body;
            attach.Name = a.fileName;
            
            attach.ParentId = acc.Id;
            attachList.add(attach);
          }
      }
      insert attachList;
      
    }
  }
     // If there is an exception with the query looking up
     // the account this QueryException will be called.
     // and the exception will be written to the Apex Debug logs
  
     catch (System.QueryException e) {
     System.debug('Query Issue: ' + e);
  }
  
  // Set the result to true, no need to send an email back to the user
  // with an error message
  
  result.success = true;
  
  // Return the result for the Force.com Email Service
  return result;
}

//////////// Test Method Start//////////////////

    static testMethod void testTasks() {
      
      Account a = new Account(Name='Test',E_Mail__c='testlrtmail@gmail.com',Other_E_Mail__c='testlrtmail@gmail.com',Spouse_E_Mail__c='testlrtmail@gmail.com',Spouse_Other_E_Mail__c='testlrtmail@gmail.com');
          insert a;      
      
      Opportunity opp = new Opportunity();
         opp.Name = 'test';
         opp.AccountId = a.id;
         opp.CloseDate = System.today();
         opp.StageName = 'Prospecting';
         opp.Amount = 1079.90;             
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
         insert opp;
      
    // Create a new email and envelope object
       Messaging.InboundEmail email = new Messaging.InboundEmail();
       Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
    
    // Create the plainTextBody and fromAddres for the test
        email.plainTextBody = 'Here is my plainText body of the email <stop>';
        email.fromAddress ='testlrtmail@gmail.com';
        string[] toAddress = new String[] {'testlrtmail@gmail.com'}; 
        email.toAddresses = toAddress;
        email.binaryAttachments = new List<Messaging.InboundEmail.BinaryAttachment>(); 
        Messaging.InboundEmail.BinaryAttachment ba = new Messaging.InboundEmail.BinaryAttachment();
        ba.body =Blob.valueOf('jklsdj');
        ba.fileName = 'test'; 
        email.binaryAttachments.add(ba);
    
        clsEmailServices taskObj = new clsEmailServices();
        taskObj.handleInboundEmail(email, env);
        
         delete opp;      
        
         Account a1 = new Account(Name='Test',E_Mail__c='testlrtmail1@gmail.com',Other_E_Mail__c='testlrtmail1@gmail.com',Spouse_E_Mail__c='testlrtmail1@gmail.com',Spouse_Other_E_Mail__c='testlrtmail1@gmail.com');
         insert a1;        
         
         Opportunity opp1 = new Opportunity();
         opp1.Name = 'test';         
         opp1.CloseDate = System.today();
         opp1.StageName = 'Prospecting';
         opp1.Amount = 1079.90;             
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
         insert opp1;

         clsEmailServices taskObj1 = new clsEmailServices();
         taskObj1.handleInboundEmail(email, env);
    
        
        
       } 
//////////// Test Method End//////////////////
}