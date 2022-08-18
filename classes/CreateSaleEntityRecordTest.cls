@isTest(SeeAllData=true)
public class CreateSaleEntityRecordTest {
    
    public static testmethod void testQuestionItemMethod1()
    {
        test.startTest();
         checkRecursive.runOnce();
        checkRecursive.runOnce1();
        checkRecursive.runOncetrgUpdateAccOppSourceType();
        checkRecursive.runOnceSetofBooks();
        Opportunity testOpportunity = new Opportunity();
           testOpportunity.Name= 'Case Opportunity';
      
        testOpportunity.StageName = 'Qualification';
        testOpportunity.CloseDate = Date.today()+1;
        insert testOpportunity;
        
        SaleEntity__c se = new SaleEntity__c();
        se.Name='Test';
        se.Opportunity__c=testOpportunity.id;
        insert se;
          SaleEntity__c se1 = new SaleEntity__c();
        se1.Name='Test2';
        se1.Opportunity__c=testOpportunity.id;
        insert se1;
        Entities__c et = new Entities__c();
        checkRecursive.run7=true;
        et.RecordTypeId = [SELECT Id, Name, DeveloperName, SobjectType FROM RecordType where Name = 'Limited Liability Company (LLC)' and SobjectType = 'Entities__c'].Id;
        et.Name = 'abc';
        et.Organization_State__c = 'Wyoming';
        et.Sale_Entity__c=se.id;
       
        //et.Sale__c = '00629000008vYM4';
        //et.Sale_Entity__c='a0s29000000sDlr';
        
        insert et;
      et.Sale_Entity__c=se1.id;
        update et;
        test.stopTest();
    }
    
}