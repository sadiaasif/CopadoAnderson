@isTest
public class TestDatafactoryBulk {
    public static  List<User> uList=new  List<User>();
   public static List<Account> accList=new  List<Account>();
     public static List<Contact> conList=new  List<Contact>();
     public static List<Case> caseList=new  List<Case>();
    public static List<opportunity> oppList=new  List<opportunity>();
    public static List<Product2> productList=new  List<Product2>();
     public static List<PricebookEntry> pricebookList=new  List<PricebookEntry>();
     public static List<OpportunityLineItem> oppLineItemList=new  List<OpportunityLineItem>();
      public static List<Entities__c> EnItemList=new  List<Entities__c>();
     public static ChargentBase__Gateway__c Gateway=new ChargentBase__Gateway__c();
    @testSetup
    public static void createTestData(){
        Id devBKCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
           Id devoppBkRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Bookkeeping').getRecordTypeId();
         Id devoppAsRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Anderson System Case').getRecordTypeId();
          Id devoppEFRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
          Id devoppPlatinumRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Platinum Subscription').getRecordTypeId();
         Id devoppstateRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('State Renewal').getRecordTypeId();
          Id devoppStdRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Standard Renewal').getRecordTypeId();
          Id devoppPenRRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Pension Renewal').getRecordTypeId();
         Id devoppEntityFormRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
        Id devoppEFSalesRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Entity Formation').getRecordTypeId();
          Id devoppTaxRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Tax Compliance').getRecordTypeId();
        Id devoppEnLandTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Land Trust').getRecordTypeId();
         Id devoppEnLLCTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Limited Liability Company (LLC)').getRecordTypeId();
           Id devoppEnCorpTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Corporation').getRecordTypeId();
          Id devoppEnGapLLcTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('GAP Fund LLC').getRecordTypeId();
        Id devoppEnLivingTrustRecordTypeId = Schema.SObjectType.entities__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
        Id devoppcallRecordTypeId = Schema.SObjectType.task.getRecordTypeInfosByName().get('Call').getRecordTypeId();

 Gateway=    (ChargentBase__Gateway__c)TestDataFactory.createSObject('ChargentBase__Gateway__c', new Map<String,Object>{
  'Name' => 'Test ',
  'ChargentBase__Active__c' => True,
      'ChargentBase__Merchant_ID__c'=>'12354',
      'ChargentBase__Available_Payment_Methods__c' => 'Credit Card'
     
});    
       
Campaign cam = (Campaign)TestDataFactory.createSObject('Campaign', new Map<String,Object>{
  'Name' => 'Test Campaign',
  'IsActive' => True
     
});  
     
       
        	accList = TestDataFactory.createSObjectList('Account', new Map<String,Object>{
                'First_Name__c'=>new List<String>{'Bobby1','Bobby2','Bobby3'},
  'Last_Name__c' => new List<String>{'Apples1','Apples2','Apples3'},
      'Name' => new List<String>{'ApplesTest','ApplesTest2','ApplesTest3'},
      'E_Mail__c'=>'abc@123.com',
 'Main_Lead_Source__c'=> 'Existing Client',
      'BadgeServiceItems__c'=>''
     
},3);
       conList = TestDataFactory.createSObjectList('Contact', new Map<String,Object>{
  'firstname' =>new List<String>{'Bobby1','Bobby2','Bobby3'},
       'Lastname' => new List<String>{'Apples1','Apples2','Apples3'},
           'Email'=>'abc@123.com',
          ' Account_Roles__c'=>'Primary Contact',
  'Account' =>accList
},3);
       caseList = TestDataFactory.createSObjectList('Case', new Map<String,Object>{
  'Account' => AccList,
      'Subject'=>new List<String>{'Test Case1','Test Case2'},
      
  'Status'=>'New'
},2);
        oppList = TestDataFactory.createSObjectList('opportunity', new Map<String,Object>{
  'CloseDate' =>  Date.Today(),
      'Sale_Campaign__c'=>cam.id,
      'Name'=>new List<String>{'Test Sale 1','Test Sale 2','Test Sale 3'},
      'All_Services_Status__c'=>'',
      'StageName' =>  'Qualification',
          'RecordTypeID'=>new List<Id>{devoppstateRRecordTypeId,devoppStdRRecordTypeId,devoppEntityFormRecordTypeId},
  'Account' =>  AccList
},3);
         EnItemList = TestDataFactory.createSObjectList('Entities__c', new Map<String,Object>{
  'Status__c' =>  'Active',
     
      'Name'=>new List<String>{'Test En 1','Test En 2'},
          
      'Organization_State__c' =>  'Wyoming',
          'RecordTypeID'=>new List<Id>{devoppEnLLCTypeId,devoppEnCorpTypeId},
  'Primary_Client__c' =>  AccList[0].id
},2);
        productList=TestDataFactory.createSObjectList('Product2', new Map<String,Object>{
 
      'Name'=>new List<String>{'Unlimited Nominee','Privacy Trust with LLC Truste','Anderson Tax Advantage PRogram','Corporate Assistance Program, 1 Year, Initial','Corporate Assistance Program Annual Renewal','Annual List','LLC Trustee','Registered Agent Annual Renewal'},
          'ProductCode' => new List<String>{'Pro-1','Pro-2','Pro-3','Pro-4','Pro-5','Pro-6','Pro-7','Pro-8'},
              'Family'=>new List<String>{'Entity Formation','Entity Formation','Entity Formation','Entity Formation','Entity Formation','Entity Formation','Entity Formation','Entity Formation'},
                  'Entity_Type__c'=>new List<String>{'Any','Any','Any','Any','Any','Any','Any','Any'},
              
              'isActive' => true
},8);
             pricebookList=TestDataFactory.createSObjectList('PricebookEntry', new Map<String,Object>{
 
      'Product2'=>productList,
          'unitprice' => 0.01,
          'Pricebook2Id'=>Test.getStandardPricebookId(),
          'isActive'=>True,
          'UseStandardPrice'=>false
       
},8);
     oppLineItemList=TestDataFactory.createSObjectList('OpportunityLineItem', new Map<String,Object>{
 
      'Quantity'=>1,
          'Opportunity' => oppList,
          'UnitPrice'=>0.01,
          'Product_Family__c'=>'Entity Formation',
          'Product_Entity_Type__c'=>'Any',
          'PriceBookEntry'=>pricebookList
    
},2);
        
        System.debug('accList--'+accList.size());
    }
     @isTest
    static void TestaccordionDisplay(){
        createTestData();
         System.debug('accList--'+accList.size());
         System.debug('oppList--'+oppList.size());
         System.debug('pricebookList--'+pricebookList.size());
           System.debug('productList--'+productList.size());
         System.debug('oppLineItemList--'+oppLineItemList.size());
          System.debug('uList--'+uList.size());
          System.debug('oppLineItemList--'+oppLineItemList.size());
    }
}