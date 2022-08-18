@isTest
public class AndersonReceiptTest {
    
    @isTest
    public static void testAndersonReceipt() {
        
        Account a = new Account();
        a.Last_Name__c = 'Apples';
        a.First_Name__c = 'Bobby';
        a.Name = 'Bobby Apples';
        insert a;
        
        Entities__c e = new Entities__c();
        e.Name = 'Test LLC';
        e.Origin__c = 'Anderson';
        e.Organization_State__c = 'Wyoming';
        insert e;
        
        Product2 prod = new Product2(Name = 'Laptop X200',
                                     Family = 'Hardware');
        insert prod;
        
        
        Id pricebookId = Test.getStandardPricebookId();
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 10000, IsActive = true);
        insert standardPrice;
        
        Opportunity o = new Opportunity();
        o.StageName =  'Qualification';
        o.Name = 'Test Sale';
        o.AccountId = a.Id;
        o.CloseDate = system.today();
        o.Pricebook2Id = pricebookId;
        o.Entity__c = e.id;
        insert o;
        
        OpportunityLineItem oli = new OpportunityLineItem();
        oli.OpportunityId = o.id;
        oli.Quantity = 1;
        oli.TotalPrice = 150;
        oli.product2id = prod.Id;
        insert oli;
        
        ChargentSFA__Transaction__c t = new ChargentSFA__Transaction__c();
        t.ChargentSFA__Amount__c = 150;
        t.ChargentSFA__Card_Last_4__c = '9999';
        t.ChargentSFA__Credit_Card_Type__c = 'Visa';
        t.ChargentSFA__Opportunity__c = o.id;
        t.ChargentSFA__Payment_Method__c = 'Credit Card';
        t.ChargentSFA__Gateway_Date__c = system.now();
        t.ChargentSFA__Gateway_ID__c = 'LV';
        t.ChargentSFA__Type__c = 'Charge';
        t.ChargentSFA__Response_Status__c = 'Approved';
        insert t;

		PageReference pageRef = Page.AndersonReceit; // Add your VF page Name here
        Test.setCurrentPage(pageRef);
 
        pageRef.getParameters().put('id', String.valueOf(o.Id));
        ApexPages.StandardController sc = new ApexPages.StandardController(o);
        AndersonReceit controller = new AndersonReceit(sc);
       
        controller.getClientInfo();
        controller.getDate();
        controller.getProdInfo();
        controller.getOpps();
        controller.getTransactions();
        controller.getGrandTotal();
        controller.getGrandTotal();
        controller.getBal();
        controller.getCheckVE();
        controller.getDueBalance();

    }
    
}