@isTest
public class consolidatedServiceItemsCtrlTest {
   @testSetup
    public static void createTestData() {
        List<Opportunity> opList=new  List<Opportunity>();
        List<Account> acList=new List<Account>();
        List<entities__c> enlist=new List<entities__c>();
        List<task> taskList=new List<task>();
        List<Case> Clist=new List<Case>();
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
       
        
          Id serviceProfileID=[Select Id,name from profile where name='Service' limit 1].id;
        Id serviceuser=[select id from user where profileId=:serviceProfileID limit 1].id;
         Id AdvisorAdminProfileID=[Select Id,name from profile where name='Advisor Admins' limit 1].id;
        Id Advisoreuser=[select id from user where profileId=:AdvisorAdminProfileID limit 1].id;
           Account a = new Account();
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        
       acList.add(a);
           Account a1 = new Account();
        a1.Name = 'Bob2 Apples2';
        a1.First_Name__c='Bob2';
        a1.Last_Name__c='Apples2';
        a1.Date_User_Advisor_Notes__c='Test Advisor notes';
        a1.Date_User_Partner_Notes__c='Test Partner Notes';
        a1.Bookkeeping_Notes__c='Test Bk Notes';
        a1.Service_Notes__c='Test Service Notes';
        a1.Tax_Notes__c='Test Tax Notes';
        a1.Renewal_Notes__c='Test Renewal Notes';
          a1.Update_Tax_Consult_Notes__c='Test tax consult Notes';
          a1.Update_Structure_Comments__c='Test Structure Notes';
          a1.Update_Keep_more_Solution__c='Test Keep more Solution Notes';
       acList.add(a1);
        insert acList;

       
         
        
       Entities__c en=new Entities__c();
        en.RecordTypeId=devoppEnLivingTrustRecordTypeId;
        en.Name='Test Living Trust';
        en.Organization_State__c='Alabama';
        en.Primary_Client__c=a.id;
       enlist.add(en);
           Entities__c en1=new Entities__c();
        en1.RecordTypeId=devoppEnLandTrustRecordTypeId;
        en1.Name='Test Land Trust';
         en1.Primary_Client__c=a.id;
        en1.Organization_State__c='Alabama';
        enlist.add(en1);

         
        insert enlist;
           Opportunity o = new Opportunity();
        o.CloseDate = system.today();
        o.StageName = 'Qualification';
        o.AccountId = a.id;
        o.Name = 'Test Opp';
        insert o;
     Id pricebookId = Test.getStandardPricebookId();
List<Product2> pList=new List<Product2>();
           Product2 pro1 = new Product2(Name='Test1', ProductCode = 'Pro-X', isActive=true, Type__c ='TAX', welcome_call__c=true);
        pList.add(pro1);
    Product2 pro2 = new Product2(Name='Anderson Tax Advantage PRogram', ProductCode = 'Pro-X', isActive=true, Type__c ='TAX', welcome_call__c=true);
        pList.add(pro2);
        
    
         Product2 pro3 = new Product2(Name='Test', ProductCode = 'Pro-y', isActive=true, Type__c ='LAW',welcome_call__c=true);
          pList.add(pro3);
         Product2 pro4 = new Product2(Name='Corporate Assistance Program, 1 Year, Initial', ProductCode = 'Pro-X', isActive=true, Type__c ='TAX', welcome_call__c=true);
        pList.add(pro4);

         Product2 pro5 = new Product2(Name='Corporate Assistance Program Annual Renewal', ProductCode = 'Pro-X', isActive=true, Type__c ='TAX', welcome_call__c=true);
        pList.add(pro5);
         Product2 pro6 = new Product2(Name='Test 2', ProductCode = 'Pro-2', isActive=true);
        pList.add(pro6);
          Product2 pro7 = new Product2(Name='Investor Tax Planning Package', ProductCode = 'Pro-3', isActive=true);
        pList.add(pro7);
  Product2 pro8 = new Product2(Name='200 Unit Tax Package Replenishment', ProductCode = 'Pro-5', isActive=true);
        pList.add(pro8);
    	insert pList;
       List<PricebookEntry> priceList=new  List<PricebookEntry>();
         PricebookEntry pbe1 =new PricebookEntry(unitprice=0.01,Product2Id=pro1.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                        isActive=true,UseStandardPrice = false);
         priceList.add(pbe1);
    PricebookEntry pbe2 =new PricebookEntry(unitprice=0.01,Product2Id=pro2.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                        isActive=true,UseStandardPrice = false);
         priceList.add(pbe2);
    
         PricebookEntry pbe3 =new PricebookEntry(unitprice=0.01,Product2Id=pro3.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                         isActive=true,UseStandardPrice = false);
        priceList.add(pbe3);  
         PricebookEntry pbe4 =new PricebookEntry(unitprice=0.01,Product2Id=pro4.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                         isActive=true,UseStandardPrice = false);
        priceList.add(pbe4);
         PricebookEntry pbe5 =new PricebookEntry(unitprice=0.01,Product2Id=pro5.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                         isActive=true,UseStandardPrice = false);
        priceList.add(pbe5);
         PricebookEntry pbe6 =new PricebookEntry(unitprice=0.01,Product2Id=pro6.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                         isActive=true,UseStandardPrice = false);
        priceList.add(pbe6);
        PricebookEntry pbe7 =new PricebookEntry(unitprice=0.01,Product2Id=pro7.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                         isActive=true,UseStandardPrice = false);
        priceList.add(pbe7);
         PricebookEntry pbe8 =new PricebookEntry(unitprice=0.01,Product2Id=pro8.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                         isActive=true,UseStandardPrice = false);
        priceList.add(pbe8);
     insert priceList;
    
        
       List<OpportunityLineItem> opLIList=new  List<OpportunityLineItem>();
        OpportunityLineItem Opplineitem = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe1.Id);
        opLIList.add(Opplineitem);
        OpportunityLineItem Opplineitem2 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe2.Id);
       opLIList.add(Opplineitem2);
      OpportunityLineItem Opplineitem3 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe3.Id);
       opLIList.add(Opplineitem3);
      OpportunityLineItem Opplineitem4 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe4.Id);
       
      opLIList.add(Opplineitem4);
      OpportunityLineItem Opplineitem5 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe5.Id);
       
      opLIList.add(Opplineitem5);
        OpportunityLineItem Opplineitem6 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe6.Id);
       
      opLIList.add(Opplineitem6);
      OpportunityLineItem Opplineitem7 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe7.Id);
       
      opLIList.add(Opplineitem7);
        insert opLIList;
                Case c=new Case();
        c.Subject='TEst Entity Case';
        C.RecordTypeId=devoppEFRecordTypeId;
        c.Sales__c=o.id;
        c.Account=a;
      c.Status='New';
       insert c;
       
    }
     @isTest
    static void TestSeveiceItemDisplay(){
        Case caseid =[Select id,subject from Case where subject='TEst Entity Case' limit 1];
        List<OpportunityLineItem> opList=[Select id from OpportunityLineItem where Opportunity.name= 'Test Opp' ];
        test.startTest();
       sObject sObj = Schema.getGlobalDescribe().get('OpportunityLineItem').newSObject() ;
        consolidatedServiceItemsCtrl.getseviceItems(caseid.Id);
        consolidatedServiceItemsCtrl.getseviceItemsStatuspicklist(sObj,'Status__c');
          consolidatedServiceItemsCtrl.saveoplt(opList);
        test.stopTest();
    }
}