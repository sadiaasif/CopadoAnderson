@isTest(SeeAllData=false)
private class testTaskTrigger
{
    @isTest
    static void taskTest()
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
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='prdudeja@gmail.com',
                          EmailEncodingKey='UTF-8', LastName='Dacanay',FirstName='Emily', LanguageLocaleKey='en_US',
                          LocaleSidKey='en_US', ProfileId = p.Id,
                          TimeZoneSidKey='America/Los_Angeles', UserName='prdudeja@gmail.com');
        
        //insert u;
        
        
        
        Task tt=new task();
        tt.OwnerId=userinfo.getuserid();
        tt.Subject='test task';
        tt.Status='Not Started';
        tt.Priority='Normal';
        tt.RecordTypeId=recordTypeID;
        //tt.Tax_Supervisor__c='Emily Dacanay';
        insert tt;
        
        
        
    }
    
    
    @isTest
    static void processingTest()
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
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='prdudeja@gmail.com',
                          EmailEncodingKey='UTF-8', LastName='Morris',FirstName='James', LanguageLocaleKey='en_US',
                          LocaleSidKey='en_US', ProfileId = p.Id,
                          TimeZoneSidKey='America/Los_Angeles', UserName='prdudeja@gmail.com');
        
        //insert u;
        
        Task tt=new task();
        tt.OwnerId=userinfo.getuserid();
        tt.Subject='test task';
        tt.Status='Not Started';
        tt.Priority='Normal';
        tt.RecordTypeId=recordTypeID;
        tt.Processors__c='James Morris';
        insert tt;
        
    }
    
    
    @isTest
    static void bookkeepingTest()
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
        
        
        
        Task tt=new task();
        tt.OwnerId=userinfo.getuserid();
        tt.Subject='test task';
        tt.Status='Not Started';
        tt.Priority='Normal';
        tt.RecordTypeId=recordTypeID;
        //tt.Bookkeeping_Reviewer__c='Marie Pues';
        insert tt;
        
    }
    
    
    @isTest
    static void andersonTest()
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
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='prdudeja@gmail.com',
                          EmailEncodingKey='UTF-8', LastName='Ronnander',FirstName='Whitney', LanguageLocaleKey='en_US',
                          LocaleSidKey='en_US', ProfileId = p.Id,
                          TimeZoneSidKey='America/Los_Angeles', UserName='prdudeja@gmail.com');
        
        //insert u;
        
        Task tt=new task();
        tt.OwnerId=userinfo.getuserid();
        tt.Subject='test task';
        tt.Status='Not Started';
        tt.Priority='Normal';
        tt.RecordTypeId=recordTypeID;
        //tt.CSR__c='Whitney Ronnander';
        insert tt;
        
    }
    
    
    
}