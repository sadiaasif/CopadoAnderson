@isTest
public class WordPressUserCreationUtilityTest {
    @testSetup static void createTestData() {
        List<opportunity> oppList=new List<Opportunity>();
        List<OpportunityLineItem> opLineitemlist=new List<OpportunityLineItem>();
        Id pricebookId = Test.getStandardPricebookId();
        Account a = new Account();
        a.First_Name__c = 'Bob';
        a.Last_Name__c = 'Apple Test';
        a.Name = 'Test1234';
        a.E_Mail__c = 'bobappletest123@gmail.com';
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.id;
        c.FirstName = 'Bob';
        c.LastName = 'Apple Test';
        c.Email = 'bobappletest123@gmail.com';
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
    @isTest
    public static void testWordpressUserCreate(){
     //  String response = '{"id":"15555",  "username" : "test",   "email" : "test","password" : "test", "first_name" : "test", "last_name" : "test", "roles" : "services;bbp"}';
      PlatinumUser.newUser brandNewUser = new PlatinumUser.newUser();
        Opportunity opp = [select id,service_item_list__c,Email__c,AccountId,Account_First_Name__c,Account_Last_Name__c from opportunity limit 1];
        Contact con = [select id, service_item_list__c,Platinum_Wordpress_Id__c from contact limit 1];
        List<Digital_Course__mdt> digitalList = [select id, ASID__c from Digital_Course__mdt limit 50000];
        List<Infinity_Subscription_Product__mdt> infinityList = [select id, ASID__c,Infinity_Membership__c from Infinity_Subscription_Product__mdt limit 50000];
     WordpressUserCalloutRequestWrapp usercalloutwrapinst = new WordpressUserCalloutRequestWrapp(opp,'Platinum',con.Id);
       String bodydata = JSON.serialize(usercalloutwrapinst);
        test.startTest();
        WordpressUserCreationUtility.createServiceUser(opp);
        WordpressUserCreationUtility.createServiceUser(opp, infinityList, digitalList);
         WordpressUserCreationUtility.performCallout(bodydata, con.Platinum_Wordpress_Id__c, con.Id);
        WordpressUserCreationUtility.createPlatinumUser(opp);
        WordpressUserCreationUtility.updateContact(brandNewUser, con.Id);
        WordpressUserCreationUtility.updateContactServiceItemList(opp.Service_Item_List__c, opp.AccountId, con.Id, infinityList, digitalList, con.Service_Item_List__c);
        test.stopTest();
    }
}