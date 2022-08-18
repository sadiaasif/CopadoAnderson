public class HelpDeskClass {
    public case objcase{get;set;}
    public string Department{get;set;}
    public List<Attachment> caseAttachment{get;set;}
    public string casenumbers{get;set;}
  
    public Boolean redirectSFHelpdesk {public get; private set;}{redirectSFHelpdesk=True;}
     public Boolean redirectSFMarketinEventRequest {public get; private set;}{redirectSFMarketinEventRequest=False;}
     public Boolean redirectSFEventRequest {public get; private set;}{redirectSFEventRequest=false;}
    public Boolean redirectNewAffiliateOnboarding {public get; private set;}{redirectNewAffiliateOnboarding=false;}
    public Boolean redirectWebinarRequest  {public get; private set;}{redirectWebinarRequest=false;}
    public Boolean redirectFinishPage  {public get; private set;}{redirectFinishPage=false;}
      public Boolean redirectBlueprint {public get; private set;}{redirectBlueprint=false;}
      public Boolean redirectWebsite  {public get; private set;}{redirectWebsite=false;}
     public Boolean redirectOperatinHelpDesk  {public get; private set;}{redirectOperatinHelpDesk=false;}
     public Boolean casecreated  {public get; private set;}{casecreated=false;}
    public Id caseid{public get; private set;}
    
    public Blob fileBody{get;set;}  
    public string fileName{get;set;} 
    public Blob fileBody1{get;set;}
     public string fileName1{get;set;} 
    public Blob fileBody2{get;set;}
     public string fileName2{get;set;} 
    public Blob fileBody3{get;set;}
     public string fileName3{get;set;}
    
    //Marketing
    public string projectName{get;set;}
     public string projectTypes{get;set;}
     public string deptPaying{get;set;}
     public string projectDesc{get;set;}
     public string projectAudience{get;set;}
     public string projectValue{get;set;}
    public string projectInfo{get;set;}
    public string marketingcaseDetail{get;set;}    
    List<SelectOption> ProjectTypeoptions{get;set;}

//Events
	public string meetingType{get;set;}
public string OrganiztionName{get;set;}
    public string eventType{get;set;}
    public string eventVenueAddress{get;set;}
    public string eventcontactPerson {get;set;}
    public string contactEmailAddress {get;set;}
    public string contactPhoneNumber {get;set;}
     public string meetingDesc{get;set;}
      List<SelectOption> MeetingTypeOptions{get;set;}
      List<SelectOption> VenueAddress{get;set;}
    public Datetime eventStartDateChoice1{get;set;}
     public Datetime eventStartDateChoice2{get;set;}
     public Datetime eventEndDateChoice1{get;set;}
    public Datetime eventEndDateChoice2{get;set;}
     public string SchRecuringEvent{get;set;}
    public Integer noOfPeopleAttending{get;set;}
    public string roomSetup{get;set;}
    public string aVNeeds{get;set;}
     public string foodBeverageNeeds{get;set;}
     public string staffNeeds{get;set;}
    public string otherNeeds{get;set;}   
     public string advisorsList{get;set;} 
     public string speakersList{get;set;} 
     public string registrationRequirements{get;set;}
    public string Supplies{get;set;}
    public string comments{get;set;}
      List<SelectOption> roomSetupoption{get;set;}
     List<SelectOption> Avoption{get;set;}
     List<SelectOption> foodandBeverageoption{get;set;}
   List<SelectOption> staffNeedsOption{get;set;}
    List<SelectOption> registrationReqOption{get;set;}
    List<SelectOption> suppliesOption{get;set;}
    List<SelectOption> eventTypeOption{get;set;}    
    List<SelectOption> options{get;set;}
    
    //Salesforce support
     List<SelectOption> categoryOptions{get;set;}
    public string categoryChoice{get;set;}
    public boolean fileupload{get;set;}{fileupload=false;}
    public string othercampaignsource{get;set;}
     public string FileuploadDesc{get;set;}
    
    //Website
    List<SelectOption> categoryOptionsWeb{get;set;}
    public string categoryChoiceweb{get;set;}
    
    List<SelectOption> categoryOptionsopp{get;set;}
      public string categoryChoiceoperation{get;set;}

    
    //Affiliate
    public string affiliateName{get;set;}
    public string pcontactName{get;set;}
    public string pcontactEmail{get;set;}
    public string pcontactPhoneNumber{get;set;}
    public string billingContactName{get;set;}
    public string billingConEmail{get;set;}
    public string billingConPhoneNumber{get;set;}
    public string billingAffAddress1{get;set;}
    public string billingAffAddress2{get;set;}
    public string billingAffAddress3{get;set;}
    public string billingAffcity{get;set;}
    public string billingAffstate{get;set;}
    public string billingAffzip{get;set;}
    public string payoutPercent{get;set;}
    public string affOtherName{get;set;}
    public string affRealationship{get;set;}
    public string marketingTypes{get;set;}
    List<SelectOption> marketingTypesoptions{get;set;}
     List<SelectOption> cityoptions{get;set;}
    
    //Training
    public string webinarTitle{get;set;}
    public string webinarSpeaker{get;set;}
    public string webinarAudience{get;set;}
     public string platformType{get;set;}
     public Datetime recordingDueDate{get;set;}
    public Datetime SlidesDueDateDueDate{get;set;}
    public string intendedAudience {get;set;}
    public string bulletPoints{get;set;}
    public string summaryParagraph{get;set;}
      public string calltoAction{get;set;}
    public string specialOfferDetails{get;set;}
    public string offerType{get;set;}
      public Datetime OfferStartDate{get;set;}
    public Datetime OfferEndDate{get;set;}
     public string OfferTerms{get;set;}
     public string extraDetails{get;set;}
    public string selectedValue{get;set;}
     public string selectedValueid{get;set;}
     List<SelectOption> webinarAudienceoptions{get;set;}
     List<SelectOption> platformTypeoptions{get;set;}
    List<SelectOption> intendedAudienceoptions{get;set;}
    
   /* public Boolean getClassic(){
        return (UserInfo.getUIThemeDisplayed() =='Theme3' && ApexPages.currentPage().getParameters().get('beLightning') == null);
    }*/
    
    
     public HelpDeskClass(ApexPages.StandardController controller)
       
    {
        
        selectedValueid=ApexPages.currentPage().getParameters().get('Caseid');
        if( selectedValueid!=null){
            for(Case c:[Select CaseNumber from case where id=:selectedValueid limit 1 ]){
                selectedValue=c.CaseNumber;
            }
            
            casecreated=true;  
        }
       objcase = new case();
        caseAttachment =new List<Attachment>();
  
     
        
    }
    /* public pagereference redirecttohomepage(){
       // Pagereference pg;
         PageReference pageRef = new PageReference('/apex/HelpdeskthankyouPage');
            pageRef.setRedirect(true);
             pageRef.getparameters().put('Caseid',caseid);
          pageRef.getparameters().put('Casenumber',casenumber);
    return pageRef;
        }*/
    public pagereference onChangecategory(){
        if(categoryChoice=='Lead Upload'){
           fileupload=true;
               }else{
               fileupload=False;    
               }
        return null;
    }
    public pagereference onChangeDepartment(){
       // Pagereference pg;
        if(Department=='Marketing'){
            ApexPages.getMessages().clear();
          redirectSFHelpdesk=false;
            redirectSFMarketinEventRequest=true;
              redirectSFEventRequest=false;
            redirectNewAffiliateOnboarding=false;
            redirectWebinarRequest=false;
              redirectBlueprint =false;
            redirectWebsite  =false;
            redirectOperatinHelpDesk=false;
        }
        else if(Department=='Salesforce Support Request'){
            
           redirectSFHelpdesk=true;
             redirectSFMarketinEventRequest=false;
            redirectSFEventRequest=false;
             redirectNewAffiliateOnboarding=false;
            redirectWebinarRequest=false;
              redirectBlueprint =false;
            redirectWebsite  =false;
              redirectOperatinHelpDesk=false;
            
        }else if(Department=='Events'){
            
            redirectSFHelpdesk=false;
            redirectSFMarketinEventRequest=false;
            redirectSFEventRequest=True;
             redirectNewAffiliateOnboarding=false;
            redirectWebinarRequest=false;
            redirectOperatinHelpDesk=false;
              redirectBlueprint =false;
            redirectWebsite  =false;
        }
        else if(Department=='New Affiliate On-boarding'){
          
            redirectSFHelpdesk=false;
            redirectSFMarketinEventRequest=false;
            redirectSFEventRequest=false;
            redirectNewAffiliateOnboarding=true;
            redirectWebinarRequest=false;
             redirectOperatinHelpDesk=false;
              redirectBlueprint =false;
            redirectWebsite  =false;
            
        }else if(Department=='Training'){
          
             redirectWebinarRequest=true;
            redirectSFHelpdesk=false;
            redirectSFMarketinEventRequest=false;
            redirectSFEventRequest=false;
            redirectNewAffiliateOnboarding=false;
           
            redirectOperatinHelpDesk=false;
             redirectBlueprint =false;
            redirectWebsite  =false;
            
        }
        else if(Department=='Blueprint Software'){
         
 
            redirectBlueprint =True;
            redirectSFHelpdesk=false;
            redirectSFMarketinEventRequest=false;
            redirectSFEventRequest=false;
            redirectNewAffiliateOnboarding=false;
            redirectWebinarRequest=false;
            redirectWebsite  =false;
              redirectOperatinHelpDesk=false;
        }
        else if(Department=='Websites (Anderson, Intranet, Affiliate)'){
           
            redirectSFHelpdesk=false;
            redirectSFMarketinEventRequest=false;
            redirectSFEventRequest=false;
            redirectNewAffiliateOnboarding=false;
            redirectWebinarRequest=False;
            redirectOperatinHelpDesk=false;
            redirectWebsite  =true;
             redirectBlueprint =False;
        }
      else if(Department=='Operations Help Desk ticket'){
           redirectOperatinHelpDesk=True;
               redirectSFHelpdesk=false;
            redirectSFMarketinEventRequest=false;
              redirectSFEventRequest=false;
             redirectNewAffiliateOnboarding=false;
            redirectWebinarRequest=false;
          	redirectBlueprint =false;
            redirectWebsite  =false;
        }
        else{
            ApexPages.getMessages().clear();
               redirectSFHelpdesk=false;
            redirectSFMarketinEventRequest=false;
              redirectSFEventRequest=false;
             redirectNewAffiliateOnboarding=false;
            redirectWebinarRequest=false;
            redirectOperatinHelpDesk=false;
              redirectBlueprint =false;
            redirectWebsite  =false;
        }
         pageReference pr = Page.HelpDeskVf;
         pr.setRedirect(false);
        return pr ;
    } 
 
    public List<SelectOption> getdynamiclist() {
          options = new List<SelectOption>();
        options.add(new SelectOption('Salesforce Support Request','Salesforce Support Request'));
        options.add(new SelectOption('Websites (Anderson, Intranet, Affiliate)','Websites (Anderson, Intranet, Affiliate)'));
        options.add(new SelectOption('Blueprint Software','Blueprint Software'));
        options.add(new SelectOption('Operations Help Desk ticket','Operations Help Desk ticket'));
        options.add(new SelectOption('Events','Events'));
        options.add(new SelectOption('Marketing','Marketing'));
        options.add(new SelectOption('Training','Training'));
        options.add(new SelectOption('New Affiliate On-boarding','New Affiliate On-boarding'));
         
        
        
        return options;
    }
     public List<SelectOption> getwebinarAudiencelist() {
          webinarAudienceoptions = new List<SelectOption>();
        webinarAudienceoptions.add(new SelectOption('General Public','General Public'));
        webinarAudienceoptions.add(new SelectOption('Platinum Only','Platinum Only'));
        
        
        return webinarAudienceoptions;
    }
    
     public List<SelectOption> getcategorylist() {
          categoryOptions = new List<SelectOption>();
         categoryOptions.add(new SelectOption('--None--','--None--'));
        categoryOptions.add(new SelectOption('Field Update','Field Update'));
        categoryOptions.add(new SelectOption('Form Request','Form Request'));
         categoryOptions.add(new SelectOption('List Views','List Views'));
         categoryOptions.add(new SelectOption('Conga','Conga'));
         categoryOptions.add(new SelectOption('Page Layout Change','Page Layout Change'));
         categoryOptions.add(new SelectOption('Reports/Dashboards/Export','Reports/Dashboards/Export'));
         categoryOptions.add(new SelectOption('Salesforce Error','Salesforce Error'));
          categoryOptions.add(new SelectOption('Lead Upload','Lead Upload'));
         categoryOptions.add(new SelectOption('	Salesforce Other','	Salesforce Other'));
     
        return categoryOptions;
    }
    
      public List<SelectOption> getcategoryweblist() {
          categoryOptionsWeb = new List<SelectOption>();
        categoryOptionsWeb.add(new SelectOption('Web Page Error','Web Page Error'));
        categoryOptionsWeb.add(new SelectOption('Web Page Update','Web Page Update'));
         
     
        return categoryOptionsWeb;
    }
     public List<SelectOption> getcategoryopplist() {
          categoryOptionsopp = new List<SelectOption>();
          categoryOptionsopp.add(new SelectOption('--None--','--None--'));
        categoryOptionsopp.add(new SelectOption('Maintenance','Maintenance'));
        categoryOptionsopp.add(new SelectOption('Purchase Request','Purchase Request'));
           categoryOptionsopp.add(new SelectOption('Technical Support','Technical Support'));
          categoryOptionsopp.add(new SelectOption('Operations Other','Operations Other'));
         
     
        return categoryOptionsopp;
    }
    
     public List<SelectOption> getplatformTypelist() {
          platformTypeoptions = new List<SelectOption>();
        platformTypeoptions.add(new SelectOption('Webinar','Webinar'));
        platformTypeoptions.add(new SelectOption('Livestream','Livestream'));
       
        
        return platformTypeoptions;
    }
     public List<SelectOption> getintendedAudiencelist() {
          intendedAudienceoptions = new List<SelectOption>();
        intendedAudienceoptions.add(new SelectOption('Tax','Tax'));
        intendedAudienceoptions.add(new SelectOption('Real Estate Investor','Real Estate Investor'));
        intendedAudienceoptions.add(new SelectOption('Retirement','Retirement'));
        intendedAudienceoptions.add(new SelectOption('Wealth Management','Wealth Management'));
        intendedAudienceoptions.add(new SelectOption('Small Business','Small Business'));
        intendedAudienceoptions.add(new SelectOption('Stock','Stock'));
        
        return intendedAudienceoptions;
    }
     public List<SelectOption> getcitylist() {
         cityoptions=new List<SelectOption>();
        cityoptions.add(new SelectOption('Alabama','Alabama'));
	 cityoptions.add(new SelectOption('Alaska','Alaska'));
	cityoptions.add(new SelectOption('Arizona','Arizona'));
	cityoptions.add(new SelectOption('Arkansas','Arkansas'));
	cityoptions.add(new SelectOption('California','California'));
	cityoptions.add(new SelectOption('Colorado','Colorado'));
	cityoptions.add(new SelectOption('Connecticut','Connecticut'));
	cityoptions.add(new SelectOption('Delaware','Delaware'));
	cityoptions.add(new SelectOption('District Of Columbia','District Of Columbia'));
	cityoptions.add(new SelectOption('Florida','Florida'));
	cityoptions.add(new SelectOption('Georgia','Georgia'));
	cityoptions.add(new SelectOption('Hawaii','Hawaii'));
	cityoptions.add(new SelectOption('Idaho','Idaho'));
	cityoptions.add(new SelectOption('Illinois','Illinois'));
	cityoptions.add(new SelectOption('Indiana','Indiana'));
	cityoptions.add(new SelectOption('Iowa','Iowa'));
	cityoptions.add(new SelectOption('Kansas','Kansas'));
	cityoptions.add(new SelectOption('Kentucky','Kentucky'));
	cityoptions.add(new SelectOption('Louisiana','Louisiana'));
	cityoptions.add(new SelectOption('Maine','Maine'));
	cityoptions.add(new SelectOption('Maryland','Maryland'));
	cityoptions.add(new SelectOption('Massachusetts','Massachusetts'));
	cityoptions.add(new SelectOption('Michigan','Michigan'));
	cityoptions.add(new SelectOption('Minnesota','Minnesota'));
	cityoptions.add(new SelectOption('Mississippi','Mississippi'));
	cityoptions.add(new SelectOption('Missouri','Missouri'));
	cityoptions.add(new SelectOption('Montana','Montana'));
	cityoptions.add(new SelectOption('Nebraska','Nebraska'));
	cityoptions.add(new SelectOption('Nevada','Nevada'));
	cityoptions.add(new SelectOption('New Hampshire','New Hampshire'));
	cityoptions.add(new SelectOption('New Jersey','New Jersey'));
	cityoptions.add(new SelectOption('New Mexico','New Mexico'));
	cityoptions.add(new SelectOption('New York','New York'));
	cityoptions.add(new SelectOption('North Carolina','North Carolina'));
	cityoptions.add(new SelectOption('North Dakota','North Dakota'));
	cityoptions.add(new SelectOption('Ohio','Ohio'));
	cityoptions.add(new SelectOption('Oklahoma','Oklahoma'));
	cityoptions.add(new SelectOption('Oregon','Oregon'));
	cityoptions.add(new SelectOption('Pennsylvania','Pennsylvania'));
	cityoptions.add(new SelectOption('Rhode Island','Rhode Island'));
	cityoptions.add(new SelectOption('South Carolina','South Carolina'));
	cityoptions.add(new SelectOption('South Dakota','South Dakota'));
	cityoptions.add(new SelectOption('Tennessee','Tennessee'));
	cityoptions.add(new SelectOption('Texas','Texas'));
	cityoptions.add(new SelectOption('Utah','Utah'));
	cityoptions.add(new SelectOption('Vermont','Vermont'));
	cityoptions.add(new SelectOption('Virginia','Virginia'));
	cityoptions.add(new SelectOption('Washington','Washington'));
	cityoptions.add(new SelectOption('West Virginia','West Virginia'));
	cityoptions.add(new SelectOption('Wisconsin','Wisconsin'));
	cityoptions.add(new SelectOption('Wyoming','Wyoming'));
         cityoptions.add(new SelectOption('Armed Forces (the) Americas','Armed Forces (the) Americas'));
         cityoptions.add(new SelectOption('Armed Forces Europe','Armed Forces Europe'));
         cityoptions.add(new SelectOption('Armed Forces Pacific','Armed Forces Pacific'));
         cityoptions.add(new SelectOption('Army Post Office(U.S Army and U.S Air Force)','Army Post Office(U.S Army and U.S Air Force)'));
         cityoptions.add(new SelectOption('Fleet Post Office(U.S Navy and U.S. Marine Corps)','Fleet Post Office(U.S Navy and U.S. Marine Corps)'));
         
        
        return cityoptions;
    }
     public List<SelectOption> getmarketingTypesList() {
          marketingTypesoptions = new List<SelectOption>();
        marketingTypesoptions.add(new SelectOption('No Marketing Allow','No Marketing Allow'));
        marketingTypesoptions.add(new SelectOption('Okay to Send General Marketing','Okay to Send General Marketing'));
        marketingTypesoptions.add(new SelectOption('Needs Welcome email series','Needs Welcome email series'));
        marketingTypesoptions.add(new SelectOption('Do Not Call Leads','Do Not Call Leads'));
        marketingTypesoptions.add(new SelectOption('Okay to Call Leads','Okay to Call Leads'));
       
        return marketingTypesoptions;
       
    }
     public List<SelectOption> getVenueAddresses() {
         VenueAddress = new List<SelectOption>();
        VenueAddress.add(new SelectOption('Event Center (Summerlin)','Event Center (Summerlin)'));
        VenueAddress.add(new SelectOption('McLeod','McLeod'));
        VenueAddress.add(new SelectOption('Rainbow','Rainbow'));
        VenueAddress.add(new SelectOption('Tacoma','Tacoma'));
        VenueAddress.add(new SelectOption('Outside Venue','Outside Venue'));
       
        return VenueAddress;
    }
      public List<SelectOption> getMeetingTypes() {
         MeetingTypeOptions = new List<SelectOption>();
        MeetingTypeOptions.add(new SelectOption('Client Meeting(1:1)','Client Meeting(1:1)'));
        MeetingTypeOptions.add(new SelectOption('Internal(Staff)','Internal(Staff)'));
        MeetingTypeOptions.add(new SelectOption('Workshop(Class)','Workshop(Class)'));
          MeetingTypeOptions.add(new SelectOption('Other','Other'));
       
        return MeetingTypeOptions;
    }
     public List<SelectOption> getEventTypesList() {
         eventTypeOption = new List<SelectOption>();
        eventTypeOption.add(new SelectOption('In-House (Staff,Workshop,etc)','In-House (Staff,Workshop,etc)'));
        eventTypeOption.add(new SelectOption('Internal(Staff)','3rd Party or Affiliate (Elite,Vertucci,etc)'));
        eventTypeOption.add(new SelectOption('Networking (Vendor Shows,etc)','Networking (Vendor Shows,etc)'));

        return eventTypeOption;
    }
     public List<SelectOption> getProjectType() {
        ProjectTypeoptions = new List<SelectOption>(); 
        ProjectTypeoptions.add(new SelectOption('Print (brochures, packets, postcards)','Print (brochures, packets, postcards)')); 
        ProjectTypeoptions.add(new SelectOption('Web (websites, splash pages, analytics)','Web (websites, splash pages, analytics)')); 
        ProjectTypeoptions.add(new SelectOption('Social Media (Facebook, Twitter, LinkedIn, contests)','Social Media (Facebook, Twitter, LinkedIn, contests)')); 
         ProjectTypeoptions.add(new SelectOption('Advertising (newspapers, magazines, billboards, radio)','Advertising (newspapers, magazines, billboards, radio)')); 
         ProjectTypeoptions.add(new SelectOption('Photography','Photography')); 
          ProjectTypeoptions.add(new SelectOption('Video','Video')); 
        
         return ProjectTypeoptions; 
         
    }
       public List<SelectOption> getroomSetups() {
        roomSetupoption = new List<SelectOption>(); 
        roomSetupoption.add(new SelectOption('Classroom','Classroom')); 
        roomSetupoption.add(new SelectOption('U-Shaped','U-Shaped')); 
        roomSetupoption.add(new SelectOption('Theatre','Theatre')); 
         roomSetupoption.add(new SelectOption('Semi-Circle','Semi-Circle')); 
         roomSetupoption.add(new SelectOption('Hollow Square','Hollow Square')); 
          roomSetupoption.add(new SelectOption('Conference(Existing)','Conference(Existing)')); 
        
         return roomSetupoption; 
         
    }
        public List<SelectOption> getAvneedsList() {
        Avoption = new List<SelectOption>(); 
        roomSetupoption.add(new SelectOption('Projector & Screen (Only available in Event Center)','Projector & Screen (Only available in Event Center)')); 
        roomSetupoption.add(new SelectOption('Laptop / Surface or Tablet','Laptop / Surface or Tablet')); 
        roomSetupoption.add(new SelectOption('Microphone','Microphone')); 
        
        
         return roomSetupoption; 
         
    }
       public List<SelectOption> getFoodneedList() {
        foodandBeverageoption = new List<SelectOption>(); 
        foodandBeverageoption.add(new SelectOption('Food and Beverage Needs','Food and Beverage Needs')); 
        foodandBeverageoption.add(new SelectOption('Laptop / Surface or Tablet','Laptop / Surface or Tablet')); 
        foodandBeverageoption.add(new SelectOption('Coffee/Hot Water Carafes & Beverage Station','Coffee/Hot Water Carafes & Beverage Station')); 
            foodandBeverageoption.add(new SelectOption('Dry Snacks and Fruit','Dry Snacks and Fruit')); 
           foodandBeverageoption.add(new SelectOption('Other','Other')); 
        
        
         return foodandBeverageoption; 
         
    }
          public List<SelectOption> getstaffneedList() {
        staffNeedsOption = new List<SelectOption>(); 
        staffNeedsOption.add(new SelectOption('Event Planner Onsite','Event Planner Onsite')); 
        staffNeedsOption.add(new SelectOption('Staff Attendant Only','Staff Attendant Only')); 
        staffNeedsOption.add(new SelectOption('Advisors (If you would like to request specific advisors for your event, please list their names below)','Advisors (If you would like to request specific advisors for your event, please list their names below)')); 
            staffNeedsOption.add(new SelectOption('Speakers (If you are requesting a specific Partner or Trainer to speak at your event, please put your request in the box below)','Speakers (If you are requesting a specific Partner or Trainer to speak at your event, please put your request in the box below)')); 
         return staffNeedsOption; 
         
    }
          public List<SelectOption> getregistrationReqList() {
        registrationReqOption = new List<SelectOption>(); 
        registrationReqOption.add(new SelectOption('No registration','No registration')); 
        registrationReqOption.add(new SelectOption('Registration handle by outside party, Events, Etc.','Registration handle by outside party')); 
        registrationReqOption.add(new SelectOption('Registration required. (Please contact the Events department if you require event registration)','Registration required. (Please contact the Events department if you require event registration)')); 
         return registrationReqOption; 
         
    }
              public List<SelectOption> getSuppliesList() {
        suppliesOption = new List<SelectOption>(); 
        suppliesOption.add(new SelectOption('Anderson Folders with Strategy Qs, Etc.','Anderson Folders with Strategy Qs, Etc.')); 
        suppliesOption.add(new SelectOption('Sales Flyers - Tax Package, Platinum, Events, Etc.','SSales Flyers - Tax Package, Platinum, Events, Etc.')); 
        suppliesOption.add(new SelectOption('Tech - Laptop, Credit Card Processor, Wifi Hotspot','Tech - Laptop, Credit Card Processor, Wifi Hotspot')); 
            suppliesOption.add(new SelectOption('Books - Tax Wise, Asset Protection, Private Vault','Books - Tax Wise, Asset Protection, Private Vault')); 
              suppliesOption.add(new SelectOption('Other, Private Vault','Other')); 
         return suppliesOption; 
         
    }
      public pagereference save()
    	{
           // List<case> objcase=new List<Case>();
           //  objcase = new case();
          String eventCaseDetails;
            string aVneedscon='';
            string foodBeveragecon='';
            String staffcon='';
            String regreqcon='';
            string suppliescon='';
            String eventNeedscon;
            string advisorspeakerlistcon;
            string affinfocon;
            string contactInfoCon;
            String webinarDetailsCon;
             String offerDetailsCon;
            PageReference pageRef;
            String DescriptionNotes;
            QueueSObject QueueID = [Select Queue.Id, Queue.Name, Queue.Type from QueueSObject WHERE Queue.Type ='Queue' AND Queue.Name ='Salesforce Help Desk' Limit 1];
           Id QueID= [select id from queuesobject where queue.name='Salesforce Help Desk'].id;
              if((Department=='Salesforce Support Request' && categoryChoice!='Lead Upload')&&(objcase.Severity_Level__c==null  || objcase.Is_there_currently_a_workaround__c==null || objcase.Subject==null || objcase.Requested_Due_Date__c==null || objcase.How_many_users_are_impacted__c==null || categoryChoice=='--None--')){
                	
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Please fill out the required Fields!!!'));
                	
              }else if((Department=='Salesforce Support Request' && categoryChoice=='Lead Upload')&&(objcase.Severity_Level__c==null || FileuploadDesc==null || objcase.Main_Lead_Source__c==null || objcase.Requested_Due_Date__c==null ||fileBody3==null || objcase.Subject==null )){
                  
                  ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Please fill out the required Fields!!!'));
              }else if((Department=='Blueprint Software') &&(objcase.Severity_Level__c==null  || objcase.Is_there_currently_a_workaround__c==null || objcase.Subject==null || objcase.Requested_Due_Date__c==null || objcase.How_many_users_are_impacted__c==null)){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Please fill out the required Fields!!!'));
              }else if((Department=='Websites (Anderson, Intranet, Affiliate)') &&(objcase.Severity_Level__c==null  || objcase.Is_there_currently_a_workaround__c==null || objcase.Subject==null || objcase.Requested_Due_Date__c==null || objcase.How_many_users_are_impacted__c==null || objcase.Web_Error_URL_if_applicable__c==null)){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Please fill out the required Fields!!!'));
              }else if((Department=='Operations Help Desk ticket') &&(objcase.Severity_Level__c==null  || objcase.Is_there_currently_a_workaround__c==null || objcase.Subject==null || objcase.Requested_Due_Date__c==null ||  objcase.Description==null ||categoryChoiceoperation=='--None--')){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Please fill out the required Fields!!!'));
              }
            else{
              
                  
           
            if( Department=='Events'){
                Id EventsrecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByDeveloperName().get('Events').getRecordTypeId();
            objcase.RecordTypeId=EventsrecordTypeId; 
                 objcase.OwnerId='0050B000007YRjGQAW'; 
                
                 eventCaseDetails='Type of Meeting: '+meetingType+'<br/>';
                eventCaseDetails+='Name of orginization:  '+OrganiztionName+'<br/>';
                eventCaseDetails+='Event Type '+eventType+'<br/>';
                  eventCaseDetails+='Event Venue Address:  '+eventVenueAddress+'<br/>';
                eventCaseDetails+='Contact Email Address: '+contactEmailAddress  +'<br/>';
               eventCaseDetails+='Contact Phone Number:   '+contactPhoneNumber +'<br/>';
                 eventCaseDetails+='Program/Meeting description for online calendar of events:   '+meetingDesc +'<br/>';
                 eventCaseDetails+='Estimated number of people attending:   '+noOfPeopleAttending +'<br/>';
                eventCaseDetails+='Room Setup:'+roomSetup+'<br/>';
                 eventCaseDetails+='schedule a recurring event:'+SchRecuringEvent+'<br/>';
                
                objcase.Event_Case_Details__c=eventCaseDetails;
                objcase.Event_Start_Date_and_Time__c=eventStartDateChoice1;
                 objcase.Event_End_Date_And_Time__c=eventEndDateChoice1;
                 objcase.Event_End_Date_And_Time_Choice_2__c=eventStartDateChoice2;
                 objcase.Event_Start_Date_and_Time_choice_2__c=eventEndDateChoice2;
                
                aVneedscon=String.valueOf(aVNeeds);
                foodBeveragecon=String.valueOf(foodBeverageNeeds);
                staffcon=String.valueOf(registrationRequirements);
                regreqcon=String.valueOf(registrationRequirements);
                suppliescon=String.valueOf(Supplies);
             
               eventNeedscon='A/V Needs: Select Desired Equipment: '+ aVneedscon+'<br/>';
                eventNeedscon+='Food and Beverage Needs:  '+foodBeveragecon+'<br/>';
                eventNeedscon+='Staff Needs: '+staffcon+'<br/>';
                 eventNeedscon+='Registration Requirements:  '+regreqcon+'<br/>';
                 eventNeedscon+='Supplies, Equipment, Handouts:  '+suppliescon+'<br/>';
                 eventNeedscon+='List Other Food and Beverage Needs:  '+otherNeeds+'<br/>';
             objcase.Event_Needs__c=eventNeedscon;
                advisorspeakerlistcon='Advisors List:  '+advisorsList+'<br/>';
                 advisorspeakerlistcon+='Speakers List:  '+speakersList+'<br/>';
                objcase.Event__c=advisorspeakerlistcon;
                
            }
            else if(Department=='Salesforce Support Request'){
             Id HelpdesksrecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByDeveloperName().get('Help_Desk').getRecordTypeId();
                
                 objcase.RecordTypeId=HelpdesksrecordTypeId;
                If(categoryChoice=='List Views'||categoryChoice=='Reports/Dashboards/Export'||categoryChoice=='Field Update' || categoryChoice=='Lead Upload') {
                    if(QueueID.id   != null){
                      objcase.OwnerId=QueueID.Queue.Id;  
                    }
                  
                     //objcase.helpdesk_assigned_to__c='Sally Lee';
                     
                    if(categoryChoice=='Lead Upload'){
                       DescriptionNotes='Description: '+FileuploadDesc ;
                        DescriptionNotes+='          ';
                        DescriptionNotes+='Other Campaign Source: '+othercampaignsource ;
                        objcase.Description=DescriptionNotes;
                    }
                }else{
                         if(QueueID.id   != null){
                      objcase.OwnerId=QueueID.Queue.Id;  
                    }
                     objcase.helpdesk_assigned_to__c='Unassigned';
                   
                }
                objcase.Category__c=categoryChoice;
                
            } else if(Department=='Operations Help Desk ticket'){
             Id OperationsdesksrecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByDeveloperName().get('Operation_Help_Desk').getRecordTypeId();
                
                 objcase.RecordTypeId=OperationsdesksrecordTypeId;
          
                       if(QueueID.id   != null){
                      objcase.OwnerId=QueueID.Queue.Id;  
                    }
                objcase.Category__c=categoryChoice;
                
            }
             else if(Department=='Blueprint Software'){
                  Id HelpdesksrecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByDeveloperName().get('Help_Desk').getRecordTypeId();
                 objcase.RecordTypeId=HelpdesksrecordTypeId;
                 objcase.Category__c='Blueprint Software';
                        if(QueueID.id   != null){
                      objcase.OwnerId=QueueID.Queue.Id;  
                    }
                  objcase.helpdesk_assigned_to__c='Unassigned';
            }
              else if(Department=='Websites (Anderson, Intranet, Affiliate)'){
                    Id HelpdesksrecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByDeveloperName().get('Help_Desk').getRecordTypeId();
                 objcase.RecordTypeId=HelpdesksrecordTypeId;
                    objcase.Category__c=categoryChoiceweb;
                  if(QueueID.id   != null){
                      objcase.OwnerId=QueueID.Queue.Id;  
                    }
            }
            else if( Department=='Marketing'){
                Id MarketingsrecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByDeveloperName().get('Marketing').getRecordTypeId();
                objcase.RecordTypeId=MarketingsrecordTypeId;
                 objcase.OwnerId='0050B000007YRjGQAW'; 
                marketingcaseDetail='Project Type:'+projectTypes+ '<br/>';
                 marketingcaseDetail+='Department paying for this project:'+deptPaying+'<br/>';
                   marketingcaseDetail +=  'Project Description: '+projectDesc+'<br/>';
                marketingcaseDetail +=  'Project Audience: '+projectAudience+'<br/>';
                marketingcaseDetail +=  'Project Value: '+projectValue+'<br/>';
                marketingcaseDetail +=  'Other information: '+projectInfo+'<br/>';
                objcase.Marketing_Case_Details__c=marketingcaseDetail;
                
            }
              else if( Department=='New Affiliate On-boarding'){
                    Id AffrecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByDeveloperName().get('Affiliate_On_boarding').getRecordTypeId();
                objcase.RecordTypeId=AffrecordTypeId;
                 objcase.OwnerId='0050B000007YRjGQAW'; 
                affinfocon='Name of the Affiliate:'+affiliateName+ '<br/>';
                 affinfocon+='Billing Address for Affiliate:'+billingAffAddress1+' '+billingAffAddress2+' '+ billingAffAddress3+'<br/>';
                   affinfocon +=  'City : '+billingAffcity+'<br/>';
                affinfocon +=  'State: '+billingAffstate+'<br/>';
                affinfocon +=  'ZIP Code : '+billingAffzip+'<br/>';
                   affinfocon +=  'Payout % : '+payoutPercent+'<br/>';
                  affinfocon +=  'Other Names the Affiliate is Known By : '+affOtherName+'<br/>';
                   affinfocon +=  'Type of Affiliate Relationship : '+affRealationship+'<br/>';
                objcase.Affiliate_Details__c=affinfocon;
                  
                  contactInfoCon='Name of Primary Contact:'+pcontactName+ '<br/>';
                   contactInfoCon+='Primary Contact Phone Number:'+pcontactPhoneNumber+ '<br/>';
                   contactInfoCon+='Primary Contact Email:'+pcontactEmail+ '<br/>';
                  contactInfoCon+='Billing Contact:'+billingContactName+ '<br/>';
                   contactInfoCon+='Billing Contact Email:'+billingConEmail+ '<br/>';
                   contactInfoCon+='Billing Contact Phone Number:'+billingConPhoneNumber+ '<br/>';
                   contactInfoCon+='Marketing Types Allowed :'+marketingTypes+ '<br/>';
                 objcase.Primary_Contact_Details_AffOnboarding__c=contactInfoCon;
            }
             else if( Department=='Training'){
                  Id webrecordTypeId = Schema.SObjectType.case.getRecordTypeInfosByDeveloperName().get('Webinar').getRecordTypeId();
                objcase.RecordTypeId=webrecordTypeId;
                 objcase.OwnerId='005U0000003MP4pIAG'; 
                webinarDetailsCon='Title of Webinar:'+webinarTitle+ '<br/>';
                 webinarDetailsCon+='Webinar Speaker :'+webinarSpeaker+'<br/>';
                   webinarDetailsCon +=  'Webinar Audience : '+webinarAudience+'<br/>';
                webinarDetailsCon +=  'Type of Platform '+platformType+'<br/>';
                webinarDetailsCon +=  'Intended Audience  : '+intendedAudience +'<br/>';
                   webinarDetailsCon +=  'Bullet Points : '+bulletPoints+'<br/>';
                  webinarDetailsCon +=  'Summary Paragraph  : '+summaryParagraph+'<br/>';
                   webinarDetailsCon +=  'Call to Action  : '+calltoAction+'<br/>';
                objcase.Webinar_details__c=webinarDetailsCon;
                  
                  offerDetailsCon='Special Offer Details :'+specialOfferDetails+ '<br/>';
                   offerDetailsCon+='Offer Type :'+offerType+ '<br/>';
                   offerDetailsCon+='Offer Terms :'+OfferTerms+ '<br/>';
                  offerDetailsCon+='Extra Details:'+extraDetails+ '<br/>';
                   objcase.Webinar_Offer_details__c=offerDetailsCon;
                 objcase.Webinar_Offer_Start_Date__c=OfferStartDate;
                 objcase.Webinar_Offer_End_Date__c=OfferEndDate;
                 objcase.Webinar_Recording_Due_Date__c=recordingDueDate;
                 objcase.Webinar_Slides_Due_Date__c=SlidesDueDateDueDate;
              
            }
           try{
                insert objcase;
           }catch(DmlException e) {
    System.debug('The following exception has occurred: ' + e.getMessage());
}
        
         
        caseAttachment  = new List<Attachment>();
            Attachment attinsert=new Attachment();
             Attachment attinsert2=new Attachment();
             Attachment attinsert3=new Attachment();
                 Attachment attinsert4=new Attachment();
              Integer i=0;
           
                if(fileBody!=null){
 				attinsert.Body = fileBody; 
            attinsert.Name = fileName;  
                    attinsert.ParentId = objcase.id; 
                   caseAttachment.add(attinsert); 
            }
            if(fileBody1!=null){
                attinsert2.Body = fileBody1; 
              attinsert2.Name = fileName1 ;
                attinsert2.ParentId = objcase.id; 
                 caseAttachment.add(attinsert2); 
            }
            if(fileBody2!=null){
                attinsert3.Body = fileBody2; 
             attinsert3.Name = fileName2; 
                attinsert3.ParentId = objcase.id; 
                 caseAttachment.add(attinsert3); 
            }
                 if(fileBody3!=null){
                attinsert4.Body = fileBody3; 
             attinsert4.Name = fileName3; 
                attinsert4.ParentId = objcase.id; 
                 caseAttachment.add(attinsert4); 
            }
            //  att .clear();
               
            if(caseAttachment.size()>0){
                try{
              insert caseAttachment;   
               caseAttachment.clear();       
                }  catch(DmlException e) {
    System.debug('The following exception has occurred: ' + e.getMessage());
             
            }
            }
               redirectSFHelpdesk=false;
            redirectSFMarketinEventRequest=false;
              redirectSFEventRequest=false;
             redirectNewAffiliateOnboarding=false;
            redirectWebinarRequest=false;
              redirectBlueprint =false;
            redirectWebsite  =false;
           caseid=objcase.id;
                casenumbers=objcase.CaseNumber;
        pageRef = new PageReference('/apex/HelpdeskthankyouPage');
            pageRef.setRedirect(true);
               pageRef.getparameters().put('Caseid',caseid);
          pageRef.getparameters().put('Casenumber',casenumbers);
              
   
              }
            return pageRef;
    	}

}