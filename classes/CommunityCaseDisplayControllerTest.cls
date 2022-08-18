@isTest
public class CommunityCaseDisplayControllerTest {

      public static account a=new Account();
   
        public static  Case c=new case();
       public static  CaseComment caseC=new CaseComment();
    
  @testSetup
    public static void createTestData() {
      
          Id devBKCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
           Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
         Id devoppAsRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Anderson System Case').getRecordTypeId();
          Id devoppEFRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
          Id devoppRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
         Id devoppstateRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
          Id devoppStdRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
          Id devoppPenRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
         Id devoppEntityFormRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        Id devoppEFSalesRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
          Id devoppTaxRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Tax Compliance').getRecordTypeId();
        Id devoppEnLandTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Land Trust').getRecordTypeId();
        Id devoppEnLivingTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
        Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Call').getRecordTypeId();
       
        
     
          
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        
     insert a;
          
     
      
        c.Subject='TEst BK Case';
        C.RecordTypeId=devBKCaseRecordTypeId;
        c.Info_Sent_to_ABA_By__c='Access';
        c.QuickBooks_Version__c='QBO';
        c.Account=a;
      c.Status='New';
       insert c;
        
      caseC.CommentBody='Test body';
        caseC.IsPublished=true;
      caseC.ParentId=c.id;
        insert caseC;
        
    }
     @isTest
    static void CasecommentDisplay(){
      createTestData();
        test.startTest();
 CommunityCaseDisplayController.addCaseComment(c.id, 'New');
        CommunityCaseDisplayController.getCaseComments(c.id);
         CommunityCaseDisplayController.EditCaseComment(caseC.id);
         CommunityCaseDisplayController.updateCaseComment(caseC.id, 'Testing');
         
        test.stopTest();
    }

}