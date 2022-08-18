@isTest
public class SyncPlantinumandSfctrlTest {
 @testSetup static void createTestData() {
          List<opportunity> oppList=new List<Opportunity>();
        List<OpportunityLineItem> opLineitemlist=new List<OpportunityLineItem>();
      Id pricebookId = Test.getStandardPricebookId();
     Account a = new Account();
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apples';
        a.Name = '123';
        a.E_Mail__c = 'bazam123@gmail.com';
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.id;
        c.FirstName = 'Bob';
        c.LastName = 'Apples';
        c.Email = 'bazam123@gmail.com';
        c.Account_Roles__c = 'Primary Contact';
     c.Service_Item_List__c='A09275';
        insert c;
         Opportunity opp=new Opportunity();
        opp.Name='Test Sale 1';
        opp.AccountId=a.id;
         
        opp.RecordTypeId='012U0000000DhZQIA0';
        opp.StageName='Qualification';
        opp.CloseDate = Date.Today();
        oppList.add(opp);
        
         Opportunity opp2=new Opportunity();
        opp2.Name='Test Sale 2';
        opp2.AccountId=a.id;
        opp2.RecordTypeId='012U0000000DhZzIAK';
         opp2.StageName='Closed Won';
        opp2.CloseDate = Date.Today();
        oppList.add(opp2);
        
        Opportunity opp3=new Opportunity();
        opp3.Name='Test Sale 3';
        opp3.AccountId=a.id;
        opp3.RecordTypeId='012U0000000DFSx';
         opp3.StageName='Closed Won';
        opp3.CloseDate = Date.Today();
        oppList.add(opp3);
     
      Opportunity o = new Opportunity();
        o.AccountId = a.Id;
        o.Name = 'Platinum Subscription';
        o.CloseDate = system.today();
        o.StageName = 'Closed Won';
        o.RecordTypeId = Schema.SObjectType.opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
          oppList.add(o);
       
      
        
   insert oppList;
       
      
     List<Product2> products=new List<Product2>();
Product2 prod = new Product2(
     Name = 'Tax Toolbox',
     ProductCode = 'Pro-X',
     isActive = true,
    welcome_call__c=true,
    Type__c ='Tax',
    Service_Fulfillment_Weight__c='1'
    
);
        products.add(prod);
        Product2 prod1 = new Product2(
     Name = 'Anderson Funding Community',
     ProductCode = 'Pro-X',
     isActive = true,
    welcome_call__c=true,
    Type__c ='Law',
             Service_Fulfillment_Weight__c='1'
        
    
);
         products.add(prod1);
        
insert products;
     List<PricebookEntry> pbList=new List<PricebookEntry>();
PricebookEntry pbEntry1 = new PricebookEntry(
     Pricebook2Id = pricebookId,
     Product2Id = products[0].Id,
     UnitPrice = 100.00,
     IsActive = true
);
        pbList.add(pbEntry1);  
        PricebookEntry pbEntry2 = new PricebookEntry(
     Pricebook2Id = pricebookId,
     Product2Id = products[1].Id,
     UnitPrice = 100.00,
     IsActive = true
);
      pbList.add(pbEntry2);  

insert pbList;
     OpportunityLineItem oli1 = new OpportunityLineItem(
     OpportunityId = oppList[0].Id,
   
     Quantity = 5,
     PricebookEntryId = pbList[0].Id,
     TotalPrice =  pbList[0].UnitPrice
);
        opLineitemlist.add(oli1);
        
        OpportunityLineItem oli2 = new OpportunityLineItem(
     OpportunityId = oppList[1].Id,
     Quantity = 5,
     PricebookEntryId =pbList[1].Id,
     TotalPrice =  pbList[1].UnitPrice
);
     insert opLineitemlist; 
        
    }
    
      @isTest static void testPostCallout() {
        List<id> conids=new List<id>();
        Id accId =[SELECT Id FROM Account]?.id;
        Id conId = [SELECT Id FROM Contact]?.id;
        Id oppId = [SELECT Id FROM Opportunity where name ='Platinum Subscription']?.id;
          String conEmail=[SELECT Email FROM Contact]?.Email;
          string sfsalestage=String.valueOf([SELECT Platinum_Sale_Closed_Won__c from account]?.Platinum_Sale_Closed_Won__c);
        conids.add(conId);
      test.startTest();
        Test.setMock(HttpCalloutMock.class, new wordpressUpdateMetaCalloutMock());
          SyncPlantinumandSfctrl.wordpressplatinumListWrapper testsyncwrapper= new   SyncPlantinumandSfctrl.wordpressplatinumListWrapper();
            SyncPlantinumandSfctrl.syncPlatinumandsf('1',accId,oppId,conId,sfsalestage);
//SyncPlantinumandSfctrl.SFplatinumListWrapper getmetaval= new SyncPlantinumandSfctrl.SFplatinumListWrapper();
 SyncPlantinumandSfctrl.getPlatinumUserdetailsfromwordpress('1',accId,oppId,conId,sfsalestage);
   SyncPlantinumandSfctrl.getSfplatimumdetails(accId);
          SyncPlantinumandSfctrl.checkforDigitalservice(accId);
          SyncPlantinumandSfctrl.updatedigitalproductsoncon(conId,'A09275');
            SyncPlantinumandSfctrl.updatedigitalproductsoncon(conId,'A09275');
            SyncPlantinumandSfctrl.updatedigitalproductsoncon(conId,'A09275');
           SyncPlantinumandSfctrl.generaterandomPassword(accId);
          SyncPlantinumandSfctrl.getcreateuserdetailsfromcontact(accId);
           SyncPlantinumandSfctrl.createPlatinumUser(conids);
           SyncPlantinumandSfctrl.createPlatinumUser(conids);
         SyncPlantinumandSfctrl.sendUpdate(conId,conEmail);
          SyncPlantinumandSfctrl.processEmail(conEmail,'123',accId);
        test.stopTest();
       
    }
}