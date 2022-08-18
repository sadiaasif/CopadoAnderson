global class ClientStrategyPageCtrl {
 /*@AuraEnabled
   public static List<Contact> getContacts(Id accId) {
        return [Select Id, Name, Email, Phone,Account_Roles__c From Contact where AccountId=:accId ];
    }
     @AuraEnabled
    public static List<Entities__c> getEntities(Id accId) {
        return [Select Id, Name, Status__c,Tax_Status__c,Disregarded_To__c,Organization_State__c,Federal_Return__c,Organizational_Date__c,EIN__c,Year_End__c,Date_Shipped_Formula__c From Entities__c where Primary_Client__c=:accId ];
    }*/
  
      @AuraEnabled
    public static List<String> getClientSales(Id accId) {
List <string> ClientSales=new List<String>();
List<opportunity> oppSalesList=[Select id,Name,RecordTypeID,RecordType.Name,StageName,Titanium__c From Opportunity where AccountId=:accId  ]; 
        List<Entities__C> oppEntitiesList=[Select id,Name,RecordTypeID,RecordType.Name From Entities__C where Primary_Client__c=:accId  ];
         List<Case> caseList=[Select Id, subject,status,CAM__c,Accounting_Coordinator__c From Case where AccountId=:accId and subject like 'Complaint %'];
        for(opportunity opp:oppSalesList){
            if(opp.RecordType.Name=='Tax Compliance' && opp.StageName=='Closed Won'){
                ClientSales.add('TaxClient');
            }
              if((opp.RecordType.Name=='Bookkeeping'|| opp.RecordType.Name=='Bookkeeping Subscription') && opp.StageName=='Closed Won' ){
                ClientSales.add('BookkeepingClient');
            }
            if(opp.RecordType.Name=='Platinum Subscription' && opp.StageName=='Closed Won'){
                  ClientSales.add('Platinum');
            }
             if(opp.Titanium__c>=1 && opp.StageName=='Closed Won'){
                  ClientSales.add('Titanium');
            }

        }
        for(Entities__C en:oppEntitiesList){
            if(en.RecordType.Name=='Land Trust'){
                 ClientSales.add('HasLandTrust');
            }
              if(en.RecordType.Name=='Living Trust'){
                 ClientSales.add('HasLivingTrust');
            }
        }
        if(caseList.size()>0){
             ClientSales.add('HasComplaint');
        }
        return ClientSales;
            
    }
     @AuraEnabled
    public static List<Opportunity> getEFSalesRecord(Id accId) {
          Id devoppEFSalesRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
       
      
    
        return [Select id,Name,RecordType.Name,Status__c,StageName,CloseDate,Probability,pymt__Total_Amount__c,pymt__Balance__c,Entity__c,Entity__r.Name,OwnerId,Owner.name,Sales_Rep__c,Sales_Rep__r.Name From Opportunity where AccountId=:accId and RecordTypeId =: devoppEFSalesRecordTypeId and StageName='Fulfillment/Partial Payment' ];
    }
       @AuraEnabled
    public static List<contact> getPrimaryContact(Id accId) {
		String Primarycontactname=''; 
       
      
    
     List<Contact> PrirmaryContactofacc = [select id,Name,Gender__c,Birthdate,Legal_Marital_Status__c,Age__c from contact where AccountId=:accId and Account_Roles__c='Primary Contact' limit 1]; 
        for(contact c:PrirmaryContactofacc){
            Primarycontactname=c.Name;
        }
        return PrirmaryContactofacc;
    }
      @AuraEnabled
    public static  List<contact> getPrimaryContactspouse(Id accId) {
		String Primarycontactspousename=''; 
       
      
    
     List<Contact> PrirmaryContactspouseofacc = [select id,Name,Gender__c from contact where AccountId=:accId and Account_Roles__c='Primary Contact Spouse' limit 1]; 
        for(contact c:PrirmaryContactspouseofacc){
            Primarycontactspousename=c.Name;
        }
        return PrirmaryContactspouseofacc;
    }
     @AuraEnabled
    public static Double getTotalValueofTaxSales(Id accId) {
    Id devoppTaxRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Tax Compliance').getRecordTypeId();
        Double TotalTaxSale=0;
     aggregateresult[] oppTaxSalesvalue=[Select SUM(Amount) TotalTaxsale From Opportunity where AccountId=:accId and RecordTypeID=:devoppTaxRecordTypeId ]; 
     TotalTaxSale=double.valueof(oppTaxSalesvalue[0].get('TotalTaxsale'));
        
        return TotalTaxSale;
            
    }
      @AuraEnabled
    public static Double getTotalValueofBKSales(Id accId) {
    Id devoppBookkeepingRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Id devoppBkSubRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping Subscription').getRecordTypeId();
        Double TotalBKSale=0;
     aggregateresult[] oppBkSalesvalue=[Select SUM(Amount) TotalBksale From Opportunity where AccountId=:accId and (RecordTypeID=:devoppBookkeepingRecordTypeId or RecordTypeID=:devoppBkSubRecordTypeId) ]; 
     TotalBKSale=double.valueof(oppBkSalesvalue[0].get('TotalBksale'));
        
        return TotalBKSale;
            
    }
        @AuraEnabled
    public static Double getTotalValueofSales(Id accId) {
    
        Double TotalSale=0;
     account[] oppSalesvalue=[Select Total_Value_of_All_Sales__c  From account where id=:accId limit 1]; 
        if(oppSalesvalue!=null){
         Totalsale=oppSalesvalue[0].Total_Value_of_All_Sales__c;
        }
     
        
        return TotalSale;
            
    }
   
      
 
        @AuraEnabled
    public static List<task> getAdvisorcalltasks(Id accId) {
       Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
     
       Id AdvisorAdminProfileID=[Select Id,name from profile where name='Advisor Admin - Community' limit 1].id;
       Id AdvisorManagerProfileID=[Select Id,name from profile where name='Advisor - Community' limit 1].id;
        
        set<id> adjobroleuserid=new set<id>();
        for (user u:[Select id,Name,Job_Role__c from user where Job_Role__c = 'Advisor Admin']){
            adjobroleuserid.add(u.id);
        }
         
        return [Select Id,Subject, OwnerId,Owner.Name,Priority,ActivityDate,WhoId,What.Name,LastModifiedDate,WhatId,Status,Summary__c,Days_Since_Last_Modified__c From task 
        where (whatID=:accId or accountId =:accid or client__c=:accId) and RecordTypeID=:devoppcallRecordTypeId and (NOT subject Like 'Email: >>%') 
        and (owner.ProfileID =:AdvisorAdminProfileID or owner.ProfileID =:AdvisorManagerProfileID  or ownerId In:adjobroleuserid ) ];
    }


    @AuraEnabled
    public static List<task> getServicecalltasks(Id accId) {
       
          Id devoppservicecallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
           Id serviceProfileID=[Select Id,name from profile where name='Service - Community' limit 1].id;
        Id serviceMangerProfileID=[Select Id,name from profile where name='Service - LEX' limit 1].id;
        
          set<id> Servicejobroleuserid=new set<id>();
        for (user u:[Select id,Name,Job_Role__c from user where Job_Role__c = 'Service']){
            Servicejobroleuserid.add(u.id);
        }
        
         
        return [Select Id,Subject, OwnerId,owner.Name,Priority,ActivityDate,WhoId,What.Name,LastModifiedDate,WhatId,Status,Summary__c,Days_Since_Last_Modified__c From task where whatID=:accId  and RecordTypeID=:devoppservicecallRecordTypeId and (NOT subject Like 'Email: >>%') and (owner.ProfileID =:serviceProfileID or owner.ProfileID =:serviceMangerProfileID or ownerId In:Servicejobroleuserid )];
    }
     /*  @AuraEnabled
  public static List<Bookkeeping__c> getBookkeepingRecord(Id accId) {
   //     return [Select Id, Name, Entity__c,Entity_Type__c,Case__c,BK_Stage__c,Bookkeeper__c,Jr_Bookkeeper__c, LastModifiedDate ,Updated_Bookkeeping_Company_Wide_Notes__c,Updated_Bookkeeping_Internal_Notes__c From Bookkeeping__c where Client_Name__c=:accId ];
    }*/
    
      @AuraEnabled
    public static List<Opportunity> getsalePlatinumSalesRecord(Id accId) {
          Id devoppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
        set<ID> platinumRecordtype=new Set<ID>();
     
      
    
        return [Select id,Name,RecordType.Name,Status__c,StageName,CloseDate,Probability,pymt__Total_Amount__c,pymt__Balance__c,Entity__c,Entity__r.Name,OwnerId,Owner.name,Sales_Rep__c,Sales_Rep__r.Name From Opportunity where AccountId=:accId and RecordTypeId =: devoppRecordTypeId ];
    }
      @AuraEnabled
    public static List<Opportunity> getRenewalSalesRecord(Id accId) {
          Id devoppstateRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
          Id devoppStdRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
          Id devoppPenRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
    
     
      
    
        return [Select id,Name,RecordType.Name,Status__c,StageName,CloseDate,Probability,pymt__Total_Amount__c,pymt__Balance__c,Entity__c,Entity__r.Name,OwnerId,Owner.name,Sales_Rep__c,Sales_Rep__r.Name From Opportunity where AccountId=:accId and (RecordTypeId =: devoppstateRRecordTypeId or RecordTypeId =:devoppStdRRecordTypeId or RecordTypeId =:devoppPenRRecordTypeId ) and StageName='Fulfillment/Partial Payment' and CloseDate=Next_N_DAYS:30 ];
    }
      @AuraEnabled
    public static List<Opportunity> getsaleFillingFeeSalesRecord(Id accId) {
          Id devoppEntityFormRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        set<ID> platinumRecordtype=new Set<ID>();
     
      
    
        return [Select id,Name,RecordType.Name,Status__c,StageName,CloseDate,Probability,pymt__Total_Amount__c,pymt__Balance__c,Entity__c,Entity__r.Name,OwnerId,Owner.name,Sales_Rep__c,Sales_Rep__r.Name From Opportunity where AccountId=:accId and RecordTypeId =: devoppEntityFormRecordTypeId and ChargentSFA__Balance_Due__c>0 and Total_Filing_Fees__c!=0 and Filing_Fees_Audit__c=True and StageName!='Closed Lost' ];
    }
       @AuraEnabled
    public static List<H2S__HarvestProject__c> getProjectsNotArchived(Id accId) {
      
    
        return [Select id,Name,H2S__HarvestProjectID__c,Package_Burn__c,H2S__ProjectCode__c,H2S__TotalProjectFees__c,Package_Hours_Used__c,Remaining_Project_Amount__c,H2S__DaysSinceTimeLastLogged__c From H2S__HarvestProject__c where H2S__Account__c=:accId and Package_Burnpercent__c<90  ];
    }
          @AuraEnabled
    public static List<Opportunity> getTaxSalesRecord(Id accId) {
          Id devoppTaxRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Tax Compliance').getRecordTypeId();
       
      
    
        return [Select id,Name,RecordType.Name,Status__c,StageName,CloseDate,Probability,pymt__Total_Amount__c,pymt__Balance__c,Entity__c,Entity__r.Name,OwnerId,Owner.name,Sales_Rep__c,Sales_Rep__r.Name From Opportunity where AccountId=:accId and RecordTypeId =: devoppTaxRecordTypeId and StageName='Closed Won'  and CloseDate=Last_N_DAYS:30 ];
    }
  
      @AuraEnabled
    public static List<Refund__c> getRefundRecord(Id accId) {
          
       
      

        return [Select id,Name,Status__c,Sale__c,Sale__r.Name,CreatedDate,LastModifiedDate,Amount_to_be_refunded__c,OwnerId,Owner.Name From Refund__c where Client__c=:accId and CreatedDate =Last_N_DAYS:90  ];
    }
       @AuraEnabled
    public static List<Entities__c> getEntitieswithTaxreturn(Id accId) {
          
       
      

        return [Select Id, Name, Status__c,Tax_Status__c,Tax_Return_Required__c,Tax_Form__c,Tax_Year_Ended__c,Year_End__c,Year_End_Month__c,Year_End_Selected__c,Tax_Matter_Representative__c,Federal_Return__c,X5500_Due_Date__c,State_Return_Due_Date__c,Disregarded_To__c,Disregarded_To__r.Name,Disregarded_To_Personal__c,Disregarded_To_Personal__r.Name,Organization_State__c,Organizational_Date__c From Entities__c where Primary_Client__c=:accId and (Tax_Return_Required__c=true or Tax_Form__c!=null ) ];
    }
       @AuraEnabled
    public static List<Entities__c> getslectedEntitieswithTaxreturn(Id accId,string selected) {
        if(selected=='All'){
            return [Select Id, Name, Status__c,Tax_Status__c,Tax_Return_Required__c,Tax_Form__c,Tax_Year_Ended__c,Year_End__c,Year_End_Month__c,Year_End_Selected__c,Tax_Matter_Representative__c,Federal_Return__c,X5500_Due_Date__c,State_Return_Due_Date__c,Disregarded_To__c,Disregarded_To__r.Name,Disregarded_To_Personal__c,Disregarded_To_Personal__r.Name From Entities__c where Primary_Client__c=:accId  and (Tax_Return_Required__c=true or Tax_Form__c!=null ) ];    
        }else{
            return [Select Id, Name, Status__c,Tax_Status__c,Tax_Return_Required__c,Tax_Form__c,Tax_Year_Ended__c,Year_End__c,Year_End_Month__c,Year_End_Selected__c,Tax_Matter_Representative__c,Federal_Return__c,X5500_Due_Date__c,State_Return_Due_Date__c,Disregarded_To__c,Disregarded_To__r.Name,Disregarded_To_Personal__c,Disregarded_To_Personal__r.Name From Entities__c where Primary_Client__c=:accId and name=:selected and  (Tax_Return_Required__c=true or Tax_Form__c!=null ) ];    
            
        }

        
    }
       @AuraEnabled
    public static List<string> getEntitieswithTaxNamePicklict(Id accId) {
          
        List<String> EnNameoptions = new List<String>();
      

        List<Entities__c> EnwithTaxreturn=[Select Id, Name  From Entities__c where Primary_Client__c=:accId and (Tax_Return_Required__c=true or Tax_Form__c!=null )];
        for(Entities__c en: EnwithTaxreturn){
            EnNameoptions.add(en.name);
            
        }
        return EnNameoptions;
    }
           @AuraEnabled
    public static Map<String, String> getNotesTypepicklist() {
          
     Map<String, String> NotesTypeoptions = new Map<String, String>();
       
        Schema.DescribeFieldResult NotesTypeValue = Note__c.Notes_Type__c.getDescribe();
       
        List<Schema.PicklistEntry> pList = NotesTypeValue.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
       
            NotesTypeoptions.put(p.getValue(), p.getLabel());
        }
        return NotesTypeoptions;
    }
      @AuraEnabled
    public static List<Set_of_Books__c> getsetofbooks(Id accId) {
          
       
      

        return [Select Id, Name,Bookkeeper__c,Bookkeeping_Reviewer__c,Sent_To_Tax__c,Extension_Filed__c,Return_Filed__c,YTD_Earnings__c From Set_of_Books__c where Client__c=:accId ];
    }
     @AuraEnabled
    public static List<Strategy_Session_Questionnaire__c> getsetSSQ(Id accId) {
   
        return [Select Id, Name From Strategy_Session_Questionnaire__c where Account_Lookup__c=:accId ];
    }
       @AuraEnabled
    public static Boolean CheckEvetLisence(Id currentUserId) {
    List<id> LisenceuserID=new list<id>();
        Boolean userhasLisence=false;
list<UserPackageLicense>lisence =[SELECT UserId, PackageLicense.NamespacePrefix FROM UserPackageLicense where PackageLicense.NamespacePrefix='evt' and UserId=:currentUserId ];
          if(lisence.size()>0){
              userhasLisence=true;
          }else
          {
              userhasLisence=false;
          }
       return userhasLisence;
    }
 @AuraEnabled
    global static map<String,String> getAttendee(Id accId,Id currentUserId) {
        List<id> LisenceuserID=new list<id>();
       
         Map<String,String> Attendeemap = new Map<String,String>();
list<UserPackageLicense>lisence =[SELECT UserId, PackageLicense.NamespacePrefix FROM UserPackageLicense where PackageLicense.NamespacePrefix='evt' and UserId=:currentUserId ];
       
        List<id> PrimaryContactID=new List<ID>();
        if(lisence.size()>0){
            List<Contact> primaryContact=[select id from contact where AccountId=:accId and Account_Roles__c='Primary Contact'];
        if(primaryContact.size()>0){
            for(contact c:primaryContact){
                  PrimaryContactID.add(c.id);
            }
          
            
        }
 List<evt__Attendee__c> EventsList=   [Select Id, Name,evt__First_Name__c,evt__Last_Name__c,evt__Event__r.name,evt__Invitation_Status__c From evt__Attendee__c where evt__Contact__c=:PrimaryContactID ];  
            
            for( evt__Attendee__c e:EventsList ){
               Attendeemap.put(e.evt__Event__r.name,'Event Name: '+e.evt__Event__r.name+ ';    Attended By: '+ e.evt__First_Name__c +' '+e.evt__Last_Name__c+';    Status: '+e.evt__Invitation_Status__c );
             
                
            }
            return Attendeemap;
        }else{
              return null;
        }
        
           
       
      
    }
     @AuraEnabled
    global static List<Contact> getEventsAttended(Id accId) {
        List<Contact> cList=[Select id,name ,Events_Attended_Info__c from contact where AccountId=:accId and Events_Attended_Info__c!=''];
        return cList;
    }
        @AuraEnabled
    public static List<Case> getComplaints(Id accId) {
   
        return [Select Id, subject,status,CAM__c,Accounting_Coordinator__c From Case where AccountId=:accId and subject like 'Complaint %'];
    }
         @AuraEnabled
    public static boolean updatedNotesRecords( Id accId,String Notes,String noteType,Id userId ) {
           User CurrentUser=[Select Id,Name from User where id =:userId limit 1];
        Note__c note=new Note__c();
        note.Notes__c=Notes;
        note.Notes_Type__c=noteType;
        note.name= system.today().format()+' - '+CurrentUser.Name +' - '+noteType;
       note.Client__c=accId;
        try{
            insert note;    
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
        
       
    }
        @AuraEnabled
    public static List<Note__c> getNotes(Id accId) {
   
        return [Select id,Name,Notes__c,Notes_Type__c,CreatedBy.name,CreatedDate,LastModifiedDate from Note__c where Client__c=:accId order  By  createdDate DESC ];
    }
     @AuraEnabled
    public static List<Note__c> getFilterdNotes(Id accId,string NoteType) {
        if(NoteType=='All'){
            return [Select id,Name,Notes__c,Notes_Type__c,CreatedBy.name,CreatedDate,LastModifiedDate from Note__c where Client__c=:accId order  By  createdDate DESC ];
        }else{
            return [Select id,Name,Notes__c,Notes_Type__c,CreatedBy.name,CreatedDate,LastModifiedDate from Note__c where Client__c=:accId and Notes_Type__c=:NoteType order  By  createdDate DESC ];    
        }
   
        
    }
      @AuraEnabled
    public static List<Feedback__c> getfeedback(Id accId) {
      
            return [Select id, Name, CreatedDate, NPS_Rating__c, Status__c, Survey_Comments__c from Feedback__c where Client__c=:accId  order  By  createdDate DESC ];    
      
   
        
    }
      @AuraEnabled
     public static boolean updatedAllNotesRecords( List < Note__c > updatedNoteRecordList ) {    
            
        try {
            
           
           
            
            update updatedNoteRecordList;  
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
            
    } 
   /*  @AuraEnabled
     public static boolean updatedBookeepingRecords( List < Bookkeeping__c > updatedBookeepingRecordList ) {    
            
        try {
            
           
          
            update updatedBookeepingRecordList;  
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
            
    } */
    /* @AuraEnabled
    public static List<Tax__c> getTaxRecord(Id accId) {
    //    return [Select Id, Name,Updated_Internal_Notes__c,Updated_Advisor_Notes_Company_Wide__c,Updated_Preparer_Company_Wide_Notes__c,Updated_Preparer_Internal_Notes__c From Tax__c where Client_Name__c=:accId ];
    }*/
  /*   @AuraEnabled
     public static boolean updatedTaxRecords( List < Tax__c > updatedTaxRecordList ) {    
            
        try {  
          
            update updatedTaxRecordList;  
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
            
    }*/
   /*   @AuraEnabled
    public static List<LLC_Q__c> getQonlineRecord(Id accId) {
       // return [Select Id, Name,Status__c,Queue_Run__c,CreatedDate,Updated_Fields__c,Client_Email__c From LLC_Q__c where Account__c=:accId Order By CreatedDate Desc ];
    }*/
    
    
 /*  @AuraEnabled
    public static void AccountImageController(Id accId) {
         String recId;
     Attachment BluePrint;
     String fullFileURL;
     
        fullFileURL = 'https://' + URL.getSalesforceBaseUrl().getHost();
       
        Account acc = new Account(id = accId);      
        try{
             List<Attachment> att=new List<Attachment>();
            Id attachmentId = [SELECT AttachmentId__c FROM Blueprint__c WHERE AccountId__c =:acc.Id ORDER By CreatedDate DESC LIMIT 1].AttachmentId__c;
            att= [select Id, ParentId, Name, ContentType, BodyLength, Body, OwnerId, CreatedDate, Description from Attachment where Id =:attachmentId order By CreatedDate DESC limit 1];
            if(att.size()>0)
                BluePrint=att[0];
        } catch(Exception e){
            system.debug('==== Exception  ====' + e);
        }
    }*/
    @AuraEnabled
    public static String getBaseUrl (id accId) {
        String url='';
         String baseurl='';
   /* if (Network.getNetworkId() != null) {
        baseurl=[SELECT Id, UrlPathPrefix FROM Network WHERE Id = :Network.getNetworkId()].UrlPathPrefix;
      
    }*/
          url=system.URL.getSalesforceBaseUrl().toExternalForm()+'/apex/BluePrintImageOnly?id='+accId;
    return url;
} 
    @AuraEnabled
    public static String getLucidChartUrl (id accId) {
       
  String url='';
          url=[Select LucidChart_Blueprint_URL__c from account where id=:accId]?.LucidChart_Blueprint_URL__c;
    return url;
} 
    @AuraEnabled
     public static boolean updatedAccRecords( Id accId,Account NoteFiedlsVals,Id userId ) {    
            
        try {
           String partnerNotes;
            String AdvisorNotes;
            String userName;
             String BookkeepingNotes;
             String TaxNotes;
            String ServiceNotes;
            String RenewalNotes;
             String keepmoresolNotes;
            String taxConsultNotes;
            String structureCommenets;
            
            User CurrentUser=[Select Id,Name from User where id =:userId ];
            
           partnerNotes=NoteFiedlsVals.Partner_Notes__c;
             AdvisorNotes=NoteFiedlsVals.Advisor_Notes__c;
            BookkeepingNotes=NoteFiedlsVals.Update_Bookkeeping_Notes__c;
            TaxNotes=NoteFiedlsVals.Update_Tax_Notes__c;
            ServiceNotes=NoteFiedlsVals.Update_Service_Notes__c;
            RenewalNotes=NoteFiedlsVals.Update_Renewal_Notes__c;
             taxConsultNotes=NoteFiedlsVals.Update_Tax_Consult_Notes__c;
            structureCommenets=NoteFiedlsVals.Update_Structure_Comments__c;
            keepmoresolNotes=NoteFiedlsVals.Update_Keep_more_Solution__c;
            
        
            List <Account> updateAcclist=new List<Account>();
          List<Account> Acc=[select id,Advisor_Notes__c,Partner_Notes__c,Update_Tax_Consult_Notes__c,Update_Structure_Comments__c,Structure_Comments__c,Tax_Consult_Notes__c,Date_User_Partner_Notes__c,Date_User_Advisor_Notes__c,Tax_Notes__c,Update_Tax_Notes__c,Update_Bookkeeping_Notes__c,Bookkeeper__c,Bookkeeping_Notes__c,Service_Notes__c,Update_Service_Notes__c,Renewal_Notes__c,Update_Renewal_Notes__c,Keep_More_Solution_Notes__c,Update_Keep_more_Solution__c from Account where id =:accId ] ;
            for(Account a :Acc){
                if(partnerNotes!=null && partnerNotes!='' ){
                    if(a.Date_User_Partner_Notes__c!=null && a.Date_User_Partner_Notes__c!=''){
                         a.Date_User_Partner_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+partnerNotes + ' '+  a.Date_User_Partner_Notes__c; 
                    }
                    else{
                         a.Date_User_Partner_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+partnerNotes ;
                    }
               
                    
                }
                    if(taxConsultNotes!=null && taxConsultNotes!='' ){
                    if(a.Tax_Consult_Notes__c!=null && a.Tax_Consult_Notes__c!=''){
                         a.Tax_Consult_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+taxConsultNotes + ' '+  a.Tax_Consult_Notes__c; 
                    }
                    else{
                         a.Tax_Consult_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+taxConsultNotes ;
                    }
               
                    
                }
                if(AdvisorNotes!=null && AdvisorNotes!=''){
                    if(a.Date_User_Advisor_Notes__c!=null && a.Date_User_Advisor_Notes__c!=''){
                        a.Date_User_Advisor_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+AdvisorNotes +' '+  a.Date_User_Advisor_Notes__c ;  
                    }else{
                        a.Date_User_Advisor_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+AdvisorNotes ;  
                    }
                 
                  
                }
                 if(BookkeepingNotes!=null && BookkeepingNotes!=''){
                    if(a.Bookkeeping_Notes__c!=null && a.Bookkeeping_Notes__c!=''){
                        a.Bookkeeping_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+BookkeepingNotes +' '+  a.Bookkeeping_Notes__c ;  
                    }else{
                        a.Bookkeeping_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+BookkeepingNotes ;  
                    }
                 
                  
                }
                   if(TaxNotes!=null && TaxNotes!=''){
                    if(a.Tax_Notes__c!=null && a.Tax_Notes__c!=''){
                        a.Tax_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+TaxNotes +' '+  a.Tax_Notes__c ;  
                    }else{
                        a.Tax_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+TaxNotes ;  
                    }
                 
                  
                }
                 if(ServiceNotes!=null && ServiceNotes!=''){
                    if(a.Service_Notes__c!=null && a.Service_Notes__c!=''){
                        a.Service_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+ServiceNotes +' '+  a.Service_Notes__c ;  
                    }else{
                        a.Service_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+ServiceNotes ;  
                    }
                 
                  
                }
                  if(RenewalNotes!=null && RenewalNotes!=''){
                    if(a.Renewal_Notes__c!=null && a.Renewal_Notes__c!=''){
                        a.Renewal_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+RenewalNotes +' '+  a.Renewal_Notes__c ;  
                    }else{
                        a.Renewal_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+RenewalNotes ;  
                    }
                 
              
                }
           if(structureCommenets!=null && structureCommenets!=''){
                    if(a.Structure_Comments__c!=null && a.Structure_Comments__c!=''){
                        a.Structure_Comments__c=System.today()+' - '+CurrentUser.Name + ' '+structureCommenets +' '+  a.Structure_Comments__c ;  
                    }else{
                        a.Structure_Comments__c=System.today()+' - '+CurrentUser.Name + ' '+structureCommenets ;  
                    }
                 
              
                }
             if(keepmoresolNotes!=null && keepmoresolNotes!=''){
                    if(a.Keep_More_Solution_Notes__c!=null && a.Keep_More_Solution_Notes__c!=''){
                        a.Keep_More_Solution_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+keepmoresolNotes +' '+  a.Keep_More_Solution_Notes__c ;  
                    }else{
                        a.Keep_More_Solution_Notes__c=System.today()+' - '+CurrentUser.Name + ' '+keepmoresolNotes ;  
                    }
                 
              
                }
                  a.Update_Keep_more_Solution__c=' ';
       
                  a.Update_Structure_Comments__c=' ';
                 a.Partner_Notes__c=' ';
                   a.Advisor_Notes__c=' ';
                 a.Update_Bookkeeping_Notes__c=' ';
                 a.Update_Tax_Notes__c=' ';
                  a.Update_Service_Notes__c=' ';
                 a.Update_Renewal_Notes__c=' ';
                
           
            
                updateAcclist.add(a);
            }
            update updateAcclist;
         
         
          
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
            
    }
  /*   @AuraEnabled
    public static boolean sendOnlineQEmail(Id accId){
        List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
         String sendToId;
        List<String> EmailId= new list<String>();
        id whatId;
        String TemplateId;
       EmailTemplate onlineQt=[SELECT Id FROM EmailTemplate WHERE DeveloperName = 'Online_Q_form' LIMIT 1];
        TemplateId=onlineQt.id;
        System.debug('accid---'+accId);
        for(LLC_Q__c OnlineQ : [SELECT Id, Name, Client_Email__c,Account__c FROM LLC_Q__c WHERE Id =:accId]){
           system.debug('OnlineQ---'+OnlineQ.Client_Email__c);
            for(contact con:[Select id from contact where AccountId=:OnlineQ.Account__c and Account_Roles__c ='Primary Contact' ]){
                sendToId= con.id;
               
            }
            EmailId.add(OnlineQ.Client_Email__c);
            whatId=OnlineQ.id;
            
        }
        
       
            try {
                if(EmailId.size()>0){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            mail.setTreatTargetObjectAsRecipient(false);
            //sendTo = OnlineQ.Account__c;
            mail.setTargetObjectId(sendToId);
            mail.setToAddresses(EmailId);
            mail.setWhatId(whatId);
            mail.setTemplateId(TemplateId);
            
            mail.setSaveAsActivity(false);
            
            mails.add(mail);
            Messaging.sendEmail(mails);
              return true; 
                }else{ 
                     return false;
                }
          
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
       
     
    }
       @AuraEnabled
     public static boolean updatedQRecords( List < LLC_Q__c > updatedQRecordList ) {    
            
        try {  
          
            update updatedQRecordList;  
            return true;  
              
        } catch(Exception e) {  
          
            return false;  
              
        }  
            
    }*/

}