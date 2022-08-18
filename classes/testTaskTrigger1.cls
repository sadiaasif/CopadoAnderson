@isTest
private class testTaskTrigger1 {
    
   
    @isTest static void taskTest()
    {
                
            Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Tax').getRecordTypeId();

            Account acc=new account();
            acc.Name='test name';
            acc.Important_Notes__c='test important notes';
            insert acc;

           Contact con=new Contact();
           con.firstname='test contact name';
           con.LastName='test last name';
           con.AccountId=acc.id;
           con.phone='11111111';

           insert con;

           /* Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
            User u = new User(Alias = 'standt', Email='prdudej345a@gmail.com',
            EmailEncodingKey='UTF-8', LastName='Dacanay345',FirstName='Emily345', LanguageLocaleKey='en_US',
            LocaleSidKey='en_US', ProfileId = p.Id,
            TimeZoneSidKey='America/Los_Angeles', UserName='prdudeja345Test@gmail.com');

            insert u;*/
  
        List<task> tasklist=new List<task>();
        
            Task tt=new task();
            tt.OwnerId=userinfo.getuserid();
            tt.Subject='test task';
            tt.Status='Not Started';
            tt.Priority='Normal';
            tt.RecordTypeId=recordTypeID;
            
        tt.Tax_Stage__c='Waiting on Bookkeeping';
tt.Bookkeeping_Admin__c = 'Christina Chavez';
    tt.Formation_Processor__c = 'James Morris';
      //  tt.Tax_Advisors_Admin__c = 'Ashley Silafau-Sanitoa';
         tt.Tax_Supervisor__c='Jeffery Webb';
          tt.Tax_Preparer__c='Jeffery Webb';
       
     tasklist.add(tt);
        
          Task tt1=new task();
            tt1.OwnerId=userinfo.getuserid();
            tt1.Subject='test task';
            tt1.Status='Not Started';
            tt1.Priority='Normal';
            tt1.RecordTypeId=recordTypeID;
            tt1.Tax_Supervisor__c='Jeffery Webb';
        tt1.Tax_Stage__c='Assigned';
      
    tt1.Formation_Processor__c = 'James Morris';
    //    tt1.Tax_Advisors_Admin__c = 'Ashley Silafau-Sanitoa';
         tt1.Tax_Supervisor__c='Jeffery Webb';
          tt1.Tax_Preparer__c='Jeffery Webb';
       
       
        tasklist.add(tt1);
           
        Task tt2=new task();
            tt2.OwnerId=userinfo.getuserid();
            tt2.Subject='test task';
            tt2.Status='Not Started';
            tt2.Priority='Normal';
            tt2.RecordTypeId=recordTypeID;
           
        tt2.Tax_Stage__c='Review';
         tt2.Formation_Processor__c = 'James Morris';
     
    // tt2.Tax_Advisors_Admin__c = 'Ashley Silafau-Sanitoa';
         tt2.Tax_Supervisor__c='Jeffery Webb';
          tt2.Tax_Preparer__c='Jeffery Webb';
     
         tasklist.add(tt2);
        
        Task tt3=new task();
            tt3.OwnerId=userinfo.getuserid();
            tt3.Subject='test task';
            tt3.Status='Not Started';
            tt3.Priority='Normal';
            tt3.RecordTypeId=recordTypeID;
            tt3.Tax_Supervisor__c='Jeffery Webb';
        tt3.Tax_Stage__c='Waiting on 8879 & Invoice';
   //  tt3.Tax_Advisors_Admin__c = 'Ashley Silafau-Sanitoa';
         tt3.Tax_Supervisor__c='Jeffery Webb';
          tt3.Tax_Preparer__c='Jeffery Webb';
         tt3.Formation_Processor__c = 'James Morris';
  
       tasklist.add(tt3);
        insert tasklist;

    }


            @isTest static void processingTest()
    {
    
            Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Processing').getRecordTypeId();

            Account acc=new account();
            acc.Name='test name';
            acc.Important_Notes__c='test important notes';
            insert acc;

           Contact con=new Contact();
           con.firstname='test contact name';
           con.LastName='test last name';
           con.AccountId=acc.id;
           con.phone='11111111';

           insert con;

      /*     Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
           User u = new User(Alias = 'standt', Email='prdudeja234@gmail.com',
           EmailEncodingKey='UTF-8', LastName='Morris234',FirstName='James234', LanguageLocaleKey='en_US',
           LocaleSidKey='en_US', ProfileId = p.Id,
           TimeZoneSidKey='America/Los_Angeles', UserName='prdudej234Test1@gmail.com');

           insert u;*/
        
  List<task> taskList=new List<task>();
           Task tt=new task();
           tt.OwnerId=userinfo.getuserid();
           tt.Subject='test task';
           tt.Status='Not Started';
           tt.Priority='Normal';
           tt.RecordTypeId=recordTypeID;
           tt.Processors__c='James Morris';
        tt.Formation_Processor__c='James Morris';
       tt.CAM__c= 'Mary Borden';
        tt.CSR__c='Ambria Tibbs';
        tt.Mail_Clerks__c='Ana Hodgers';
        tt.Processing_Stage__c='Conversion Requested';
           taskTriggerHandler1.alreadyProcessed = false;
        taskList.add(tt);
        
       
           Task tt6=new task();
           tt6.OwnerId=userinfo.getuserid();
           tt6.Subject='test task';
           tt6.Status='Not Started';
           tt6.Priority='Normal';
           tt6.RecordTypeId=recordTypeID;
           tt6.Processors__c='James Morris';
        tt6.Formation_Processor__c='James Morris';
       tt6.CAM__c= 'Mary Borden';
        tt6.CSR__c='Ambria Tibbs';
        tt6.Mail_Clerks__c='Ana Hodgers';
        tt6.Processing_Stage__c='IRS Complete, Waiting on SOS';
           taskTriggerHandler1.alreadyProcessed = false;
        taskList.add(tt6);
        
         Task tt1=new task();
           tt1.OwnerId=userinfo.getuserid();
           tt1.Subject='test task';
           tt1.Status='Not Started';
           tt1.Priority='Normal';
           tt1.RecordTypeId=recordTypeID;
           tt1.Processors__c='James Morris';
        tt1.Formation_Processor__c='James Morris';
       tt1.CAM__c= 'Mary Borden';
        tt1.CSR__c='Ambria Tibbs';
        tt1.Mail_Clerks__c='Ana Hodgers';
        tt1.Processing_Stage__c='Waiting on Client';
           taskTriggerHandler1.alreadyProcessed = false;
         taskList.add(tt1);
        
        Task tt2=new task();
           tt2.OwnerId=userinfo.getuserid();
           tt2.Subject='test task';
           tt2.Status='Not Started';
           tt2.Priority='Normal';
           tt2.RecordTypeId=recordTypeID;
           tt2.Processors__c='James Morris';
        tt2.Formation_Processor__c='James Morris';
       tt2.CAM__c= 'Mary Borden';
        tt2.CSR__c='Ambria Tibbs';
        tt2.Mail_Clerks__c='Ana Hodgers';
      //  tt2.Processing_Stage__c='Supervisor Review';
           taskTriggerHandler1.alreadyProcessed = false;
         taskList.add(tt2);
        
          Task tt3=new task();
           tt3.OwnerId=userinfo.getuserid();
           tt3.Subject='test task';
           tt3.Status='Not Started';
           tt3.Priority='Normal';
           tt3.RecordTypeId=recordTypeID;
           tt3.Processors__c='James Morris';
        tt3.Formation_Processor__c='James Morris';
       tt3.CAM__c= 'Mary Borden';
        tt3.CSR__c='Ambria Tibbs';
        tt3.Mail_Clerks__c='Ana Hodgers';
        tt3.Processing_Stage__c='Ready to Ship';
           taskTriggerHandler1.alreadyProcessed = false;
          taskList.add(tt3);
        
        Task tt4=new task();
           tt4.OwnerId=userinfo.getuserid();
           tt4.Subject='test task';
           tt4.Status='Not Started';
           tt4.Priority='Normal';
           tt4.RecordTypeId=recordTypeID;
           tt4.Processors__c='James Morris';
        tt4.Formation_Processor__c='James Morris';
       tt4.CAM__c= 'Mary Borden';
        tt4.CSR__c='Ambria Tibbs';
        tt4.Mail_Clerks__c='Ana Hodgers';
      
           taskTriggerHandler1.alreadyProcessed = false;
         taskList.add(tt4);
        
         Task tt5=new task();
           tt5.OwnerId=userinfo.getuserid();
           tt5.Subject='test task';
           tt5.Status='Not Started';
           tt5.Priority='Normal';
           tt5.RecordTypeId=recordTypeID;
         
       tt5.CAM__c= 'Mary Borden';
        tt5.CSR__c='Ambria Tibbs';
        tt5.Mail_Clerks__c='Ana Hodgers';
        tt5.Processing_Stage__c='Back to Processor';
           taskTriggerHandler1.alreadyProcessed = false;
         taskList.add(tt5);
        
          Task tt7=new task();
           tt7.OwnerId=userinfo.getuserid();
           tt7.Subject='test task';
           tt7.Status='Not Started';
           tt7.Priority='Normal';
           tt7.RecordTypeId=recordTypeID;
           tt7.Formation_Processor__c='James Morris';
       tt7.CAM__c= 'Mary Borden';
        tt7.CSR__c='Ambria Tibbs';
        tt7.Mail_Clerks__c='Ana Hodgers';
        tt7.Processing_Stage__c='Back to Processor';
           taskTriggerHandler1.alreadyProcessed = false;
         taskList.add(tt7);
        
           Task tt8=new task();
           tt8.OwnerId=userinfo.getuserid();
           tt8.Subject='test task';
           tt8.Status='Not Started';
           tt8.Priority='Normal';
           tt8.RecordTypeId=recordTypeID;
           tt8.Processors__c ='James Morris';
       tt8.CAM__c= 'Mary Borden';
        tt8.CSR__c='Ambria Tibbs';
        tt8.Mail_Clerks__c='Ana Hodgers';
        tt8.Processing_Stage__c='Back to Processor';
           taskTriggerHandler1.alreadyProcessed = false;
         taskList.add(tt8);
        
         Task tt9=new task();
           tt9.OwnerId=userinfo.getuserid();
           tt9.Subject='test task';
           tt9.Status='Not Started';
           tt9.Priority='Normal';
           tt9.RecordTypeId=recordTypeID;
           tt9.Processors__c ='James Morris';
       tt9.CAM__c= 'Mary Borden';
        tt9.CSR__c='Ambria Tibbs';
        tt9.Mail_Clerks__c='Ana Hodgers';
        tt9.Processing_Stage__c='Review/Update Structure';
           taskTriggerHandler1.alreadyProcessed = false;
         taskList.add(tt9);
        Insert taskList;
    }

            @isTest static void bookkeepingTest()
    {

            Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Bookkeeping Task').getRecordTypeId();

           
        Account acc=new account();
            acc.Name='test name';
            acc.Important_Notes__c='test important notes';
            insert acc;

           Contact con=new Contact();
           con.firstname='test contact name';
           con.LastName='test last name';
           con.AccountId=acc.id;
           con.phone='11111111';

           insert con;
/* Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
           User u = new User(Alias = 'standt', Email='prdudeja12411247@gmail.com',
           EmailEncodingKey='UTF-8', LastName='Chavez',FirstName='Christina', LanguageLocaleKey='en_US',
           LocaleSidKey='en_US', ProfileId = p.Id,
           TimeZoneSidKey='America/Los_Angeles', UserName='prdudeja12411247Test2@gmail.com');

           insert u;*/
        
        case c=new case();
        c.AccountId=acc.id;
        c.ContactId=con.id;
        c.RecordTypeId='012U0000000g6UY';
        c.Status='New';
        c.Info_Sent_to_ABA_By__c='Access';
        c.QuickBooks_Version__c='QB Desktop';
        c.Number_of_Entities__c='1';
       // insert c;
       
        List<task> taskList=new List<task>();
        
         Task tt=new task();
           tt.OwnerId=userinfo.getuserid();
           tt.Subject='test task';
           tt.Status='Not Started';
           tt.Priority='Normal';
           tt.RecordTypeId=recordTypeID;
           tt.WhoId = con.id;
           tt.Bookkeeping_Admin__c = 'Blanca Lemus';
         tt.Bookkeeping_Reviewer__c = 'Blanca Lemus';
        tt.Bookkeeping_Stages__c='Not Started';
          tt.Tax_Supervisor__c='Toni Covey';
       tt.whatId=c.id;
           taskTriggerHandler1.alreadyProcessed = false;
        taskList.add(tt);  
        
         Task tt1=new task();
           tt1.OwnerId=userinfo.getuserid();
           tt1.Subject='test task';
           tt1.Status='Not Started';
           tt1.Priority='Normal';
           tt1.RecordTypeId=recordTypeID;
           tt1.WhoId = con.id;
           tt1.Bookkeeping_Admin__c = 'Blanca Lemus';
         tt1.Bookkeeping_Reviewer__c = 'Blanca Lemus';
        tt1.Bookkeeping_Stages__c='Review';
        tt1.Tax_Supervisor__c='Toni Covey';
       tt1.whatId=c.id;
           taskTriggerHandler1.alreadyProcessed = false;
        taskList.add(tt1);  
      // insert taskList;
    }


            @isTest static void andersonTest()
    {

            Id recordTypeID = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Anderson System').getRecordTypeId();

            Account acc=new account();
            acc.Name='test name';
            acc.Important_Notes__c='test important notes';
            insert acc;

           Contact con=new Contact();
           con.firstname='test contact name';
           con.LastName='test last name';
           con.AccountId=acc.id;
           con.phone='11111111';

           insert con;

/*           Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
           User u = new User(Alias = 'standt', Email='prdudeja12312312@gmail.com',
           EmailEncodingKey='UTF-8', LastName='Ronnander123',FirstName='Whitney123', LanguageLocaleKey='en_US',
           LocaleSidKey='en_US', ProfileId = p.Id,
           TimeZoneSidKey='America/Los_Angeles', UserName='prdudeja12312312Test3@gmail.com');

           insert u;*/
  
        List<task> taskList=new List<task>();
           Task tt=new task();
           tt.OwnerId=userinfo.getuserid();
           tt.Subject='test task';
           tt.Status='Not Started';
           tt.Priority='Normal';
           tt.RecordTypeId=recordTypeID;
           tt.CSR__c='Ambria Tibbs';
          tt.Tax_Preparer__c='Christia Thompson';
          //  tt.Tax_Advisors_Admin__c='Ashley Silafau-Sanitoa';
        tt.Anderson_System_Stage__c='Not Started';
        
           taskTriggerHandler1.alreadyProcessed = false;
        taskList.add(tt);
        
         Task tt1=new task();
           tt1.OwnerId=userinfo.getuserid();
           tt1.Subject='test task';
           tt1.Status='Not Started';
           tt1.Priority='Normal';
           tt1.RecordTypeId=recordTypeID;
          tt1.CSR__c='Ambria Tibbs';
          tt1.Tax_Preparer__c='Christia Thompson';
         //   tt1.Tax_Advisors_Admin__c='Ashley Silafau-Sanitoa';
        tt1.Anderson_System_Stage__c='BCP - Binder Review Completed';
           taskTriggerHandler1.alreadyProcessed = false;
         taskList.add(tt1);
        
        Task tt2=new task();
           tt2.OwnerId=userinfo.getuserid();
           tt2.Subject='test task';
           tt2.Status='Not Started';
           tt2.Priority='Normal';
           tt2.RecordTypeId=recordTypeID;
            tt2.CSR__c='Ambria Tibbs';
          tt2.Tax_Preparer__c='Christia Thompson';
          //  tt2.Tax_Advisors_Admin__c='Ashley Silafau-Sanitoa';
          tt2.Anderson_System_Stage__c='KMS - Delieverable Sent';
           taskTriggerHandler1.alreadyProcessed = false;
         taskList.add(tt2);
           
        insert taskList;

    }

}