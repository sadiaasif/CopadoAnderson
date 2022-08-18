/**
* A  Controller Class which is used to by customrelatedlist lighting Component.
* 
* @Sharukh khan
* @version 1.0 - july 5, 2020
*/


public without sharing class RelatedListcustomctrl {
    
    /* This method is used to show contact records on lightning Component.
* 
* @author @Sharukh khan
* @date july 05, 2020
* @return <code>Contact  Records</code>
*/
    @AuraEnabled
    public static List<contact> getCOntactData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<contact> cList =new List<contact>();
        
        String contactquery='SELECT Id, Name, CreatedDate, Account_Roles__c,Email,Phone,Account.Base_Url__c FROM contact WHERE AccountId=\''+ParentRecordID+'\'';
        
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id, Name, CreatedDate, Account_Roles__c,Email,Phone,Account.Base_Url__c FROM contact WHERE AccountId=\''+ParentRecordID+'\''));
        
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));        
        cList= (List<contact>)ssc.getRecords();
        return  cList;
        
    }
    // To get the base URL.
    @AuraEnabled
    public static String fetchit(){
        string urler = URL.getSalesforceBaseUrl().toString();
        return (urler);
    }
    // To get the count of sale records
    @AuraEnabled
    public static Integer getcountsale(id ParentRecordID) {
        List<opportunity> sList = new List<opportunity>();
        String Salequery='SELECT Id, Name, CreatedDate,StageName,RecordTypeId,RecordType.Name,Amount,ChargentSFA__Balance_Due__c,CloseDate,Sales_Rep__c,Entity__c,Entity__r.Name,Sales_Rep__r.Name,OwnerId,Owner.Name FROM   opportunity WHERE AccountId=\''+ParentRecordID+'\'';
        sList=Database.query(Salequery);        
        return sList.size();
        
    }
    @AuraEnabled
    public static Integer getcountcontact(id ParentRecordID) {
        List<contact> conList = new List<contact>();
        String contactquery='SELECT Id, Name, CreatedDate, Account_Roles__c,Email,Phone FROM contact WHERE AccountId=\''+ParentRecordID+'\'';
        conList=Database.query(contactquery);
        return conList.size();
        
    }
    @AuraEnabled
    public static Integer getcountEntity(id ParentRecordID) {
        List<Entities__C> enList = new List<Entities__C>();
        String Enquery=  'SELECT Id, Name, CreatedDate,Status__c,Tax_Status__c,Disregarded_To__c,Disregarded_To__r.Name,Federal_Return__c,Organization_State__c   FROM   Entities__c WHERE Primary_Client__c=\''+ParentRecordID+'\'';
        enList=Database.query(Enquery);
        return enList.size();
        
    }
    @AuraEnabled
    public static Integer getcountcase(id ParentRecordID) {
        List<case> CaseList = new List<case>();
        String casequery='SELECT Id, Subject,RecordTypeID,RecordType.Name, CreatedDate,Status,OwnerId,Owner.Name,CaseNumber,ClosedDate FROM Case WHERE AccountId=\''+ParentRecordID+'\'';
        CaseList=Database.query(casequery);
        return CaseList.size();
        
    }
    @AuraEnabled
    public static Integer getcountTrust(id ParentRecordID) {
        List<Trust__c> TrustList = new List<Trust__c>();
        String Trustquery='SELECT Id, Name FROM Trust__c WHERE Primary_Client__c=\''+ParentRecordID+'\'';
        TrustList=Database.query(Trustquery);
        return TrustList.size();
        
    }
    @AuraEnabled
    public static Integer getcountRefund(id ParentRecordID) {
        List<Refund__c> RefundList = new List<Refund__c>();
        String Refundquery='SELECT Id, Name,Status__c,Sale__c,Sale__r.Name,Amount_to_be_refunded__c,OwnerId,Owner.name,createdDate,LastModifiedDate FROM Refund__c WHERE Client__c=\''+ParentRecordID+'\'';
        RefundList=Database.query(Refundquery);        
        return RefundList.size();
        
    }
    @AuraEnabled
    public static Integer getcountBookR(id ParentRecordID) {
        List<Bookkeeping__c> BookRList = new List<Bookkeeping__c>();
        String BookRquery='SELECT Id, Name,Entity__c,Entity__r.Name,Entity_Type__c,Set_of_Books__c,Set_of_Books__r.name,Case__c,Case__r.CaseNumber,BK_Stage__c,Bookkeeper__c,LastModifiedDate FROM Bookkeeping__c WHERE Client_Name__c=\''+ParentRecordID+'\'';
        BookRList=Database.query(BookRquery);        
        return BookRList.size();
        
    }
    @AuraEnabled
    public static Integer getcountCCd(id ParentRecordID) {
        List<Credit_Card_Detail__c> ccdList = new List<Credit_Card_Detail__c>();
        String ccDetails='SELECT Id, Name,Credit_Card_Notes__c,Card_Type__c,Card_Number__c,Card_Month__c,Card_Year__c,Billing_Zip_Postal__c,Platinum_Subscription_Card__c,CreatedDate FROM Credit_Card_Detail__c WHERE Account__c=\''+ParentRecordID+'\'';
        ccdList=Database.query(ccDetails);
        return ccdList.size();
        
    }
    @AuraEnabled
    public static Integer getcounttaskd(id ParentRecordID) {
        List<task> taskList = new List<task>();
        String taskDetails='SELECT Id,Subject, OwnerId,Owner.Name,Priority,ActivityDate,WhoId,What.Name,LastModifiedDate,WhatId,Status,Summary__c,Days_Since_Last_Modified__c FROM task WHERE Client__c=\''+ParentRecordID+'\'';
        taskList=Database.query(taskDetails);
        return taskList.size();
        
    }
    @AuraEnabled
    public static Integer getcountorderd(id ParentRecordID) {
        List<Order> OrderList = new List<Order>();
        String Ordertails='SELECT Id,OrderNumber,Status,EffectiveDate,ContractId ,TotalAmount FROM Order WHERE AccountId=\''+ParentRecordID+'\'';
        OrderList=Database.query(Ordertails);
        return OrderList.size();
        
    }
    @AuraEnabled
    public static Integer getcountSetofBooksd(id ParentRecordID) {
        List<Set_of_Books__c> SetofBookList = new List<Set_of_Books__c>();
        String SetOfBookdetails='SELECT Id,Name,Client_Email__c,Bookkeeper__c FROM Set_of_Books__c WHERE Client__c=\''+ParentRecordID+'\'';
        SetofBookList=Database.query(SetofBookdetails);
        return SetofBookList.size();
        
    }
    @AuraEnabled
    public static Integer getcountProjects(id ParentRecordID) {
        List<H2S__HarvestProject__c> ProjectList = new List<H2S__HarvestProject__c>();
        String Projectdetails='SELECT Id,Name,Billing_City__c,Billing_Country__c,Client_Last_Name__c FROM H2S__HarvestProject__c WHERE H2S__Account__c=\''+ParentRecordID+'\'';
        ProjectList=Database.query(Projectdetails);        
        return ProjectList.size();
        
    }
    
    @AuraEnabled
    public static Integer getcountStrategySessionQuestionnaires(id ParentRecordID) {
        List<Strategy_Session_Questionnaire__c> StrategyList = new List<Strategy_Session_Questionnaire__c>();
        String Strategydetails='SELECT Name, Id, CreatedDate,Networth__c, LastModifiedDate FROM Strategy_Session_Questionnaire__c WHERE Account_Lookup__c=\''+ParentRecordID+'\'';
        StrategyList=Database.query(Strategydetails);
        return StrategyList.size();
        
    }
    
   // get count of feedback data
    
   @AuraEnabled
    public static Integer getcountFeedback(id ParentRecordID) {
        List<Feedback__c> FeedbackList = new List<Feedback__c>();
        String Feedbackdetails='SELECT Id,Name,CreatedDate,Contact__c,Contact__r.Name,CreatedById,CreatedBy.Name,NPS_Rating__c,Status__c ,Survey_Comments__c From Feedback__c WHERE Client__c=\''+ParentRecordID+'\'';
        FeedbackList=Database.query(Feedbackdetails);    
        system.debug('feedback size' + FeedbackList.size());
        return FeedbackList.size();
        
    }
    
    
    
    @AuraEnabled
    public static Integer getcountAssIntd(id ParentRecordID) {
        List<Assignment_of_Interest__c> AssIntList = new List<Assignment_of_Interest__c>();
        String AssIntDetails='SELECT Id,Name,CreatedDate FROM Assignment_of_Interest__c WHERE Account__c=\''+ParentRecordID+'\'';
        AssIntList=Database.query(AssIntDetails);
        return AssIntList.size();
        
    }
    @AuraEnabled
    public static Integer getcountMeetingMind(id ParentRecordID) {
        List<Meeting_Minutes__c> MeetingMinList = new List<Meeting_Minutes__c>();
        String MeetingMinDetails='SELECT Id,Name,Email__c,CreatedDate,Entity__c,Name_of_Entity__c,Document_Requested__c,LastModifiedByID,LastModifiedBy.Name,LastModifiedDate FROM Meeting_Minutes__c WHERE Client__c=\''+ParentRecordID+'\'';
        MeetingMinList=Database.query(MeetingMinDetails);
        return MeetingMinList.size();
        
    }
    @AuraEnabled
    public static List<opportunity> getSalesData(String objectType,Integer pageSizeSale,Integer pageNumberSale,id ParentRecordID) {
        List<opportunity> sList = new List<opportunity>();
        String Salequery='SELECT Id, Name, CreatedDate,StageName,RecordTypeId,RecordType.Name,Amount,ChargentSFA__Balance_Due__c,CloseDate,Sales_Rep__c,Entity__c,Entity__r.Name,Sales_Rep__r.Name,OwnerId,Owner.Name,Account.Base_Url__c FROM   opportunity WHERE AccountId=\''+ParentRecordID+'\'';
        
        sList=Database.query(Salequery);
        
        if(sList.size()==5){
            return sList;
        }else{
            ApexPages.StandardSetController sscSale = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id, Name, CreatedDate,StageName,RecordTypeId,RecordType.Name,Amount,ChargentSFA__Balance_Due__c,CloseDate,Sales_Rep__c,Entity__c,Entity__r.Name,Sales_Rep__r.Name,OwnerId,Owner.Name,Account.Base_Url__c FROM   opportunity WHERE AccountId=\''+ParentRecordID+'\''));
            
            sscSale.setpagesize(Integer.valueOf(pageSizeSale));
            sscSale.setPageNumber(Integer.valueOf(pageNumberSale));
            
            sList=(List<opportunity>)sscSale.getRecords();
            return sList;
        }
    }
    @AuraEnabled
    public static List<Entities__c> getEntityData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Entities__c> EnList =new List<Entities__c>();
        String Enquery=  'SELECT Id, Name, CreatedDate,Status__c,EIN__c,Tax_Status__c,Disregarded_To__c,Disregarded_To__r.Name,Federal_Return__c,Organization_State__c,Primary_Client__r.Base_Url__c   FROM   Entities__c where Primary_Client__c=\''+ParentRecordID+'\'';
        system.debug('Enquery='+Enquery);
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id, Name,EIN__c, CreatedDate,Status__c,Tax_Status__c,Disregarded_To__c,Disregarded_To__r.Name,Federal_Return__c,Organization_State__c,Primary_Client__r.Base_Url__c   FROM   Entities__c WHERE Primary_Client__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        EnList= (List<Entities__c>) ssc.getRecords();
        system.debug('EnList=='+EnList);
        return EnList;
        
    }
    @AuraEnabled
    public static List<case> getCaseData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<case> caseList = new List<case>();
        String casequery='SELECT Id, Subject,RecordTypeID,RecordType.Name, CreatedDate,Status,OwnerId,Owner.Name,CaseNumber,ClosedDate FROM Case WHERE AccountId=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id, Subject,RecordTypeID,RecordType.Name, CreatedDate,Status,OwnerId,Owner.Name,CaseNumber,ClosedDate,Account.Base_Url__c FROM Case where AccountId=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        caseList=(List<case>)ssc.getRecords();
        return caseList;
        
    }
    @AuraEnabled
    public static List<Trust__c> getTrustDataResult(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Trust__c> TrustList = new List<Trust__c>();
        String casequery='SELECT Id, Name FROM Trust__c WHERE Primary_Client__c=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id, Name,CreatedDate,LastModifiedDate,Primary_Client__r.Base_Url__c FROM Trust__c WHERE Primary_Client__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        TrustList=(List<Trust__c>)ssc.getRecords();
        return TrustList;
        
    }
    @AuraEnabled
    public static List<Refund__c> getRefundData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Refund__c> RefundList = new List<Refund__c>();
        String casequery='SELECT Id, Name,Status__c,Sale__c,Sale__r.Name,Amount_to_be_refunded__c,OwnerId,Owner.name,createdDate,LastModifiedDate FROM Refund__c WHERE Client__c=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id, Name,Status__c,Sale__c,Sale__r.Name,Amount_to_be_refunded__c,OwnerId,Owner.name,createdDate,LastModifiedDate,Client__r.Base_Url__c FROM Refund__c WHERE Client__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        RefundList=(List<Refund__c>)ssc.getRecords();
        return RefundList;
        
    }
    @AuraEnabled
    public static List<Bookkeeping__c> getBookkeepinRecordsData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Bookkeeping__c> BookkeepingList = new List<Bookkeeping__c>();
        String casequery='SELECT Id, Name,Entity__c,Entity__r.Name,Entity_Type__c,Set_of_Books__c,Set_of_Books__r.name,Case__c,Case__r.CaseNumber,BK_Stage__c,Bookkeeper__c,LastModifiedDate FROM Bookkeeping__c WHERE Client_Name__c=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id, Name,Entity__c,Entity__r.Name,Entity_Type__c,Set_of_Books__c,Set_of_Books__r.name,Case__c,Case__r.CaseNumber,BK_Stage__c,Bookkeeper__c,LastModifiedDate,Client_Name__r.Base_Url__c FROM Bookkeeping__c WHERE Client_Name__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        BookkeepingList=(List<Bookkeeping__c>)ssc.getRecords();        
        return BookkeepingList;
        
    }
    @AuraEnabled
    public static List<Credit_Card_Detail__c> getccDetailsData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Credit_Card_Detail__c> ccDetailsList = new List<Credit_Card_Detail__c>();
        String ccDetails='SELECT Id, Name,Credit_Card_Notes__c,Card_Type__c,Card_Number__c,Card_Month__c,Card_Year__c,Billing_Zip_Postal__c,Platinum_Subscription_Card__c,CreatedDate FROM Credit_Card_Detail__c WHERE Account__c=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id, Name,Credit_Card_Notes__c,Card_Type__c,Card_Number__c,Card_Month__c,Card_Year__c,Billing_Zip_Postal__c,Platinum_Subscription_Card__c,CreatedDate,Account__r.Base_Url__c FROM Credit_Card_Detail__c WHERE Account__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        ccDetailsList=(List<Credit_Card_Detail__c>)ssc.getRecords();
        return ccDetailsList;
        
    }
    @AuraEnabled
    public static List<task> getActivityData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<task> taskList = new List<task>();
        String ccDetails='Select Id,Subject, OwnerId,Owner.Name,Priority,ActivityDate,WhoId,What.Name,LastModifiedDate,WhatId,Status,Summary__c,Days_Since_Last_Modified__c,Client__r.Base_Url__c  FROM task WHERE Client__c=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('Select Id,Subject, OwnerId,Owner.Name,Priority,ActivityDate,WhoId,What.Name,LastModifiedDate,WhatId,Status,Summary__c,Days_Since_Last_Modified__c,Client__r.Base_Url__c  FROM task WHERE Client__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        taskList=(List<task>)ssc.getRecords();
        return taskList;
        
    }
    @AuraEnabled
    public static List<Assignment_of_Interest__c> getAssIntrestData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Assignment_of_Interest__c> AssIntrestList = new List<Assignment_of_Interest__c>();
        String ccDetails='SELECT Id,Name,CreatedDate FROM Assignment_of_Interest__c WHERE Account__c=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id,Name,CreatedDate,Account__r.Base_Url__c FROM Assignment_of_Interest__c WHERE Account__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        AssIntrestList=(List<Assignment_of_Interest__c>)ssc.getRecords();
        return AssIntrestList;
        
    }
    @AuraEnabled
    public static List<Meeting_Minutes__c> getMeetingMinData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Meeting_Minutes__c> MeetingMinList = new List<Meeting_Minutes__c>();
        String ccDetails='SELECT Id,Name,Email__c,CreatedDate,Entity__c,Name_of_Entity__c,Document_Requested__c,LastModifiedByID,LastModifiedBy.Name,LastModifiedDate FROM Meeting_Minutes__c WHERE Client__c=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('Select Id,Name,Email__c,CreatedDate,Entity__c,Name_of_Entity__c,Document_Requested__c,LastModifiedByID,LastModifiedBy.Name,LastModifiedDate,Client__r.Base_Url__c FROM Meeting_Minutes__c WHERE Client__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        MeetingMinList=(List<Meeting_Minutes__c>)ssc.getRecords();
        return MeetingMinList;
        
    }
    @AuraEnabled
    public static List<Order> getorderData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Order> OrderList = new List<Order>();
        String OrderDetail='SELECT Id,OrderNumber,Status,EffectiveDate,ContractId ,TotalAmount FROM Order WHERE AccountId=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id,OrderNumber,Stage__c,Completed_Order_Items__c,Total_Order_Items__c,Opportunity.name,Order_Age__c,Status,EffectiveDate,ContractId ,TotalAmount,Account.Base_Url__c FROM Order WHERE AccountId=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        OrderList=(List<Order>)ssc.getRecords();
        return OrderList;
        
    }
    @AuraEnabled
    public static List<Set_of_Books__c> getSetofBooksData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Set_of_Books__c> SetofBookList = new List<Set_of_Books__c>();
        String sbDetails='SELECT Id,Name,Bookkeeping_Reviewer__c,Client_Name__c,Client_Email__c,Bookkeeper__c,CreatedDate,LastModifiedByID,LastModifiedBy.Name,LastModifiedDate FROM Set_of_Books__c WHERE Client__c=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id,Name,Client_Name__c,Client_Email__c,Bookkeeper__c,Bookkeeping_Reviewer__c,CreatedDate,LastModifiedByID,LastModifiedBy.Name,LastModifiedDate,Client__r.Base_Url__c FROM Set_of_Books__c WHERE Client__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        SetofBookList=(List<Set_of_Books__c>)ssc.getRecords();
        return SetofBookList;
        
    }
    @AuraEnabled
    public static List<H2S__HarvestProject__c> getProjectsData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<H2S__HarvestProject__c> ProjectList = new List<H2S__HarvestProject__c>();
        String prDetails='SELECT Id,Name,Billing_City__c,Billing_Country__c,Client_Last_Name__c,CreatedDate,LastModifiedByID,LastModifiedBy.Name,LastModifiedDate FROM H2S__HarvestProject__c WHERE H2S__Account__c=\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id,Name,Billing_City__c,Billing_Country__c,Client_Last_Name__c,CreatedDate,LastModifiedByID,LastModifiedBy.Name,LastModifiedDate,H2S__Account__r.Base_Url__c FROM H2S__HarvestProject__c WHERE H2S__Account__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        ProjectList=(List<H2S__HarvestProject__c>)ssc.getRecords();
        return ProjectList;   
    }
    
    @AuraEnabled
    public static List<Strategy_Session_Questionnaire__c> getStrategySessionQuestionnairesData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Strategy_Session_Questionnaire__c> StrategySessionQuestionnairesDataList = new List<Strategy_Session_Questionnaire__c>();
        String stDetails='SELECT Name, Id, CreatedDate,Networth__c, LastModifiedDate FROM Strategy_Session_Questionnaire__c WHERE Account_Lookup__c =\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Name, Id, CreatedDate,Networth__c, LastModifiedDate,Account_Lookup__r.Base_Url__c FROM Strategy_Session_Questionnaire__c WHERE Account_Lookup__c =\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        StrategySessionQuestionnairesDataList=(List<Strategy_Session_Questionnaire__c>)ssc.getRecords();
        system.debug('StrategySessionQuestionnairesDataList=='+StrategySessionQuestionnairesDataList);
        return StrategySessionQuestionnairesDataList;   
    }
    
        
     @AuraEnabled
    public static List<Feedback__c> getFeedbackData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Feedback__c> FeedbackList = new List<Feedback__c>();
        String FbDetails='SELECT Id,Name,CreatedDate,Contact__c,CreatedById,NPS_Rating__c,Status__c ,Survey_Comments__c From Feedback__c WHERE Client__c =\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id,Name,CreatedDate,Client__r.Base_Url__c,Contact__r.name,CreatedBy.name,NPS_Rating__c,Status__c ,Survey_Comments__c From Feedback__c WHERE Client__c=\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        FeedbackList=(List<Feedback__c>)ssc.getRecords();
        system.debug('FeedbackList' + FeedbackList);
        return FeedbackList;   
    }
    
     @AuraEnabled
    public static List<Dissolution__c> getDissolutionData(String objectType,Integer pageSize,Integer pageNumber,id ParentRecordID) {
        List<Dissolution__c> DissolutionList = new List<Dissolution__c>();
        String DisDetails='Select Id,Client__c,Client__r.Base_Url__c, Date_and_Time_of_Meeting_Held__c, Directors_Managers_Shareholders_Present__c, Email__c, First_Name__c, Important_Notes__c, Last_Name__c, LP_General_Partner__c, LP_Limited_Partner__c, Manager_Managed_Entity__c, Manager_Managed_Person__c, Meeting_Address__c, Meeting_Chairman__c, Meeting_Secretary__c, Member_Managed_Entity__c, Member_Managed_Person__c, Name, Name_of_Entity__c, OwnerId, Phone__c, Retirement_Sponsorship__c, SD_Date_and_Time_of_Meeting_Held__c, SD_Meeting_Address__c, Shareholders_Present__c, Special_Directors_Meeting_Chairman__c, Special_Directors_Meeting_Secretary__c, Special_Directors_Present__c from Dissolution__c where Client__c =\''+ParentRecordID+'\'';
        ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(Database.getQueryLocator('Select Id,Client__c, Client__r.Base_Url__c,Date_and_Time_of_Meeting_Held__c, Directors_Managers_Shareholders_Present__c, Email__c, First_Name__c, Important_Notes__c, Last_Name__c, LP_General_Partner__c, LP_Limited_Partner__c, Manager_Managed_Entity__c, Manager_Managed_Person__c, Meeting_Address__c, Meeting_Chairman__c, Meeting_Secretary__c, Member_Managed_Entity__c, Member_Managed_Person__c, Name, Name_of_Entity__c, OwnerId, Phone__c, Retirement_Sponsorship__c, SD_Date_and_Time_of_Meeting_Held__c, SD_Meeting_Address__c, Shareholders_Present__c, Special_Directors_Meeting_Chairman__c, Special_Directors_Meeting_Secretary__c, Special_Directors_Present__c from Dissolution__c where Client__c =\''+ParentRecordID+'\''));
        ssc.setpagesize(Integer.valueOf(pageSize));
        ssc.setPageNumber(Integer.valueOf(pageNumber));
        DissolutionList=(List<Dissolution__c>)ssc.getRecords();
        system.debug('DissolutionList' + DissolutionList);
        return DissolutionList;   
    }
    
    @AuraEnabled
    public static List<RecordType> getListOfRecordType(){
        String query = 'SELECT Id,Name FROM RecordType WHERE SobjectType =\''+'Entities__c'+'\' ';
        List<RecordType> rtNames = new List<RecordType>();
        Schema.SObjectType  objType = Entities__c.SObjectType;     
        for(RecordTypeInfo rt : objType.getDescribe().getRecordTypeInfos()){
            
            rtNames.add(new RecordType(Id = rt.getRecordTypeId(),Name = rt.getName()));
            
        } 
        return rtNames; 
    }
    
    @AuraEnabled
    public static List<RecordType> getListOfSalesRecordType(){
        String query = 'SELECT Id,Name FROM RecordType WHERE SobjectType =\''+'Opportunity'+'\' ';
        List<RecordType> rtNames = new List<RecordType>();
        Schema.SObjectType  objType = Opportunity.SObjectType;     
        for(RecordTypeInfo rt : objType.getDescribe().getRecordTypeInfos()){
            
            rtNames.add(new RecordType(Id = rt.getRecordTypeId(),Name = rt.getName()));
            
        } 
        return rtNames; 
    }
    
    @AuraEnabled
    public static List<RecordType> getListOfTrustRecordType(){
        String query = 'SELECT Id,Name FROM RecordType WHERE SobjectType =\''+'Trust__c'+'\' ';
        List<RecordType> rtNames = new List<RecordType>();
        Schema.SObjectType  objType = Trust__c.SObjectType;     
        for(RecordTypeInfo rt : objType.getDescribe().getRecordTypeInfos()){
            
            rtNames.add(new RecordType(Id = rt.getRecordTypeId(),Name = rt.getName()));
            
        } 
        return rtNames; 
    }
    
    @AuraEnabled        
    public static List<String> fetchRecordTypeValues(){
        Map<Id, String> recordtypemap;
        List<Schema.RecordTypeInfo> recordtypes = Entities__c.SObjectType.getDescribe().getRecordTypeInfos();    
        recordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
                recordtypemap.put(rt.getRecordTypeId(), rt.getName());
            
        }        
        return recordtypemap.values();
    }
    
    @AuraEnabled        
    public static List<String> fetchTrustRecordTypeValues(){
        Map<Id, String> trustrecordtypemap;
        List<Schema.RecordTypeInfo> recordtypes = Trust__c.SObjectType.getDescribe().getRecordTypeInfos();    
        trustrecordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
                trustrecordtypemap.put(rt.getRecordTypeId(), rt.getName());
            
        }        
        return trustrecordtypemap.values();
    }
    
    @AuraEnabled        
    public static List<String> fetchSalesRecordTypeValues(){
        Map<Id, String> salerecordtypemap;
        List<Schema.RecordTypeInfo> recordtypes = Opportunity.SObjectType.getDescribe().getRecordTypeInfos();    
        salerecordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
                salerecordtypemap.put(rt.getRecordTypeId(), rt.getName());
            
        }        
        return salerecordtypemap.values();
    }
    
    @AuraEnabled        
    public static List<String> fetchFeedbackRecordTypeValues(){
        Map<Id, String> feedbackrecordtypemap;
        List<Schema.RecordTypeInfo> recordtypes = Feedback__c.SObjectType.getDescribe().getRecordTypeInfos();    
        feedbackrecordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
                feedbackrecordtypemap.put(rt.getRecordTypeId(), rt.getName());
            
        }        
        return feedbackrecordtypemap.values();
    }
    
    @AuraEnabled
    public static Id salesRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();
        return recid;
    } 
    
    @AuraEnabled
    public static Id feedbackRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.Feedback__c.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();
        return recid;
    } 
    
    @AuraEnabled
    public static Id trustRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.Trust__c.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();
        return recid;
    } 
    
    @AuraEnabled
    public static Id getRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();
        return recid;
    } 
    
    @AuraEnabled        
    public static List<String> fetchCaseRecordTypeValues(){
        Map<Id, String> caserecordtypemap;
        List<Schema.RecordTypeInfo> recordtypes = Case.SObjectType.getDescribe().getRecordTypeInfos();    
        caserecordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
                caserecordtypemap.put(rt.getRecordTypeId(), rt.getName());
            
        }        
        return caserecordtypemap.values();
    }
    @AuraEnabled
    public static Id caseRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.Case.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();
        
        return recid;
    } 
    
    
    @AuraEnabled
    public static String getIconName(String sObjectName){
        String u;
        List<Schema.DescribeTabSetResult> tabSetDesc = Schema.describeTabs();
        List<Schema.DescribeTabResult> tabDesc = new List<Schema.DescribeTabResult>();
        List<Schema.DescribeIconResult> iconDesc = new List<Schema.DescribeIconResult>();
        
        for(Schema.DescribeTabSetResult tsr : tabSetDesc) { tabDesc.addAll(tsr.getTabs()); }
        
        for(Schema.DescribeTabResult tr : tabDesc) {
            if( sObjectName == tr.getSobjectName() ) {
                if( tr.isCustom() == true ) {
                    iconDesc.addAll(tr.getIcons());
                } else {
                    u = 'standard:' + sObjectName.toLowerCase();
                }
            }
        }
        for (Schema.DescribeIconResult ir : iconDesc) {
            if (ir.getContentType() == 'image/svg+xml'){
                u = 'custom:' + ir.getUrl().substringBetween('custom/','.svg').substringBefore('_');
                break;
            }
        }
        return u;
    }
    @AuraEnabled
    public static List<Credit_Card_Detail__c> getCreditdetails() {
        return [SELECT Id, Name,Credit_Card_Notes__c,Card_Type__c,Card_Number__c,Card_Month__c,Card_Year__c,Billing_Zip_Postal__c,Platinum_Subscription_Card__c,CreatedDate FROM Credit_Card_Detail__c];
    }
    @AuraEnabled
    public static Boolean deleteRecord(String row)
    {
        Boolean hasCustomPermissionCC = FeatureManagement.checkPermission('AllowDeleteCreditCard');
        if(hasCustomPermissionCC){
            List<Credit_Card_Detail__c> delccdetail=[Select Id FROM Credit_Card_Detail__c WHERE id=:row];
            delete delccdetail;
        }
        return hasCustomPermissionCC;
    }
    @AuraEnabled
    public static Boolean deleteEntRecord(String row)
    {
        Boolean hasCustomPermissionEnt = FeatureManagement.checkPermission('Allowdeleteentities');
        if(hasCustomPermissionEnt){
            List<Entities__c> delEntity=[SELECT Id FROM Entities__c WHERE id=:row];
            if(delEntity.size()>0){
                delete delEntity;
            }
        }
        return hasCustomPermissionEnt;
    }
    @AuraEnabled
    public static Boolean deleteSaleRecord(String row)
    {
        Boolean hasCustomPermissionSale = FeatureManagement.checkPermission('Allowdeleteopportunities');
        if(hasCustomPermissionSale){
            List<Opportunity> delSale=[SELECT Id FROM Opportunity WHERE id=:row];
            if(delSale.size()>0){
                delete delSale;
            }
        }
        return hasCustomPermissionSale;
    }
    @AuraEnabled
    public static Boolean deleteCaseRecord(String row)
    {
        Boolean hasCustomPermissionCase = FeatureManagement.checkPermission('AllowDeleteCases');
        if(hasCustomPermissionCase){
            List<Case> delCase=[SELECT Id FROM Case WHERE id=:row];
            if(delCase.size()>0){
                delete delCase;
            }
        }
        return hasCustomPermissionCase;
    }
    @AuraEnabled
    public static Boolean deleteDissolutionRecord(String row)
    {
        Boolean hasCustomPermissionCase = FeatureManagement.checkPermission('AllowDeleteCases');
        if(hasCustomPermissionCase){
            List<Dissolution__c> delDissolutionList=[SELECT Id FROM Dissolution__c WHERE id=:row];
            if(delDissolutionList.size()>0){
                delete delDissolutionList;
            }
        }
        return hasCustomPermissionCase;
    }
    @AuraEnabled
    public static Boolean deleteRefundRecord(String row)
    {
        Boolean hasCustomPermissionRefund = FeatureManagement.checkPermission('AllowDeleteRefund');
        if(hasCustomPermissionRefund){
            List<Refund__c> delRefund=[SELECT Id FROM Refund__c WHERE id=:row];
            if(delRefund.size()>0){
                delete delRefund;
            }
        }
        return hasCustomPermissionRefund;
    }
    @AuraEnabled
    public static Boolean deleteTrustRecord(String row)
    {
        Boolean hasCustomPermissionTrust = FeatureManagement.checkPermission('AllowDeleteTrust');
        if(hasCustomPermissionTrust){
            List<Trust__c> delTrust=[SELECT Id FROM Trust__c WHERE id=:row];
            if(delTrust.size()>0)
            {
                delete delTrust;
            }
        }
        return hasCustomPermissionTrust;
    }
    @AuraEnabled
    public static Boolean deleteActivityRecord(String row)
    {
        Boolean hasCustomPermissionAct = FeatureManagement.checkPermission('Allowdeletetasks');
        if(hasCustomPermissionAct){
            List<Task> delTask=[SELECT Id FROM Task WHERE id=:row];
            if(delTask.size()>0){
                delete delTask;
            }
        }
        return hasCustomPermissionAct;
    }
    @AuraEnabled
    public static Boolean deleteAssignRecord(String row)
    {
        Boolean hasCustomPermissionAssign = FeatureManagement.checkPermission('AllowDeleteAssign');        
        if(hasCustomPermissionAssign){
            List<Assignment_of_Interest__c> delAssign=[SELECT Id FROM Assignment_of_Interest__c WHERE id=:row];
            if(delAssign.size()>0){
                delete delAssign; 
            }
            
        }
        return hasCustomPermissionAssign;
    }
    @AuraEnabled
    public static Boolean deleteMeetingMinRecord(String row)
    {
        Boolean hasCustomPermissionMM = FeatureManagement.checkPermission('AllowDeleteMeetingMin');        
        if(hasCustomPermissionMM){
            List<Meeting_Minutes__c> delMeeting=[SELECT Id FROM Meeting_Minutes__c where id=:row];
            if(delMeeting.size()>0)
            {
                delete delMeeting;
            }
        }
        return hasCustomPermissionMM;
    }
    @AuraEnabled
    public static Boolean deleteSetOfBooksRecord(String row)
    {
        Boolean hasCustomPermissionSB = FeatureManagement.checkPermission('AllowDeleteSetOfBooks');        
        if(hasCustomPermissionSB){
            List<Set_of_Books__c> delSetOfBooks=[SELECT Id FROM Set_of_Books__c WHERE id=:row];
            if(delSetOfBooks.size()>0)
            {
                delete delSetOfBooks;
            }
        }
        return hasCustomPermissionSB;
    }
    @AuraEnabled
    public static Boolean deleteOrderRecord(String row)
    {
        Boolean hasCustomPermissionOrder = FeatureManagement.checkPermission('AllowDeleteOrder');
        if(hasCustomPermissionOrder){
            List<Order> delOrder=[SELECT Id FROM Order WHERE id=:row];
            if(delOrder.size()>0)
            {
                delete delOrder;
            }
        }
        return hasCustomPermissionOrder;
    }
    @AuraEnabled
    public static Boolean deleteProjetsRecord(String row)
    {
        Boolean hasCustomPermissionProject = FeatureManagement.checkPermission('AllowDeleteProjects');
        if(hasCustomPermissionProject){
            List<H2S__HarvestProject__c> delProjects=[SELECT Id FROM H2S__HarvestProject__c WHERE id=:row];
            if(delProjects.size()>0)
            {
                delete delProjects;
            }
        }
        return hasCustomPermissionProject;
    }
    @AuraEnabled
    public static Boolean deleteSSQRecord(String row)
    {
        Boolean hasCustomPermissionSSQ = FeatureManagement.checkPermission('AllowDeleteSSQ');
        if(hasCustomPermissionSSQ){
            List<Strategy_Session_Questionnaire__c> delSSQ=[SELECT Id FROM Strategy_Session_Questionnaire__c WHERE id=:row];
            if(delSSQ.size()>0)
            {
                delete delSSQ;
            }
        }
        return hasCustomPermissionSSQ;
    }
    @AuraEnabled
    public static Boolean deleteContactRecord(String row)
    {
        Boolean hasCustomPermissionContact = FeatureManagement.checkPermission('AllowDeleteContact');
        if(hasCustomPermissionContact){
            List<Contact> delContact=[SELECT Id FROM Contact WHERE id=:row];
            if(delContact.size()>0)
            {
                delete delContact;
            }
        }
        return hasCustomPermissionContact;
    }
    
    @AuraEnabled
    public static Boolean deleteFeedbackRecord(String row)
    {
        Boolean hasCustomPermissionContact = FeatureManagement.checkPermission('AllowDeleteFeedback');
        if(hasCustomPermissionContact){
            List<Contact> delContact=[SELECT Id FROM Contact WHERE id=:row];
            if(delContact.size()>0)
            {
                delete delContact;
            }
        }
        return hasCustomPermissionContact;
    }
}