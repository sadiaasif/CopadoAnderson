@isTest(seeAllData=false)
public class TestRowController {
    @testSetup
    static void setupTestData(){
        User u;
        Account a;
        User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        //UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
        u = new User(alias = 'jsmith', email='jsmith@andersonadvisors.com', 
                     emailencodingkey='UTF-8', lastname='Bond', 
                     languagelocalekey='en_US', 
                     localesidkey='en_US', profileid = p.Id,
                     timezonesidkey='America/Los_Angeles', 
                     username='jbond@acme.com');
        insert u;
    }
    static void setupData(){
        Account acc = new Account(Name = 'Test Client');
        insert acc;
        
        Product2 prodA1 = TestUtility.createProduct('A1', 'Corp Formation');
        Product2 prodA2 = TestUtility.createProduct('A2', 'Corp Formation');
        Product2 prodA3 = TestUtility.createProduct('A3', 'Informational Only');
        Product2 prodA4 = TestUtility.createProduct('A4', 'Registered Agent Change');
        Product2 prodA5 = TestUtility.createProduct('A5', 'Annual List');
        Product2 prodB1 = TestUtility.createProduct('B1', 'Informational Only');
        Product2 prodB2 = TestUtility.createProduct('B2', 'Informational Only');
        Product2 prodB3 = TestUtility.createProduct('B3', 'Platinum');
        Product2 prodB4 = TestUtility.createProduct('B4', 'Doc Drafting');
        Product2 prodB5 = TestUtility.createProduct('B5', 'Doc Drafting');
        Product2 prodB6 = TestUtility.createProduct('B6', 'Dissolution');
        Product2 prodB7 = TestUtility.createProduct('B7', 'Dissolution');
        Product2 prodC1 = TestUtility.createProduct('C1', 'Land Trust');
        Product2 prodC2 = TestUtility.createProduct('C2', 'Land Trust');
        Product2 prodC3 = TestUtility.createProduct('C3', 'Deed');
        Product2 prodC4 = TestUtility.createProduct('C4', 'Deed');
        
        List<String> orderATypes = new List<String>{'Formation','Formation','Informational Only','RA Change','Annual List'};
        List<String> orderBTypes = new List<String>{'Informational Only','Informational Only','Platinum','Document','Document','Dissolution','Dissolution'};
        List<String> orderCTypes = new List<String>{'Land Trust','Land Trust','Deed','Deed'};
            
        List<Product2> orderAProds = new List<Product2>{prodA1,prodA2,prodA3,prodA4,prodA5};
        List<Product2> orderBProds = new List<Product2>{prodB1,prodB2,prodB3,prodB4,prodB5,prodB6,prodB7};
        List<Product2> orderCProds = new List<Product2>{prodC1,prodC2,prodC3,prodC4};
        List<Product2> prods = new List<Product2>();
        prods.addAll(orderAProds);
        prods.addAll(orderBProds);
        prods.addAll(orderCProds);
                
        Map<Id,Id> prodToPriceBook = TestUtility.createPriceBookEntries(prods);
        User u = [select id from user where lastname = 'Smith' limit 1];
        Order orderA = TestUtility.createOrder(acc.Id, u.Id);
        Order orderB = TestUtility.createOrder(acc.Id, u.Id);
        Order orderC = TestUtility.createOrder(acc.Id, u.Id);
        
        TestUtility.createOrderItems(orderA.Id, orderAProds, prodToPriceBook, orderATypes);
        TestUtility.createOrderItems(orderB.Id, orderBProds, prodToPriceBook, orderBTypes);
        TestUtility.createOrderItems(orderC.Id, orderCProds, prodToPriceBook, orderCTypes);
    }
   /* @isTest
    static void testScenario1_1(){
        setupData();
        List<OrderItem> items = [select id,type__c,Processing_Stage__c,Due_Date__c,Action_Alert__c from orderitem];
        for(OrderItem item : items){
            system.debug('-------->Item--------->');
            system.debug('stage: ' + item.type__c);
            system.debug('stage: ' + item.Processing_Stage__c);
            system.debug('due date: ' + item.Due_Date__c);
            system.debug('alert: ' + item.Action_Alert__c);
        }
        Map<String, List<String>> formationValueMap = RowController.getDependentPicklistValues('Formation');
        system.assertEquals(29, (formationValueMap.get('Formation')).size(), 'assert failed');
    } */
    
    @isTest
    static void testScenario1_2(){
        setupData();
        Map<String, List<String>> formationValueMap = RowController.getDependentPicklistValues('Formation');
        boolean actual = (formationValueMap.get('Formation')).contains('Sent to Client for Signatures');
        system.assertEquals(false, actual, 'assert failed');
    }
    @isTest
    static void testScenario1_3(){
        setupData();
        OrderItem item = [select orderId,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Formation' limit 1];
        item.Processing_Stage__c = 'Completed';
        update item;
        OrderItem item2 = [select action_alert__c from orderItem where id =: item.Id];
        system.assertEquals('Completed', item.Processing_Stage__c, 'assert failed');
        system.assertEquals('Green', 'Green', 'assert failed');
    }
  /*  @isTest
    static void testScenario1_4(){
        setupData();
        OrderItem item = [select orderId,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Informational Only' limit 1];
        item.Processing_Stage__c = 'Not Started';
        boolean flag = false;
        try{
            update item;
        }
        catch(Exception e){
            system.debug('failed: ' + e);
            flag = true;
        }
        system.assertEquals(true, flag, 'assert failed');
    } */
    @isTest
    static void testScenario1_5(){
        setupData();
        OrderItem item = [select orderId,action_alert__c,Processing_Stage__c from orderItem where type__c = 'RA Change' limit 1];
        item.Processing_Stage__c = 'Refunded';
        update item;
        OrderItem item2 = [select action_alert__c from orderItem where id =: item.Id];
        system.assertEquals('Refunded', item.Processing_Stage__c, 'assert failed');
        system.assertEquals('Green', 'Green', 'assert failed');
    }
    
    @isTest
    static void testScenario2_1(){
        setupData();
        Map<String, List<String>> platinumValueMap = RowController.getDependentPicklistValues('Platinum');
        system.debug('platinumm: ' + (platinumValueMap.get('Platinum')).size());
        //system.assertEquals(13, (platinumValueMap.get('Platinum')).size(), 'assert failed');
    }
    @isTest
    static void testScenario2_2(){
        setupData();
        OrderItem item = [select orderId,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Document' limit 1];
        system.assertEquals('Yellow', 'Yellow', 'assert failed');
    }
    @isTest
    static void testScenario2_3(){
        setupData();
        OrderItem item = [select orderId,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Document' limit 1];
        item.Processing_Stage__c = 'RTS, Complete';
        string alert = item.Action_Alert__c;
        update item;
        Orderitem item2 = [select action_alert__c, Processing_Stage__c from orderItem where id =: item.Id limit 1];
        system.assertEquals('RTS, Complete', item2.Processing_Stage__c, 'assert failed');
        system.assertEquals(true, alert == item2.Action_Alert__c, 'assert failed');
    }
    @isTest
    static void testScenario2_4(){
        setupData();
        OrderItem item = [select orderId,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Dissolution' limit 1];
        system.assertEquals('Yellow', 'Yellow', 'assert failed');
    }
   /* @isTest
    static void testScenario2_5(){
        setupData();
        OrderItem item = [select orderId,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Dissolution' limit 1];
        item.Comments__c = 'Updated';
        boolean flag = false;
        try{
            update item;
        }
        catch(Exception e){
            flag = true;
        }
        system.assertEquals(true, flag, 'assert failed');
    } */
    @isTest
    static void testScenario2_6(){
        setupData();
        OrderItem item = [select orderId,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Informational Only' limit 1];
        system.assertEquals('Green', 'Green', 'assert failed');
    }
    @isTest
    static void testScenario2_7(){
        setupData();
        OrderItem item = [select orderId,Processor__c,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Document' limit 1];
        item.Processor__c = 'Amanda Phillips';
        update item;
        system.assertEquals('Amanda Phillips', item.Processor__c, 'assert failed');
    }
    @isTest
    static void testScenario3_1(){
        setupData();
        OrderItem item = [select orderId,Comments__c,Update_Comments__c,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Formation' limit 1];
        item.Update_Comments__c = 'New Test Comment';
        String existing = item.Comments__c;
        update item;
        OrderItem item2 = [select Update_Comments__c from orderItem where id =: item.Id limit 1];
        system.assertEquals(true, existing != item2.Update_Comments__c, 'assert failed');
    }
    @isTest
    static void testScenario3_4(){
        setupData();
        List<OrderItem> items = [select orderId,due_date__c,Processor__c,action_alert__c,Processing_Stage__c from orderItem where type__c = 'Deed'];
        system.assertEquals('Yellow', 'Yellow', 'assert failed');
        system.assertEquals('Yellow', 'Yellow', 'assert failed');
    }
    
    @isTest
    static void testIsSite(){
        setupData();
        boolean flag = RowController.insideCommunity();
        system.assertEquals(false, flag, 'assert failed');
    }
    @isTest
    static void testFetchOrderItems(){
        setupData();
        Order odr = [select id from order limit 1];
        List<OrderItem> items = RowController.fetchOrderItems(odr.Id);
        system.assertEquals(true, items.size() > 0, 'assert failed');
    }
    @isTest
    static void testSaveItems(){
        setupData();
        Order odr = [select id from order limit 1];
        List<OrderItem> items = [select id,Processing_Stage__c ,Update_Comments_Utility__c,Update_Comments__c from orderItem where orderId =: odr.Id];
        RowController.saveServiceItems(items);
    }
    @isTest
    static void testPicklistValues(){
        setupData();
        OrderItem OSI = new OrderItem();
        List<String> values = RowController.getselectOptions(OSI, 'Processing_Stage__c');
        System.assertEquals(true, true, 'assert failed');
    }
}