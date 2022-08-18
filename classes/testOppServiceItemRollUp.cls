// SCH-0046 
@isTest
public class testOppServiceItemRollUp {
    
    @testSetup
    public static void createData() {
        
        Account a = new Account();
        a.Name = 'Bob Apples';
        a.BadgeServiceItems__c='hasCAP;';
        insert a;
        
        Opportunity o = new Opportunity();
        o.CloseDate = system.today();
        o.StageName = 'Qualification';
        o.AccountId = a.id;
        o.Service_Item_List__c='A00396;A00395;';
        o.Name = 'Test Opp';
        insert o;
        
        Id pricebookId = Test.getStandardPricebookId();
List<Product2> pList=new List<Product2>();
           Product2 pro1 = new Product2(Name='Privacy Trust with LLC Truste', ProductCode = 'Pro-X', isActive=true, Type__c ='TAX', welcome_call__c=true,Service_Fulfillment_Weight__c='1');
        pList.add(pro1);
    Product2 pro2 = new Product2(Name='Anderson Tax Advantage PRogram', ProductCode = 'Pro-X', isActive=true, Type__c ='TAX', welcome_call__c=true,Service_Fulfillment_Weight__c='1');
        pList.add(pro2);
        
    
         Product2 pro3 = new Product2(Name='Unlimited Nominee', ProductCode = 'Pro-y', isActive=true, Type__c ='LAW',welcome_call__c=true,Service_Fulfillment_Weight__c='1');
          pList.add(pro3);
         Product2 pro4 = new Product2(Name='Corporate Assistance Program, 1 Year, Initial', ProductCode = 'Pro-X', isActive=true, Type__c ='TAX', welcome_call__c=true,Service_Fulfillment_Weight__c='1');
        pList.add(pro4);

         Product2 pro5 = new Product2(Name='Corporate Assistance Program Annual Renewal', ProductCode = 'Pro-X', isActive=true, Type__c ='TAX', welcome_call__c=true,Service_Fulfillment_Weight__c='1');
        pList.add(pro5);
         Product2 pro6 = new Product2(Name='Test 2', ProductCode = 'Pro-2', isActive=true,Service_Fulfillment_Weight__c='1',Type__c='LAW');
        pList.add(pro6);
          Product2 pro7 = new Product2(Name='Investor Tax Planning Package', ProductCode = 'Pro-3', isActive=true,Service_Fulfillment_Weight__c='1',Type__c='LAW');
        pList.add(pro7);
  Product2 pro8 = new Product2(Name='Tax Services Retainer Replenishment', ProductCode = 'Pro-5', isActive=true,Service_Fulfillment_Weight__c='1',Type__c='LAW');
        pList.add(pro8);
         Product2 pro9 = new Product2(Name='LLC Trustee', ProductCode = 'Pro-5', isActive=true,Service_Fulfillment_Weight__c='1',Type__c='LAW');
        pList.add(pro9);
        Product2 pro10 = new Product2(Name='Opportunity Zone LLC', ProductCode = 'Pro-5', isActive=true,Service_Fulfillment_Weight__c='1',Type__c='LAW');
        pList.add(pro10);
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
                                      PricebookEntry pbe9 =new PricebookEntry(unitprice=0.01,Product2Id=pro9.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                         isActive=true,UseStandardPrice = false);
        priceList.add(pbe9);
         PricebookEntry pbe10 =new PricebookEntry(unitprice=0.01,Product2Id=pro10.Id,Pricebook2Id=Test.getStandardPricebookId(),
                                         isActive=true,UseStandardPrice = false);
        priceList.add(pbe10);
     insert priceList;
     
        
    }
 
        @isTest
  public static void testfutureupdateOLI(){
         
        Opportunity o = [SELECT Id,TAP_Service_Count__c,hasCAP__c FROM Opportunity where name='Test Opp'];
    
        Product2 p=[SELECT Id FROM Product2 where name ='Privacy Trust with LLC Truste'];
        Product2 p2=[SELECT Id FROM Product2 where name ='Unlimited Nominee'];
        Product2 p3=[SELECT Id FROM Product2 where name ='Anderson Tax Advantage PRogram'];
      Product2 p4=[SELECT Id FROM Product2 where name ='Corporate Assistance Program, 1 Year, Initial'];
       Product2 p5=[SELECT Id FROM Product2 where name ='Test 2'];
       Product2 p6=[SELECT Id FROM Product2 where name ='Investor Tax Planning Package'];
      Product2 p7=[SELECT Id FROM Product2 where name ='Tax Services Retainer Replenishment'];
       Product2 p8=[SELECT Id FROM Product2 where name ='LLC Trustee'];
       Product2 p9=[SELECT Id FROM Product2 where name ='Opportunity Zone LLC'];
        PricebookEntry pbe = [SELECT Id FROM PricebookEntry where Product2Id=:p.id ];
         PricebookEntry pbe2 = [SELECT Id FROM PricebookEntry where Product2Id=:p2.id ];
      PricebookEntry pbe3 = [SELECT Id FROM PricebookEntry where Product2Id=:p3.id ];
      PricebookEntry pbe4 = [SELECT Id FROM PricebookEntry where Product2Id=:p4.id ];
      PricebookEntry pbe5 = [SELECT Id FROM PricebookEntry where Product2Id=:p5.id ];
      PricebookEntry pbe6 = [SELECT Id FROM PricebookEntry where Product2Id=:p6.id ];
      PricebookEntry pbe7 = [SELECT Id FROM PricebookEntry where Product2Id=:p7.id ];
       PricebookEntry pbe8 = [SELECT Id FROM PricebookEntry where Product2Id=:p8.id ];
       PricebookEntry pbe9 = [SELECT Id FROM PricebookEntry where Product2Id=:p9.id ];
        List<OpportunityLineItem> opLIList=new  List<OpportunityLineItem>();
        OpportunityLineItem Opplineitem = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe.Id);
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
       OpportunityLineItem Opplineitem8 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe8.Id);
       
      opLIList.add(Opplineitem8);
       OpportunityLineItem Opplineitem9 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe9.Id);
       
      opLIList.add(Opplineitem9);
        test.startTest();
       
      insert opLIList;
         OppServiceItemRollUp.oppLineitemRollupProcessed.clear();
       p.Type__c='LAW';
      update p;
       
        OpportunityLineItem OLI =new OpportunityLineItem();
        OLI=  [SELECT Id FROM OpportunityLineItem where PriceBookEntryId=:pbe.Id];
        OLI.Quantity=2;
          update OLI;
       opportunity o2=[SELECT Id,TAP_Service_Count__c,hasCAP__c,Tax_Replenishment_Count__c FROM Opportunity where name='Test Opp'];

      OppServiceItemRollUp.oppLineitemRollupProcessed.clear();
      delete opLIList[1];
      
    //  system.assertEquals(1, o.TAP_Service_Count__c, 'Please Check!');
   
    
      
      test.stopTest();
         
        
    }  
      @isTest
  public static void testnonfutureOLIupdate(){
         set<ID> oppid=new set<Id>();
      Opportunity o = [SELECT Id,TAP_Service_Count__c,hasCAP__c FROM Opportunity where name='Test Opp'];
  
        Product2 p=[SELECT Id FROM Product2 where name ='Privacy Trust with LLC Truste'];
        Product2 p2=[SELECT Id FROM Product2 where name ='Unlimited Nominee'];
        Product2 p3=[SELECT Id FROM Product2 where name ='Anderson Tax Advantage PRogram'];
      Product2 p4=[SELECT Id FROM Product2 where name ='Corporate Assistance Program, 1 Year, Initial'];
       Product2 p5=[SELECT Id FROM Product2 where name ='Test 2'];
       Product2 p6=[SELECT Id FROM Product2 where name ='Investor Tax Planning Package'];
      Product2 p7=[SELECT Id FROM Product2 where name ='Tax Services Retainer Replenishment'];
       Product2 p8=[SELECT Id FROM Product2 where name ='LLC Trustee'];
       Product2 p9=[SELECT Id FROM Product2 where name ='Opportunity Zone LLC'];
        PricebookEntry pbe = [SELECT Id FROM PricebookEntry where Product2Id=:p.id ];
         PricebookEntry pbe2 = [SELECT Id FROM PricebookEntry where Product2Id=:p2.id ];
      PricebookEntry pbe3 = [SELECT Id FROM PricebookEntry where Product2Id=:p3.id ];
      PricebookEntry pbe4 = [SELECT Id FROM PricebookEntry where Product2Id=:p4.id ];
      PricebookEntry pbe5 = [SELECT Id FROM PricebookEntry where Product2Id=:p5.id ];
      PricebookEntry pbe6 = [SELECT Id FROM PricebookEntry where Product2Id=:p6.id ];
      PricebookEntry pbe7 = [SELECT Id FROM PricebookEntry where Product2Id=:p7.id ];
       PricebookEntry pbe8 = [SELECT Id FROM PricebookEntry where Product2Id=:p8.id ];
       PricebookEntry pbe9 = [SELECT Id FROM PricebookEntry where Product2Id=:p9.id ];
        List<OpportunityLineItem> opLIList=new  List<OpportunityLineItem>();
        OpportunityLineItem Opplineitem = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe.Id);
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
       OpportunityLineItem Opplineitem8 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe8.Id);
       
      opLIList.add(Opplineitem8);
       OpportunityLineItem Opplineitem9 = new OpportunityLineItem (Quantity=1, OpportunityId=o.Id,UnitPrice=0.01,PriceBookEntryId=pbe9.Id);
       
      opLIList.add(Opplineitem9);
        test.startTest();
       
      insert opLIList;
         OppServiceItemRollUp.oppLineitemRollupProcessed.clear();
       p.Type__c='LAW';
      update p;
       
        OpportunityLineItem OLI =new OpportunityLineItem();
        OLI=  [SELECT Id FROM OpportunityLineItem where PriceBookEntryId=:pbe.Id];
        OLI.Quantity=2;
          update OLI;
       opportunity o2=[SELECT Id,TAP_Service_Count__c,hasCAP__c,Tax_Replenishment_Count__c FROM Opportunity where name='Test Opp'];
        oppid.add(o2.id);

      OppServiceItemRollUp.oppLineitemRollupProcessed.clear();
   
      
    //  system.assertEquals(1, o.TAP_Service_Count__c, 'Please Check!');
   
    
      
      test.stopTest();
         
        
    }   
    
}