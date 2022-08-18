@isTest (seeALLData = false)
public class OpportunityLineItemInsertHandlerTest {
    @testSetup
    public static void setupTestData(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        Opportunity Opp = new Opportunity();
        opp.Name = 'Test Opp';
        opp.AccountId = acc.Id;
        opp.StageName = 'Qualification';
        opp.CloseDate = Date.today();
        insert opp;
        Pricebook2 standardPricebook = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
        Product2 testProduct = new Product2(
            Name = 'Anderson Tax Advantage Package',
            IsActive = true
        );
        testProduct.Service_Fulfillment_Weight__c = '1';
        testProduct.Type__c = 'Tax';
        insert testProduct;
        Product2 testProduct2 = new Product2(
            Name = 'Tax Toolbox',
            IsActive = true
        );
        testProduct2.Service_Fulfillment_Weight__c = '1';
        testProduct2.Type__c = 'Tax';
        insert testProduct2;
        PricebookEntry testPbe = new PricebookEntry(
            Pricebook2Id = standardPricebook.Id,
            Product2Id = testProduct.Id,
            UnitPrice = 100,
            IsActive = true
        );
        insert testPbe;
        PricebookEntry testPbe2 = new PricebookEntry(
            Pricebook2Id = standardPricebook.Id,
            Product2Id = testProduct2.Id,
            UnitPrice = 100,
            IsActive = true
        );
        insert testPbe2;
    }
    
    @isTest
    public static void testServiceItemAdded(){
        Opportunity opp = [select id from opportunity limit 1];
        PricebookEntry testPbe = [select id,product2Id from pricebookentry where product2.name = 'Anderson Tax Advantage Package' limit 1];
        OpportunityLineItem item = new OpportunityLineItem();
        item.OpportunityId = opp.Id;
        item.UnitPrice = 0;
        item.Quantity = 1;
        item.Product2Id = testPbe.Product2Id;
        item.PricebookEntryId = testPbe.Id;
        insert item;
        List<OpportunityLineItem> oppItemList = [select id from opportunitylineitem where opportunityId =: opp.Id];
        system.assertEquals(2, oppItemList.size(), 'success');
    }
}