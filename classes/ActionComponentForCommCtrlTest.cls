@isTest
public class ActionComponentForCommCtrlTest {

          @testSetup
    public static void createTestData() {
          Id devoppAsRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Anderson System Case').getRecordTypeId();
         Id devoppEnLivingTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
          Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
         Account a = new Account();
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        
      Insert a;
        List<Contact> conList=new List<Contact>();
          Contact con=new Contact();
        con.firstname='Bob';
        con.LastName='test last name';
        con.AccountId=a.id;
        con.phone='4448887789';
        conList.add(con);
          Contact con2=new Contact();
        con2.firstname='Apples';
        con2.LastName='test last name';
        con2.AccountId=a.id;
        con2.phone='4448887789';
         conList.add(con2);
        Insert conList;
          Case c1=new Case();
        c1.Subject='TEst As Case';
        C1.RecordTypeId=devoppAsRecordTypeId;
        c1.Info_Sent_to_ABA_By__c='Access';
        c1.QuickBooks_Version__c='QBO'; 
        c1.AccountID=a.id;
        c1.Status='New';
      Insert c1;
         Entities__c en=new Entities__c();
        en.RecordTypeId=devoppEnLivingTrustRecordTypeId;
        en.Name='Test Living Trust';
        en.Organization_State__c='Alabama';
        en.Primary_Client__c=a.id;
     insert en;
         Opportunity opp=new Opportunity();
        opp.RecordTypeId=devoppBkRecordTypeId;
        opp.CloseDate=system.today();
        opp.StageName='Closed Won';
        opp.AccountId=a.id;
        opp.Name='Test Bk Sale';
        insert opp;
        
    }
    @isTest
    static void TestactionLogACall(){
        Account a =[Select id,Name from account where First_Name__c='Bob' Limit 1];
         Case c =[Select id,Subject from Case where Subject='TEst As Case' Limit 1];
         Entities__c En =[Select id,Name from Entities__c where Name='Test Living Trust' Limit 1];
         Opportunity opp =[Select id,Name from Opportunity where Name='Test Bk Sale' Limit 1];
        Id profileID=[Select id,name from Profile where name='System Administrator' Limit 1].id;
        user u=[Select id,name from user where profileId=:profileID limit 1];
        test.startTest();
        ActionComponentForCommCtrl.getContactListPicklict(a.id);
        ActionComponentForCommCtrl.getContactListPicklict(c.id);
        ActionComponentForCommCtrl.getContactListPicklict(En.id);
        ActionComponentForCommCtrl.getContactListPicklict(opp.id);
         ActionComponentForCommCtrl.CreateTask(a.id, 'Comments',' subject', 'Bob test last name',u.id);
         ActionComponentForCommCtrl.CreateTask(c.id, 'Comments',' subject', 'Bob test last name',u.id);
        ActionComponentForCommCtrl.CreateTask(En.id, 'Comments',' subject', 'Bob test last name',u.id);
        ActionComponentForCommCtrl.CreateTask(opp.id, 'Comments',' subject', 'Bob test last name',u.id);
    }
}