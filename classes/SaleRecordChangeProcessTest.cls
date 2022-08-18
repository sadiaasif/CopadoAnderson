@isTest
public class SaleRecordChangeProcessTest {
    public static Campaign cam =new Campaign();
    public static Account acc =new Account();
    
     public static Product2 prod =new Product2();
      public static PricebookEntry pricebook =new PricebookEntry();
 public static Id devoppPlatinumSalesRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
 public static Id devopppensionTSalesRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();  
   public static Id devoppEFSalesRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
  public static    Id devoppEnCorpTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Corporation').getRecordTypeId();
   public static  Id devoppstateRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
     public static  Id devoppstdRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
     @testSetup
    public static void createTestData(){
        
         cam = (Campaign)TestDataFactory.createSObject('Campaign', new Map<String,Object>{
  'Name' => 'Existing Client',
  'IsActive' => True
     
}); 
             
             acc=    (Account)TestDataFactory.createSObject('Account', new Map<String,Object>{
   'First_Name__c'=>new List<String>{'Bobby1','Bobby2','Bobby3'},
  'Last_Name__c' => new List<String>{'Apples1','Apples2','Apples3'},
      'E_Mail__c'=>'abc@123.com',
 'Main_Lead_Source__c'=> 'Existing Client',
      'BadgeServiceItems__c'=>'',
       'PCV_PriorVal__c'=>''
     
}); 
  
         prod=(Product2)TestDataFactory.createSObject('Product2', new Map<String,Object>{
 
      'Name'=>'Pension Termination',
          'ProductCode' => 'Pro-9',
              'Family'=>'Entity Formation',
                  'Entity_Type__c'=>'Any',
              
              'isActive' => true
});
         pricebook=(PricebookEntry)TestDataFactory.createSObject('PricebookEntry', new Map<String,Object>{
 
      'Product2'=>prod,
          'unitprice' => 0.01,
          'Pricebook2Id'=>Test.getStandardPricebookId(),
          'isActive'=>True,
          'UseStandardPrice'=>false
       
});
        
    }
 @isTest
    public static void TestPlatinumSaleStageChangeNode2(){
        test.startTest();
        
       
        createTestData();
      opportunity      opp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'Platinum subscription',
    'ChargentSFA__Charge_Amount__c'=>35.00,
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppPlatinumSalesRecordTypeId,
     
  'Account' =>  acc
     
}); 
 opp.StageName='Closed Lost';
        opp.Closed_Lost_Reason__c='Non Payment';
        update opp;
        System.debug('test=='+opp.RecordTypeId);
       Account  updateoppclosedlost=[Select PCV_PriorVal__c from Account where id=:acc.Id ];
       
        System.assertEquals(null, updateoppclosedlost.PCV_PriorVal__c, 'Please check!');
        
      opp.StageName='Declined-';
        opp.ChargentSFA__Payment_Status__c='Error';
        update opp;
        List<opportunity> opUpadte=[Select StageName from opportunity where id=:opp.Id];
         System.debug('test2=='+opUpadte[0].StageName);
          Account  updateoppDecl=[Select PCV_PriorVal__c from Account where id=:acc.Id ];
       System.assertEquals('Declined', updateoppDecl.PCV_PriorVal__c, 'Please check!');
        List <Task> DeclinetaskList=[Select id,subject from task where subject='Declined Platinum Sale Follow Up'];
        System.assertEquals(1, DeclinetaskList.size(), 'Please check!');
        test.stopTest();
        

}
     @isTest
    public static void TestPensionTerminationSaleNode3AndNode4(){
        test.startTest();
        
       
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     
      'Name'=>'Test En 1',
          
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnCorpTypeId,
  'Primary_Client__c' => acc.id
});
      opportunity      Pensionopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'Test Pension Sale',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devopppensionTSalesRecordTypeId,
     
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
   OpportunityLineItem  oppLineItem=(OpportunityLineItem)TestDataFactory.createSObject('OpportunityLineItem', new Map<String,Object>{
 
      'Quantity'=>1,
          'Opportunity' => Pensionopp,
          'UnitPrice'=>1000.00,
          'Product_Family__c'=>'Entity Formation',
          'Product_Entity_Type__c'=>'Any',
          'PriceBookEntry'=>pricebook
    
});
       
          ChargentSFA__Transaction__c Tranaction=    (ChargentSFA__Transaction__c)TestDataFactory.createSObject('ChargentSFA__Transaction__c', new Map<String,Object>{
  'ChargentSFA__Gateway_ID__c' => '1234 ',
  'ChargentSFA__Opportunity__c' =>Pensionopp.id,
      'ChargentSFA__Gateway__c'=>TestDatafactoryBulk.Gateway.id,
      'ChargentSFA__Amount__c'=>1000.00 ,
      'ChargentSFA__Payment_Method__c'=>'Credit Card',
      'ChargentSFA__Response_Status__c'=>'Approved',
      'ChargentSFA__Type__c'=>'Charge'
     
}); 
     
        Opportunity updatedOpp=[Select id,StageName,Pension_Termination_Count__c from opportunity where id=:Pensionopp.Id];
        System.debug('Stahe=='+updatedOpp.StageName);
        System.assertEquals(1,updatedOpp.Pension_Termination_Count__c , 'Please check!');
   
        List<FlowInterview> flowInterviews = [SELECT Id FROM FlowInterview];
System.assert(flowInterviews.size()>0);
   /*Long startTime = DateTime.now().getTime();
Long finalTime = DateTime.now().getTime();
Long millisecondsToWait = 300000; 
while (finalTime - startTime < millisecondsToWait) {
finalTime = DateTime.now().getTime();
    i=i+1;
}
        System.debug('i=='+i);
      List< Task> t=[Select id from task where subject='Pension Termination Alert'] ;
        System.assertEquals(1,t.size() , 'Please check!');*/
      
        Entities__c Enupdate=[Select id,SLA__c from Entities__c where id=:en.id ];
        System.assertEquals('Admin Service', Enupdate.SLA__c, 'Please check!');
        test.stopTest();
        
        

}
         @isTest
    public static void TestFFUnlimiteStateFeeSaleCampaignNode5(){
        test.startTest();
        
       
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     
      'Name'=>'Test En 1',
          
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnCorpTypeId,
  'Primary_Client__c' => acc.id
});
      opportunity      Enopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
     'Main_Lead_Source__c'=>'Existing Client',
      'Name'=>'Test FF',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppEFSalesRecordTypeId,
     
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
        Opportunity updatedOpp=[Select id,Sale_Campaign__c from opportunity where id=:Enopp.Id];
     Campaign c=[Select id,name from campaign where name ='Existing Client' limit 1];
        System.assertEquals(c.id, updatedOpp.Sale_Campaign__c, 'Please check!');
        test.stopTest();
        
        

}
     @isTest
    public static void TestPaymentPlanStatusChangeclosewon6(){
        test.startTest();
        
       
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     
      'Name'=>'Test En 1',
          
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnCorpTypeId,
  'Primary_Client__c' => acc.id
});
      opportunity      Pensionopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'Test Pension Sale',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppEFSalesRecordTypeId,
     
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
   OpportunityLineItem  oppLineItem=(OpportunityLineItem)TestDataFactory.createSObject('OpportunityLineItem', new Map<String,Object>{
 
      'Quantity'=>1,
          'Opportunity' => Pensionopp,
          'UnitPrice'=>1000,
          'Product_Family__c'=>'Entity Formation',
          'Product_Entity_Type__c'=>'Any',
          'PriceBookEntry'=>pricebook
    
});
       
          ChargentSFA__Transaction__c Tranaction=    (ChargentSFA__Transaction__c)TestDataFactory.createSObject('ChargentSFA__Transaction__c', new Map<String,Object>{
  'ChargentSFA__Gateway_ID__c' => '1234 ',
  'ChargentSFA__Opportunity__c' =>Pensionopp.id,
      'ChargentSFA__Gateway__c'=>TestDatafactoryBulk.Gateway.id,
      'ChargentSFA__Amount__c'=>1000.00 ,
      'ChargentSFA__Payment_Method__c'=>'Credit Card',
      'ChargentSFA__Response_Status__c'=>'Approved',
      'ChargentSFA__Type__c'=>'Charge'
     
}); 
      
        Opportunity updatedOpp=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c  from opportunity where id=:Pensionopp.Id];
        Account a= [Select Payment_Plan_Tracker__c from Account where id=:acc.id];
       System.debug('test=='+updatedOpp.ChargentSFA__Payment_Status__c);
          System.debug('test=='+updatedOpp.StageName);
        System.assertEquals(null, updatedOpp.ChargentSFA__Payment_End_Date__c, 'Please Check!!');
         System.assertEquals(null, a.Payment_Plan_Tracker__c, 'Please Check!!');
    
        test.stopTest();
        
        

}
     @isTest
    public static void TestPaymentPlanStatusChangeErrorrecurringotherNode6(){
        test.startTest();
        
       
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     
      'Name'=>'Test En 1',
          
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnCorpTypeId,
  'Primary_Client__c' => acc.id
});
      opportunity      Pensionopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'Test Pension Sale',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppEFSalesRecordTypeId,
     
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
   OpportunityLineItem  oppLineItem=(OpportunityLineItem)TestDataFactory.createSObject('OpportunityLineItem', new Map<String,Object>{
 
      'Quantity'=>1,
          'Opportunity' => Pensionopp,
          'UnitPrice'=>1000,
          'Product_Family__c'=>'Entity Formation',
          'Product_Entity_Type__c'=>'Any',
          'PriceBookEntry'=>pricebook
    
});
     
      
      
        //Error
        Pensionopp.ChargentSFA__Payment_Status__c='Error';
        update Pensionopp;
         Opportunity updatedOpp=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c  from opportunity where id=:Pensionopp.Id];
         Account a= [Select Payment_Plan_Tracker__c from Account where id=:acc.id];
        System.debug('Paymentstatus=='+updatedOpp.ChargentSFA__Payment_Status__c);
        System.assertEquals('Payment Declined', a.Payment_Plan_Tracker__c, 'Please Check!!');
        //Recurring 
/*         Pensionopp.ChargentSFA__Payment_Status__c='Recurring';
        update Pensionopp;
         Opportunity updatedOppRecurring=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c  from opportunity where id=:Pensionopp.Id];
         Account aRecurring= [Select Payment_Plan_Tracker__c from Account where id=:acc.id];
        System.debug('Paymentstatus=='+updatedOppRecurring.ChargentSFA__Payment_Status__c);
         System.assertEquals('Payment Current', aRecurring.Payment_Plan_Tracker__c, 'Please Check!!');*/
        //Complete
      Pensionopp.ChargentSFA__Payment_Status__c='Complete';
        update Pensionopp;
         Opportunity updatedoppComplete=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c  from opportunity where id=:Pensionopp.Id];
         Account aComplete= [Select Payment_Plan_Tracker__c from Account where id=:acc.id];
        System.debug('Paymentstatus=='+updatedoppComplete.ChargentSFA__Payment_Status__c);
         System.assertEquals(null, aComplete.Payment_Plan_Tracker__c, 'Please Check!!');
        test.stopTest();
  }
        @isTest
    public static void TestWholesaleDocumentKitNode7(){
        test.startTest();
        
       
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     
      'Name'=>'Test En 1',
          
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnCorpTypeId,
  'Primary_Client__c' => acc.id
});
      opportunity      Wholesaleopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'Wholesale Document Kit',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppEFSalesRecordTypeId,
     
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
          Product2   Wholesaleprod=(Product2)TestDataFactory.createSObject('Product2', new Map<String,Object>{
 
      'Name'=>'Wholesale Document Kit',
          'ProductCode' => 'Pro-10',
              'Family'=>'Entity Formation',
                  'Entity_Type__c'=>'Any',
          'Description'=>'Wholesale Doc Kit',
              
              'isActive' => true
});
      PricebookEntry    Wholesalepricebook=(PricebookEntry)TestDataFactory.createSObject('PricebookEntry', new Map<String,Object>{
 
      'Product2'=>Wholesaleprod,
          'unitprice' => 1000,
          'Pricebook2Id'=>Test.getStandardPricebookId(),
          'isActive'=>True,
          'UseStandardPrice'=>false
       
});
   OpportunityLineItem  oppLineItem=(OpportunityLineItem)TestDataFactory.createSObject('OpportunityLineItem', new Map<String,Object>{
 
      'Quantity'=>1,
          'Opportunity' => Wholesaleopp,
          'UnitPrice'=>1000,
          'Product_Family__c'=>'Entity Formation',
          'Product_Entity_Type__c'=>'Any',
          'PriceBookEntry'=>Wholesalepricebook
    
});
     
        ChargentSFA__Transaction__c WholesaleTranaction=    (ChargentSFA__Transaction__c)TestDataFactory.createSObject('ChargentSFA__Transaction__c', new Map<String,Object>{
  'ChargentSFA__Gateway_ID__c' => '1234 ',
  'ChargentSFA__Opportunity__c' =>Wholesaleopp.id,
      'ChargentSFA__Gateway__c'=>TestDatafactoryBulk.Gateway.id,
      'ChargentSFA__Amount__c'=>1000.00 ,
      'ChargentSFA__Payment_Method__c'=>'Credit Card',
      'ChargentSFA__Response_Status__c'=>'Approved',
      'ChargentSFA__Type__c'=>'Charge'
     
}); 
      
        
      
         Opportunity updatedOpp=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c,Wholesale_Doc_Kit__c  from opportunity where id=:Wholesaleopp.Id];
         Account a= [Select Payment_Plan_Tracker__c from Account where id=:acc.id];
        System.debug('Paymentstatus=='+updatedOpp.StageName);
      
            List<FlowInterview> flowInterviews = [SELECT Id FROM FlowInterview];
        System.assertEquals(1, updatedOpp.Wholesale_Doc_Kit__c, 'Please check!');
System.assert(flowInterviews.size()>0);
      
      
        test.stopTest();
  }
      @isTest
    public static void TexasStateRenewalClosedWonNode8(){
        test.startTest();
        
       
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     
      'Name'=>'Test En 1',
          
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnCorpTypeId,
  'Primary_Client__c' => acc.id
});
      opportunity      Wholesaleopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'State Renewal TX',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppEFSalesRecordTypeId,
    'Renewal_Effective_Date__c' => Date.newInstance(2019, 05, 16),
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
          Product2   Wholesaleprod=(Product2)TestDataFactory.createSObject('Product2', new Map<String,Object>{
 
      'Name'=>'Wholesale Document Kit',
          'ProductCode' => 'Pro-10',
              'Family'=>'Entity Formation',
                  'Entity_Type__c'=>'Any',
          'Description'=>'Wholesale Doc Kit',
              
              'isActive' => true
});
      PricebookEntry    Wholesalepricebook=(PricebookEntry)TestDataFactory.createSObject('PricebookEntry', new Map<String,Object>{
 
      'Product2'=>Wholesaleprod,
          'unitprice' => 1000,
          'Pricebook2Id'=>Test.getStandardPricebookId(),
          'isActive'=>True,
          'UseStandardPrice'=>false
       
});
   OpportunityLineItem  oppLineItem=(OpportunityLineItem)TestDataFactory.createSObject('OpportunityLineItem', new Map<String,Object>{
 
      'Quantity'=>1,
          'Opportunity' => Wholesaleopp,
          'UnitPrice'=>1000,
          'Product_Family__c'=>'Entity Formation',
          'Product_Entity_Type__c'=>'Any',
          'PriceBookEntry'=>Wholesalepricebook
    
});
     
        ChargentSFA__Transaction__c WholesaleTranaction=    (ChargentSFA__Transaction__c)TestDataFactory.createSObject('ChargentSFA__Transaction__c', new Map<String,Object>{
  'ChargentSFA__Gateway_ID__c' => '1234 ',
  'ChargentSFA__Opportunity__c' =>Wholesaleopp.id,
      'ChargentSFA__Gateway__c'=>TestDatafactoryBulk.Gateway.id,
      'ChargentSFA__Amount__c'=>1000.00 ,
      'ChargentSFA__Payment_Method__c'=>'Credit Card',
      'ChargentSFA__Response_Status__c'=>'Approved',
      'ChargentSFA__Type__c'=>'Charge'
     
}); 
      
        
      
         Opportunity updatedOpp=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c,Wholesale_Doc_Kit__c  from opportunity where id=:Wholesaleopp.Id];
         Account a= [Select Payment_Plan_Tracker__c from Account where id=:acc.id];
        System.debug('Paymentstatus=='+updatedOpp.StageName);
      
       List<Task> tasklist=[Select id,subject from task where subject='Texas Franchise Tax Task' ];
        System.assertEquals(1, tasklist.size(), 'Please check!');

        test.stopTest();
  }
       @isTest
    public static void TXFWSWorksheetSubmittedNode9(){
        test.startTest();
        
       
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     
      'Name'=>'Test En 1',
          
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>devoppEnCorpTypeId,
  'Primary_Client__c' => acc.id
});
      opportunity      stateRenewalsaleopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'State Renewal TX',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppstateRRecordTypeId,
   
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 

  
    
         task     TexasFranchiseTask=    (task)TestDataFactory.createSObject('task', new Map<String,Object>{
 'Subject'=>'Texas Franchise Tax Task',
     'WhatId'=>stateRenewalsaleopp.id,
     'RecordTypeID'=>'0120B000000t7ppQAA'
     
}); 
      stateRenewalsaleopp.Submitted_Worksheet__c='Submitted';
        update stateRenewalsaleopp;
        
      
         Opportunity updatedOpp=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c,Wholesale_Doc_Kit__c  from opportunity where id=:stateRenewalsaleopp.Id];
       
      
       List<Task> tasklist=[Select id,subject,Processing_Stage__c from task where subject='Texas Franchise Tax Task'  ];
        System.debug('task=='+ tasklist.size());
        System.assertEquals('Worksheet Received, Please File', tasklist[0].Processing_Stage__c, 'Please check!');
        test.stopTest();
  } 
          @isTest
    public static void StateRenewalAnnualList10(){
        test.startTest();
     
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',    
      'Name'=>'Test En 1',   
      'Organization_State__c' =>  'Wyoming',
        
  'Primary_Client__c' => acc.id
});
      opportunity      AnnualListsaleopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'State Renewal TX',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppstateRRecordTypeId,
  
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
                  Product2   AnnualListsaleprod=(Product2)TestDataFactory.createSObject('Product2', new Map<String,Object>{
 
      'Name'=>'Annual List',
          'ProductCode' => 'Pro-10',
              'Family'=>'Entity Formation',
                  'Entity_Type__c'=>'LIST00',
          'Description'=>'State-imposed filing fee charged by the Secretary of State, on an annual basis, often referred to as an Annual Report.',
              
              'isActive' => true
});
      PricebookEntry    AnnualListpricebook=(PricebookEntry)TestDataFactory.createSObject('PricebookEntry', new Map<String,Object>{
 
      'Product2'=>AnnualListsaleprod,
          'unitprice' => 1000,
          'Pricebook2Id'=>Test.getStandardPricebookId(),
          'isActive'=>True,
          'UseStandardPrice'=>false
       
});
          OpportunityLineItem  oppLineItem=(OpportunityLineItem)TestDataFactory.createSObject('OpportunityLineItem', new Map<String,Object>{
 
      'Quantity'=>1,
          'Opportunity' => AnnualListsaleopp,
          'UnitPrice'=>1000,
          'Product_Family__c'=>'Entity Formation',
          'Product_Entity_Type__c'=>'Any',
          'PriceBookEntry'=>AnnualListpricebook
    
});
       
        ChargentSFA__Transaction__c AnnualListTranaction=    (ChargentSFA__Transaction__c)TestDataFactory.createSObject('ChargentSFA__Transaction__c', new Map<String,Object>{
  'ChargentSFA__Gateway_ID__c' => '1234 ',
  'ChargentSFA__Opportunity__c' =>AnnualListsaleopp.id,
      'ChargentSFA__Gateway__c'=>TestDatafactoryBulk.Gateway.id,
      'ChargentSFA__Amount__c'=>1000.00 ,
      'ChargentSFA__Payment_Method__c'=>'Credit Card',
      'ChargentSFA__Response_Status__c'=>'Approved',
      'ChargentSFA__Type__c'=>'Charge'
     
}); 
         Opportunity updatedOpp=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c,Wholesale_Doc_Kit__c  from opportunity where id=:AnnualListsaleopp.Id];
       System.debug('updatedOpp=='+updatedOpp.StageName);
        System.debug('updatedOpp=='+updatedOpp.ChargentSFA__Transaction_Total__c);
           System.debug('updatedOpp=='+updatedOpp.ChargentSFA__Balance_Due__c);
      
       List<Task> tasklist=[Select id,subject from task where WhatID=:en.id  ];
        System.debug('task=='+ tasklist.size());
        System.assertEquals(1, tasklist.size(), 'Please check!');

        test.stopTest();
  } 
      @isTest
    public static void TestRegisteredAgentResignationCloseLostNode11and12(){
        test.startTest();
     
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',    
      'Name'=>'Test En 1',   
      'Organization_State__c' =>  'Wyoming',
        
  'Primary_Client__c' => acc.id
});
      opportunity      RAsaleopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'State Renewal TX',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppstateRRecordTypeId,
  
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
                  Product2   RAsaleprod=(Product2)TestDataFactory.createSObject('Product2', new Map<String,Object>{
 
      'Name'=>'Registered Agent Service',
          'ProductCode' => 'RA100',
              'Family'=>'Entity Formation',
              
          'Description'=>'This is the fee for Anderson to serve as your Registered Agent. It is required by law to have a registered agent.',
              
              'isActive' => true
});
      PricebookEntry    RApricebook=(PricebookEntry)TestDataFactory.createSObject('PricebookEntry', new Map<String,Object>{
 
      'Product2'=>RAsaleprod,
          'unitprice' => 1000,
          'Pricebook2Id'=>Test.getStandardPricebookId(),
          'isActive'=>True,
          'UseStandardPrice'=>false
       
});
          OpportunityLineItem  oppLineItem=(OpportunityLineItem)TestDataFactory.createSObject('OpportunityLineItem', new Map<String,Object>{
 
      'Quantity'=>1,
          'Opportunity' => RAsaleopp,
        
          'Product_Family__c'=>'Entity Formation',
          'Product_Entity_Type__c'=>'Any',
          'PriceBookEntry'=>RApricebook,
          'Description'=>'This service allows Anderson Registered Agents to act as your business\'s point of contact for state and legal matters such as state renewals, notices, and legal service of process. A registered agent is required on all entity filings within every state.',
          'TotalPrice'=>1000
    
});
       RAsaleopp.StageName='Closed Lost';
        RAsaleopp.Closed_Lost_Reason__c='Non Payment';
        update RAsaleopp;
       Opportunity updatedOpp=[Select id,StageName,Registered_Agent__c,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c,Wholesale_Doc_Kit__c  from opportunity where id=:RAsaleopp.Id];
        System.debug('oppLineItem=='+updatedOpp.StageName);
      System.debug('Registered_Agent__c=='+updatedOpp.Registered_Agent__c);
         System.debug('Description=='+oppLineItem.Description);
       List<Task> tasklist=[Select id,subject from task where whatID=:updatedOpp.id ];
        System.debug('task=='+ tasklist.size());
        System.assertEquals(1, tasklist.size(), 'Please check!');
        
        ChargentSFA__Transaction__c AnnualListTranaction=    (ChargentSFA__Transaction__c)TestDataFactory.createSObject('ChargentSFA__Transaction__c', new Map<String,Object>{
  'ChargentSFA__Gateway_ID__c' => '1234 ',
  'ChargentSFA__Opportunity__c' =>RAsaleopp.id,
      'ChargentSFA__Gateway__c'=>TestDatafactoryBulk.Gateway.id,
      'ChargentSFA__Amount__c'=>1000.00 ,
      'ChargentSFA__Payment_Method__c'=>'Credit Card',
      'ChargentSFA__Response_Status__c'=>'Approved',
      'ChargentSFA__Type__c'=>'Charge'
      
}); 
  List<FlowInterview> flowInterviews = [SELECT Id FROM FlowInterview];
System.assert(flowInterviews.size()>0);
        test.stopTest();
  } 
    @isTest
    public static void TestUnlimitedLandTrustsandLivingTrustAmendsNode13(){
        test.startTest();
     
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',    
      'Name'=>'Test En 1',   
      'Organization_State__c' =>  'Wyoming',
        
  'Primary_Client__c' => acc.id
});
      opportunity      UnlimitedLivingTrussaleopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'State Renewal TX',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppstateRRecordTypeId,
  
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
                  Product2   UnlimitedLivingTrussaleprod=(Product2)TestDataFactory.createSObject('Product2', new Map<String,Object>{
 
      'Name'=>'Unlimited Living Trust Amendments',
          'ProductCode' => 'ULTA',
              'Family'=>'Entity Formation',
              
          'Description'=>'Unlimited estate planning document changes for the life of the client. Limited to one change per year and available only for living trusts created by Anderson.',
              
              'isActive' => true
});
      PricebookEntry    RApricebook=(PricebookEntry)TestDataFactory.createSObject('PricebookEntry', new Map<String,Object>{
 
      'Product2'=>UnlimitedLivingTrussaleprod,
          'unitprice' => 1000,
          'Pricebook2Id'=>Test.getStandardPricebookId(),
          'isActive'=>True,
          'UseStandardPrice'=>false
       
});
          OpportunityLineItem  oppLineItem=(OpportunityLineItem)TestDataFactory.createSObject('OpportunityLineItem', new Map<String,Object>{
 
      'Quantity'=>1,
          'Opportunity' => UnlimitedLivingTrussaleopp,
          'UnitPrice'=>1000,
          'Product_Family__c'=>'Entity Formation',
          'Product_Entity_Type__c'=>'Any',
          'PriceBookEntry'=>RApricebook
    
});
    
      
     
        
        ChargentSFA__Transaction__c AnnualListTranaction=    (ChargentSFA__Transaction__c)TestDataFactory.createSObject('ChargentSFA__Transaction__c', new Map<String,Object>{
  'ChargentSFA__Gateway_ID__c' => '1234 ',
  'ChargentSFA__Opportunity__c' =>UnlimitedLivingTrussaleopp.id,
      'ChargentSFA__Gateway__c'=>TestDatafactoryBulk.Gateway.id,
      'ChargentSFA__Amount__c'=>1000.00 ,
      'ChargentSFA__Payment_Method__c'=>'Credit Card',
      'ChargentSFA__Response_Status__c'=>'Approved',
      'ChargentSFA__Type__c'=>'Charge'
     
}); 
  List<FlowInterview> flowInterviews = [SELECT Id FROM FlowInterview];
System.assert(flowInterviews.size()>0);
        Opportunity updatedOpp=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c,Wholesale_Doc_Kit__c  from opportunity where id=:UnlimitedLivingTrussaleopp.Id];
        Account a=[Select Unlimited_Living_Trust_Status__c from account where id=:acc.id ];
        System.assertEquals('ULTACTIVE', a.Unlimited_Living_Trust_Status__c, 'Please Check!');
        test.stopTest();
  } 
      @isTest
    public static void TestPopulateRenewalStateFieldNode14(){
        test.startTest();
     
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',    
      'Name'=>'Test En 1',   
      'Organization_State__c' =>  'Wyoming',
        
  'Primary_Client__c' => acc.id
});
      opportunity      UnlimitedLivingTrussaleopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'State Renewal TX',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppstateRRecordTypeId,
  
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
    
    
        Opportunity updatedOpp=[Select id,StageName,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,Renewal_State__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c,Wholesale_Doc_Kit__c  from opportunity where id=:UnlimitedLivingTrussaleopp.Id];
        
        System.assertEquals(En.Organization_State__c, updatedOpp.Renewal_State__c, 'Please Check!');
        test.stopTest();
  } 
      @isTest
    public static void TestConsultScheduledScheduledBy15(){
        test.startTest();
     
        createTestData();
          Entities__c   En =(Entities__c) TestDataFactory.createSObject('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',    
      'Name'=>'Test En 1',   
      'Organization_State__c' =>  'Wyoming',
        
  'Primary_Client__c' => acc.id
});
      opportunity      UnlimitedLivingTrussaleopp=    (opportunity)TestDataFactory.createSObject('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>'State Renewal TX',
   
      'StageName' =>  'Qualification',
          'RecordTypeID'=>devoppstateRRecordTypeId,
  
  'Account' =>  acc,
      'Entity__c'=>en.id
     
}); 
   UnlimitedLivingTrussaleopp.Consult_Date__c=system.today();
        update UnlimitedLivingTrussaleopp;
    
        Opportunity updatedOpp=[Select id,StageName,Lead_Status__c,Amount,Pension_Termination_Count__c,ChargentSFA__Balance_Due__c,ChargentSFA__Transaction_Total__c,Renewal_State__c,ChargentSFA__Total__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_End_Date__c,Wholesale_Doc_Kit__c  from opportunity where id=:UnlimitedLivingTrussaleopp.Id];
        
        System.assertEquals('Scheduled', updatedOpp.Lead_Status__c, 'Please Check!');
        test.stopTest();
  } 
    
}