@isTest
public class EntityRecordTypeSelectionCtrlTest {
    Public static Account a;
      Public static Case c;

 @testSetup
    public static void createTestData() {
          Id devBKCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
        a=new Account();
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
           insert a;
c=new Case();
        c.Subject='TEst BK Case';
        C.RecordTypeId=devBKCaseRecordTypeId;
        c.Info_Sent_to_ABA_By__c='Access';
        c.QuickBooks_Version__c='QBO';
        c.Account=a;
      c.Status='New';
        insert c;
     
    }
     @isTest
    static void TestNewEntity(){
         createTestData();
        test.startTest();
        EntityRecordTypeSelectionCtrl.fetchRecordTypeValues();
        EntityRecordTypeSelectionCtrl.getPrimaryClient(c.id);
        EntityRecordTypeSelectionCtrl.getRecTypeId('Limited Liability Company (LLC)');
        
        test.stopTest();
    }
}