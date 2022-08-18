@isTest
public class TestUtility {
    public static product2 createProduct(String name, String typ){
        Product2 prod = new Product2();
        prod.Name = 'test prod' + name;
        prod.IsActive = true;
        prod.Service_Fulfillment_Weight__c = '1';
        prod.Type__c = typ;
        insert prod;
        return prod;
    }
    public static Map<Id,Id> createPriceBookEntries(List<Product2> prods){
        Id pricebookId = Test.getStandardPricebookId();
        List<PricebookEntry> entries = new List<PricebookEntry>();
        Map<Id,Id> prodToPriceBook = new Map<Id,Id>();
        for(Product2 prd : prods){
            PricebookEntry pbe = new PricebookEntry(Pricebook2Id = pricebookId, Product2Id = prd.Id,UnitPrice = 10000, IsActive = true);
            entries.add(pbe);
        }
        
        insert entries;
        for(PricebookEntry entry : entries){
            prodToPriceBook.put(entry.Product2Id,entry.Id);
        }
        return prodToPriceBook;
    }
    public static Order createOrder(Id accId, Id uId){
        Id pricebookId = Test.getStandardPricebookId();
        Order odr = new Order();
        odr.AccountId = accId;
        odr.Status = 'Draft';
        odr.EffectiveDate = Date.today();
        odr.Pricebook2Id = pricebookId;
        odr.OwnerId = uId;
        insert odr;
        return odr;
    }
    public static void createOrderItems(Id odrId, List<Product2> prods, Map<Id,Id> prodToPriceBook, List<String> orderTypes){
        List<OrderItem> orderItems = new List<OrderItem>();
        for(Integer i = 0 ; i < prods.size() ; i++){
            OrderItem osi = new OrderItem();
            osi.orderId = odrId;
            osi.product2Id = prods[i].Id;
            osi.Quantity = 1;
            osi.UnitPrice = 100;
            osi.Type__c = orderTypes[i];
            osi.PricebookEntryId = prodToPriceBook.get(prods[i].Id);
            orderItems.add(osi);
        }
        boolean fonce = false;
        boolean docOnce = false;
        boolean disOnce = false;
        boolean lonce = false;
        boolean donce = false;
        for(OrderItem osi : orderItems){
            if(osi.Type__c == 'Formation' && !fonce){
                fonce = true;
                osi.Processing_Stage__c = 'Not Started';
            }
            else if(osi.Type__c == 'Formation' && fonce){
                system.debug('heree');
                osi.Processing_Stage__c = 'Name Rejected';
            }
            else if(osi.Type__c == 'Informational Only'){
                osi.Processing_Stage__c = 'N/A';
            }
            else if(osi.Type__c == 'RA Change'){
                osi.Processing_Stage__c = 'Submitted to SOS';
            }
            else if(osi.Type__c == 'Annual List'){
                osi.Processing_Stage__c = 'Completed';
            }
            else if(osi.Type__c == 'Platinum'){
                osi.Processing_Stage__c = 'Refunded';
            }
            else if(osi.Type__c == 'Document' && !docOnce){
                docOnce = true;
                osi.Processing_Stage__c = 'Back to Processor';
                osi.Due_Date__c = Date.today().addDays(20);
            }
            else if(osi.Type__c == 'Document' && docOnce){
                osi.Processing_Stage__c = 'Completed';
            }
            else if(osi.Type__c == 'Dissolution' && !disOnce){
                disOnce = true;
                osi.Processing_Stage__c = 'Drafted, STC';
                osi.Due_Date__c = Date.today().addDays(2);
            }
            else if(osi.Type__c == 'Dissolution' && disOnce){
                osi.Processing_Stage__c = 'Exchanged for Other Services';
            }
            else if(osi.Type__c == 'Land Trust' && !lOnce){
                lonce = true;
                osi.Processing_Stage__c = 'Back to CSR';
            }
            else if(osi.Type__c == 'Land Trust' && lOnce){
                osi.Processing_Stage__c = 'Kitted';
            }
            else if(osi.Type__c == 'Deed' && !dOnce){
                donce = true;
                osi.Processing_Stage__c = 'Sent to Client for Signatures';
                osi.Due_Date__c = Date.today();
            }
            else if(osi.Type__c == 'Deed' && dOnce){
                osi.Processing_Stage__c = 'Sent to County';
                osi.Due_Date__c = Date.today().addDays(-2);
            }
        }
        insert orderItems;
        
    }
}