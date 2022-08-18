@isTest
public class OwnerChangeComponentComCtrlTest {
    @testSetup
    public static void createTestData() {
        Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        Account a = new Account();
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        insert a;
        
        Opportunity opp=new Opportunity();
        opp.RecordTypeId=devoppBkRecordTypeId;
        opp.CloseDate=system.today();
        opp.StageName='Closed Won';
        opp.AccountId=a.id;
        opp.Name='Test Bk Sale';
        insert opp;
    }
    @isTest
    static void changeOwnerMethodTest()
    {
        Opportunity o =[Select id,Name from Opportunity where Name='Test Bk Sale' limit 1];
        test.startTest();
        Profile p=[Select id from profile where name ='System Administrator' limit 1];
        user u=[Select id from user where profileid =:p.id limit 1];
        OwnerChangeComponentComCtrl.changeOwnerMethod(o.id, u.id,'Opportunity');
        test.stopTest();
    }
    @isTest
    static void changeOwnerMethodLeadTest()
    {
        Campaign newCampaign = new Campaign();
        newCampaign.IsActive = True;
        newCampaign.Name = 'Code Coverage';
        newCampaign.Status = 'In Progress';
        insert newCampaign;
        
        Lead newLead = new Lead() ;
        newLead.FirstName = 'Swain';
        newLead.LastName = 'Cole';
        newLead.Company = 'Bluewave';
        newLead.Status = 'New Lead';
        newLead.Main_Lead_Source__c = 'Affiliate';
        newLead.Original_Campaign_Source__c = newCampaign.id;
        insert newLead;
        
        test.startTest();
        Profile p=[Select id from profile where name ='System Administrator' limit 1];
        user u=[Select id from user where profileid =:p.id limit 1];
        OwnerChangeComponentComCtrl.changeOwnerMethod(newLead.id, u.id,'Lead');
        test.stopTest();
    }
    @isTest
    static void changeOwnerMethodFeedbackTest()
    {
        System.assertEquals(false, FeatureManagement.checkPermission('Allow_Change_Owner_Feedback_Record'));
        
        PermissionSet ps = [SELECT Id FROM PermissionSet WHERE Name = 'Allow_Change_Owner_Feedback_Record'];
        PermissionSetAssignment psa = new PermissionSetAssignment(
            AssigneeId = UserInfo.getUserId(),
            PermissionSetId = ps.Id
        );
        //Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Client').getRecordTypeId();
        Account a = new Account();
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        a.OwnerId = psa.AssigneeId;
        insert a;
        
        // Account getAccountFromSetup = [Select id, name from Account where name='Bob Apple' limit 1];
        Id AdvisorAdminProfileID=[Select Id,name from profile where name='Anderson Profile' limit 1].id;
        
        //Id Advisoreuser=[select id from user where profileId=:AdvisorAdminProfileID limit 1].id;
        
        Id generalFeedbackRecordTypeId = Schema.SObjectType.Feedback__c.getRecordTypeInfosByName().get('NPS Survey Submission').getRecordTypeId();
        Feedback__c fb=new Feedback__c();
        fb.Name='Testing GF';
        fb.Client__c=a.Id;
        fb.RecordTypeId = generalFeedbackRecordTypeId;
        //fb.OwnerId = Advisoreuser;
        insert fb;
        test.startTest();
        Profile p=[Select id from profile where name ='System Administrator' limit 1];
        user u=[Select id from user where profileid =:p.id limit 1];
        //user u=[Select id from user where id='0056f00000AH2EzAAL' limit 1];
        OwnerChangeComponentComCtrl.changeOwnerMethod(fb.id, u.id,'Feedback__c');
        test.stopTest();
    }
    
    
}