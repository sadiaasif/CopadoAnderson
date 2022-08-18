@isTest(SeeAllData=false)
private class EntityTriggerTest {
    
    public static Account testAccount = new Account();
    public static Contact cont = new Contact ();
    public static User uzr = new User();
    public static Opportunity testOpportunity = new Opportunity();
    public boolean isFirstTime=true;
    @istest
    public static void createTestData() {
        Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Id profileId = [select id from profile where name='Partner Community User'].id;
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        //testAccount.Assigned_CAM__c = 'Sara Winter';
        //testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.phone='123456782';
        insert testAccount;
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        insert cont;
        uzr.FirstName='Steve';
        uzr.LastName='Mark';
        uzr.Email='stevemark@gmail.com';
        uzr.Username='stevemark@gmail.com';
        uzr.Alias='autocase';
        uzr.CommunityNickname='Partner_Panelsss';
        uzr.TimeZoneSidKey='GMT';
        uzr.LocaleSidKey='en_US';
        uzr.EmailEncodingKey='UTF-8';
        uzr.LanguageLocaleKey='en_US';
        uzr.ContactId = cont.Id;
        uzr.ProfileId = profileId;
        uzr.IsActive =true;
        insert uzr;     
        testOpportunity.RecordTypeId=devoppBkRecordTypeId;
        testOpportunity.CloseDate=system.today();
        testOpportunity.StageName='Closed Won';
        testOpportunity.AccountId=testAccount.id;
        testOpportunity.Name='Test Bk Sale';   
        
        insert testOpportunity;
        User u = [Select Id From User Limit 1];
        Id recordTypeIdPensionPlan =Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
        Entities__c et;
        string penDate;
        List<Entities__c> entityList = new List<Entities__c>();
        for(integer i=1;i<=12;i++){
            et = new Entities__c();
            et.RecordTypeId = recordTypeIdPensionPlan;
            et.Name ='Test Dec Entity';
            et.Origin__c = 'Anderson';
            et.Primary_Client__c =testAccount.id;
            //et.Primary_Client__c =test
            et.Organization_State__c = 'Wyoming';
            et.Sale__c = testOpportunity.id;
            et.Status__c = 'Sent To Processing';
            et.Processing_Notes__c='19-11-2019 test1 ';
            //et.X5500_Due_Date__c=date.parse('1/31/2017');
            if(i<10)
            {
                penDate = '0'+i+'/01/2018';
            }
            else
            {
                penDate = i+'/01/2018'; 
            }
            
            et.Year_End__c = date.parse(penDate);
            et.Current_Plan_Year_End__c = date.parse(penDate);
            et.Organizer__c = u.Id;
            entityList.add(et);  
        }
        insert entityList;
    }
    
}