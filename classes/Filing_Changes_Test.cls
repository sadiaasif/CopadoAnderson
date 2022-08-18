@isTest
public class Filing_Changes_Test {
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
   static void TestaccordionDisplay(){
         Opportunity o =[Select id,Name from Opportunity where Name='Test Bk Sale' limit 1];
       test.startTest();
      Filing_Changes.getSale(o.id);
       test.stopTest();
   }

}