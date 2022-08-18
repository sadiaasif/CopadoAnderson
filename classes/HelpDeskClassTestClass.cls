@isTest
public class HelpDeskClassTestClass {
      //Events
    static testmethod void CaseinserstEventsTEstClass(){
        List <Case> Cases=New List<Case>();
        
        Case ca=new Case();
  
        Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
        //insert Cases;
        //Events
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Events'; 
        testHelpDesk.onChangeDepartment();
        testHelpDesk.getMeetingTypes();
        testHelpDesk.meetingType='Client Meeting(1:1)';
        testHelpDesk.OrganiztionName='TEst Event';
        testHelpDesk.getEventTypesList();
        testHelpDesk.eventType='In-House (Staff,Workshop,etc)';
        testHelpDesk.getVenueAddresses();
        testHelpDesk.eventVenueAddress='Event Center (Summerlin)';
        testHelpDesk.eventcontactPerson='Test Name';
        testHelpDesk.contactEmailAddress='test@test.com';
        testHelpDesk.contactPhoneNumber='123456789';
         testHelpDesk.meetingDesc='This is a test';
        testHelpDesk.getroomSetups();
        testHelpDesk.roomSetup='Classroom';
          testHelpDesk.getAvneedsList();
        testHelpDesk.aVNeeds='Laptop / Surface or Tablet';
           testHelpDesk.getFoodneedList();
        testHelpDesk.foodBeverageNeeds='Dry Snacks and Fruit';
         testHelpDesk.getstaffneedList();
        testHelpDesk.staffNeeds='Staff Attendant Only';
        testHelpDesk.getregistrationReqList();
        testHelpDesk.registrationRequirements='No registration';
         testHelpDesk.getSuppliesList();
        testHelpDesk.Supplies='Sales Flyers - Tax Package, Platinum';
        testHelpDesk.comments='Testing---';
          testHelpDesk.fileName='Unit Test Attachment';
        testHelpDesk.fileBody=Blob.valueOf('Unit Test Attachment Body');
      
        testHelpDesk.save();
        
     
        Test.stopTest();
    }
      //Marketing
        
     static testmethod void CaseinserstMarketingTEstClass(){
        List <Case> Cases=New List<Case>();
        
        Case ca=new Case();
      
        Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
        //insert Cases;
      
      
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Marketing'; 
         testHelpDesk.onChangeDepartment();
        testHelpDesk.projectName='Test Project';
        testHelpDesk.getProjectType();
      testHelpDesk.projectTypes='Print (brochures, packets, postcards)';
        
        testHelpDesk.deptPaying='Sales';
        testHelpDesk.projectDesc='Promotion Test';
        testHelpDesk.projectAudience='Clients';
        testHelpDesk.projectValue='1000';
        testHelpDesk.projectInfo='Test info';
       
          testHelpDesk.fileName='Unit Test Attachment';
        testHelpDesk.fileBody=Blob.valueOf('Unit Test Attachment Body');
      
        testHelpDesk.save();
        
        Test.stopTest();
    }
     //training
  static testmethod void CaseinsersttrainingTEstClass(){
        List <Case> Cases=New List<Case>();
        
        Case ca=new Case();
     
        Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
        //insert Cases;
	 testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Training'; 
      testHelpDesk.onChangeDepartment();
        testHelpDesk.webinarTitle='Test Project';
      testHelpDesk.webinarSpeaker='TEst Speaker';
        testHelpDesk.getwebinarAudiencelist();
      testHelpDesk.webinarAudience='General Public';
        
        testHelpDesk.getplatformTypelist();
        testHelpDesk.platformType='Webinar';
        testHelpDesk.getintendedAudiencelist();
        testHelpDesk.webinarAudience='Tax';
       
       
          testHelpDesk.fileName='Unit Test Attachment';
        testHelpDesk.fileBody=Blob.valueOf('Unit Test Attachment Body');
      
        testHelpDesk.save();
        
        Test.stopTest();
    }
    
     //Affiliate Onboarding

    
     static testmethod void CaseinserstAffiliateTEstClass(){
        List <Case> Cases=New List<Case>();
        
        Case ca=new Case();
     
        Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
        //insert Cases;
      
               
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='New Affiliate On-boarding'; 
         testHelpDesk.onChangeDepartment();
        testHelpDesk.affiliateName='Test Affiliate';
      testHelpDesk.getcitylist();
        testHelpDesk.billingAffstate='Missouri';
      testHelpDesk.getmarketingTypesList();
        
        testHelpDesk.marketingTypes='No Marketing Allow';
      
          testHelpDesk.fileName='Unit Test Attachment';
        testHelpDesk.fileBody=Blob.valueOf('Unit Test Attachment Body');
         testHelpDesk.fileName1='Unit Test Attachment1';
        testHelpDesk.fileBody1=Blob.valueOf('Unit Test Attachment Body1');
         testHelpDesk.fileName2='Unit Test Attachment1';
        testHelpDesk.fileBody2=Blob.valueOf('Unit Test Attachment Body2');
      
        testHelpDesk.save();
        
        Test.stopTest();
    }
  
     // Salesforce Support
    static testmethod void CaseinserstSalesforceTEstClass(){
        List <Case> Cases=New List<Case>();
        
        Case ca=new Case();
       
        
       
        
       
        Test.startTest();
        
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk  = new HelpDeskClass(sc);
        //insert Cases;
      
      
        
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Salesforce Support Request'; 
        testHelpDesk.onChangeDepartment();
        testHelpDesk.getcategorylist();
        testHelpDesk.categoryChoice='Field Update';
         testHelpDesk.onChangecategory();
     
     
          testHelpDesk.fileName='Unit Test Attachment';
        testHelpDesk.fileBody=Blob.valueOf('Unit Test Attachment Body');
        
        testHelpDesk.save();
        
        Test.stopTest();
    }
    
    //file upload
    
      static testmethod void CaseinserstSalesforcefileuploadcateTEstClass(){
        List <Case> Cases=New List<Case>();
        
        Case ca=new Case();
       
       
       
        
       
        Test.startTest();
        
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk  = new HelpDeskClass(sc);
        //insert Cases;
      
      
        
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Salesforce Support Request'; 
        testHelpDesk.onChangeDepartment();
        testHelpDesk.getcategorylist();
        testHelpDesk.categoryChoice='Lead Upload';
          testHelpDesk.onChangecategory();
           testHelpDesk.objcase.Severity_Level__c='Level 3 - High';
       
          testHelpDesk.objcase.Requested_Due_Date__c=system.today();
         testHelpDesk.objcase.Is_there_currently_a_workaround__c='Yes';
         testHelpDesk.objcase.How_many_users_are_impacted__c=2;
         testHelpDesk.objcase.Category__c='Field Update';
         testHelpDesk.objcase.Web_Error_URL_if_applicable__c='Test Salesforce Support';
         testHelpDesk.objcase.Subject='Test Salesforce Support';
       
     
          testHelpDesk.fileName='Unit Test Attachment';
        testHelpDesk.fileBody=Blob.valueOf('Unit Test Attachment Body');
        
        testHelpDesk.save();
        
        Test.stopTest();
    }
    
    
     static testmethod void CaseinserstSalesforcecaseownerTEstClass(){
        List <Case> Cases=New List<Case>();
        
        Case ca=new Case();
     
        Test.startTest();
        
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk  = new HelpDeskClass(sc);
     
        
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Salesforce Support Request'; 
        testHelpDesk.onChangeDepartment();
        testHelpDesk.getcategorylist();
           testHelpDesk.objcase.Severity_Level__c='Level 3 - High';
        testHelpDesk.categoryChoice='Form Request';
         testHelpDesk.onChangecategory();
        
       testHelpDesk.objcase.Requested_Due_Date__c=System.today();
          testHelpDesk.objcase.How_many_users_are_impacted__c=3;
      testHelpDesk.objcase.Is_there_currently_a_workaround__c='Yes';
         testHelpDesk.objcase.Subject='Test Salesforce Support';
         
        
        testHelpDesk.save();
        
        Test.stopTest();
    }
    
     //Blueprint Support
     static testmethod void CaseinserstBlueprintTEstClass(){
        List <Case> Cases=New List<Case>();
        
        Case ca=new Case();
       
        


        //Cases.add(ca);
        
    
        Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
        //insert Cases;
    
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Blueprint Software'; 
         testHelpDesk.onChangeDepartment();
                testHelpDesk.objcase.Severity_Level__c='Level 3 - High';
      
        testHelpDesk.objcase.Is_there_currently_a_workaround__c='Yes';
        testHelpDesk.objcase.How_many_users_are_impacted__c=3;
        testHelpDesk.objcase.Category__c='Blueprint Software';
        testHelpDesk.objcase.Web_Error_URL_if_applicable__c='Test Website Support';
        testHelpDesk.objcase.Subject='Test Website Support';
       testHelpDesk.objcase.Requested_Due_Date__c=System.today();
          testHelpDesk.fileName='Unit Test Attachment';
        testHelpDesk.fileBody=Blob.valueOf('Unit Test Attachment Body');
         testHelpDesk.fileName1='Unit Test Attachment1';
        testHelpDesk.fileBody1=Blob.valueOf('Unit Test Attachment Body1');
         testHelpDesk.fileName2='Unit Test Attachment1';
        testHelpDesk.fileBody2=Blob.valueOf('Unit Test Attachment Body2');
         
      
        testHelpDesk.save();
      
         testHelpDesk.Department='Blueprint Software'; 
            testHelpDesk.onChangeDepartment();
                testHelpDesk.objcase.Severity_Level__c=null;
      
        testHelpDesk.objcase.Is_there_currently_a_workaround__c=null;
        testHelpDesk.objcase.How_many_users_are_impacted__c=3;
        testHelpDesk.objcase.Category__c='Blueprint Software';
        testHelpDesk.objcase.Web_Error_URL_if_applicable__c='Test Website Support';
        testHelpDesk.objcase.Subject='Test Website Support';
          testHelpDesk.save();
        Test.stopTest();
    }
    
     //Website Support
       static testmethod void CaseinserstWebsiteTEstClass(){
        List <Case> Cases=New List<Case>();
          
        
        Case ca=new Case();
       ID Caseid;
        String Recordtype;
    
         Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
        //insert Cases;
      testHelpDesk.getcategoryweblist();
          
      
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Websites (Anderson, Intranet, Affiliate)'; 
           testHelpDesk.onChangeDepartment();
    	testHelpDesk.getcategorylist();
     	testHelpDesk.objcase.Severity_Level__c='Level 3 - High';
       	testHelpDesk.objcase.Is_there_currently_a_workaround__c='Yes';
         testHelpDesk.objcase.How_many_users_are_impacted__c=3;
       testHelpDesk.objcase.Requested_Due_Date__c=System.today();
        testHelpDesk.objcase.Web_Error_URL_if_applicable__c='Test Website Support';
         testHelpDesk.objcase.Subject='Test Website Support';
       testHelpDesk.categoryChoiceweb='Web Page Error'; 
          testHelpDesk.fileName='Unit Test Attachment';
        testHelpDesk.fileBody=Blob.valueOf('Unit Test Attachment Body');
        
        testHelpDesk.save();
           for(Case c:[select id,RecordTypeId from case ]){
               Caseid=c.id;
              Recordtype=c.RecordTypeId;
            Cases.add(c);
            }
         
System.assertEquals('0120B000000NAE1QAO', Recordtype, 'Not Updated!!!Please check!!!') ;
             PageReference pageRef = new PageReference('/apex/HelpdeskthankyouPage');
          
  pageRef.getParameters().put('Caseid', String.valueOf(Caseid));
  Test.setCurrentPage(pageRef);
ApexPages.StandardController sc1 = new ApexPages.StandardController(ca);
              HelpDeskClass testHelpDesk2 = new HelpDeskClass(sc1);

            testHelpDesk.getdynamiclist();
        testHelpDesk.Department=''; 
           testHelpDesk.onChangeDepartment();
          // testHelpDesk.redirecttohomepage();
        Test.stopTest();
    }
    
    static testmethod void CaseinserstLeadupload(){
        List <Case> Cases=New List<Case>();
            ID caseid;
        
        Case ca=new Case();
       
        
     Campaign cam=new campaign();
           cam.Name='Elite Legacy - February 2019 Leads';
           insert cam;
      
           
        Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
              
       
        //insert Cases;
     
      
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Salesforce Support Request'; 
           testHelpDesk.onChangeDepartment();
    testHelpDesk.getcategorylist();
       
       
         testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Salesforce Support Request'; 
           testHelpDesk.onChangeDepartment();
    testHelpDesk.getcategorylist();
         testHelpDesk.objcase.Severity_Level__c='Level 2 - Urgent';
      
       
        testHelpDesk.objcase.Description='Test';
        testHelpDesk.objcase.Main_Lead_Source__c='Affiliate';
        testHelpDesk.objcase.Original_Campaign_Source__c=cam.Id;
        testHelpDesk.objcase.Requested_Due_Date__c=System.today();
          testHelpDesk.getcategorylist();
         testHelpDesk.categoryChoice='Lead Upload'; 
                  testHelpDesk.fileName3='Test';
        testHelpDesk.fileBody3=Blob.valueOf('Test');
         
        testHelpDesk.save();
          

        Test.stopTest();
    }
    
    // Error Message
    
        static testmethod void CaseinserstErrorMessage(){
        List <Case> Cases=New List<Case>();
            ID caseid;
        
        Case ca=new Case();
       
        
    
      
           
        Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
              
         testHelpDesk.objcase.Severity_Level__c='Level 3 - High';
      
        testHelpDesk.objcase.Is_there_currently_a_workaround__c='Yes';
        testHelpDesk.objcase.How_many_users_are_impacted__c=3;
        testHelpDesk.objcase.Category__c='Platinum';
        testHelpDesk.objcase.Web_Error_URL_if_applicable__c='Test Website Support';
        testHelpDesk.objcase.Subject='Test Website Support';
        
        //insert Cases;
      testHelpDesk.getcategoryweblist();
         testHelpDesk.categoryChoiceweb='Web Page Error';  
      
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Websites (Anderson, Intranet, Affiliate)'; 
           testHelpDesk.onChangeDepartment();
    testHelpDesk.getcategorylist();
        testHelpDesk.categoryChoice='Field Update';
       
        testHelpDesk.save();
        

                   

        Test.stopTest();
    }
          static testmethod void CaseinserstErrorMessageDML(){
        List <Case> Cases=New List<Case>();
            ID caseid;
        
        Case ca=new Case();
       
        
    
      
           
        Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
              
       
        //insert Cases;
     
      
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Websites (Anderson, Intranet, Affiliate)'; 
           testHelpDesk.onChangeDepartment();
    testHelpDesk.getcategorylist();
         testHelpDesk.objcase.Severity_Level__c='Level 3 - High';
      
        testHelpDesk.objcase.Is_there_currently_a_workaround__c='Yes';
        testHelpDesk.objcase.How_many_users_are_impacted__c=3;
      
                testHelpDesk.objcase.Requested_Due_Date__c=System.today();
        testHelpDesk.objcase.Web_Error_URL_if_applicable__c='Test Website Support';
        testHelpDesk.objcase.Subject='Test Website Support';
          testHelpDesk.getcategoryweblist();
         testHelpDesk.categoryChoiceweb='Web123'; 
                 testHelpDesk.fileName='';
        testHelpDesk.fileBody=Blob.valueOf('');
         testHelpDesk.fileName1='';
        testHelpDesk.fileBody1=Blob.valueOf('');
         testHelpDesk.fileName2='';
        testHelpDesk.fileBody2=Blob.valueOf('');
        testHelpDesk.save();
       
      
          

        Test.stopTest();
    }
      static testmethod void CaseinserstErrorMessagefieldsDML(){
        List <Case> Cases=New List<Case>();
            ID caseid;
        
        Case ca=new Case();
       
        
    
      
           
        Test.startTest();
          ApexPages.StandardController sc = new ApexPages.StandardController(ca);
        HelpDeskClass testHelpDesk = new HelpDeskClass(sc);
              
       
        //insert Cases;
     
      
        testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Salesforce Support Request'; 
           testHelpDesk.onChangeDepartment();
    testHelpDesk.getcategorylist();
         testHelpDesk.objcase.Severity_Level__c=null;
      
        testHelpDesk.objcase.Is_there_currently_a_workaround__c=null;
        testHelpDesk.objcase.How_many_users_are_impacted__c=3;
        testHelpDesk.objcase.Category__c='Platinum';
        testHelpDesk.objcase.Web_Error_URL_if_applicable__c='Test salesforce Support';
        testHelpDesk.objcase.Subject='Test salesforce Support';
          testHelpDesk.getcategorylist();
         testHelpDesk.categoryChoice='Salesforce Error'; 
                 
        testHelpDesk.save();
       
         testHelpDesk.getdynamiclist();
        testHelpDesk.Department='Salesforce Support Request'; 
           testHelpDesk.onChangeDepartment();
    testHelpDesk.getcategorylist();
         testHelpDesk.objcase.Severity_Level__c=null;
      
        testHelpDesk.objcase.Severity_Level__c=null;
        testHelpDesk.objcase.Description=null;
        testHelpDesk.objcase.Main_Lead_Source__c=null;
        testHelpDesk.objcase.Original_Campaign_Source__c=null;
        testHelpDesk.objcase.Requested_Due_Date__c=null;
          testHelpDesk.getcategorylist();
         testHelpDesk.categoryChoice='Lead Upload'; 
                  testHelpDesk.fileName3='';
        testHelpDesk.fileBody3=Blob.valueOf('');
         
        testHelpDesk.save();
          

        Test.stopTest();
    }
}