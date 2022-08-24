public class OpportunityLineItemInsertHandler {
    public class OSIWrapper {
        public double unitPrice;
        public double quantity;
        public Id product2Id;
        public Id opportunityId;
        public Id PricebookEntryId;
    }
    private static boolean runOnce = false;
    public static set<Id> oppIds = new set<Id>();
    public static List<Opportunity> oppList = new List<Opportunity>();
    public static List<OpportunityLineItem> itemList = new List<OpportunityLineItem>();
    public static List<OSIWrapper> wrapList = new List<OSIWrapper>();
    public static set<Id> pricebook2Ids = new set<Id>();
    public static Map<String,PriceBookEntry> priceBookMap = new Map<String,PriceBookEntry>();
    public static void insertTaxToolBoxOSI(List<OpportunityLineItem> oppItems){
        if(!runonce){
            try{
                runOnce = true;
                for(Opportunity opp : [Select id,name,pricebook2Id,priceBook2.name from opportunity where Id IN : oppIds LIMIT : Limits.getLimitQueryRows()]){
                    pricebook2Ids.add(opp.Pricebook2Id);
                    oppList.add(opp);
                }
                if(pricebook2Ids.size() > 0){
                    for(PriceBookEntry pb : [Select id,pricebook2Id,product2Id,pricebook2.name from pricebookentry where pricebook2Id IN : pricebook2Ids and product2.productCode = 'TTB' limit : Limits.getLimitQueryRows()]){
                        if(!priceBookMap.containsKey(pb.PriceBook2.Name)){
                            priceBookMap.put(pb.Pricebook2.Name, pb);
                        }
                    }
                }
                if(priceBookMap.keySet().size() > 0){
                    for(Opportunity opp : oppList){
                        if(priceBookMap.containsKey(opp.Pricebook2.Name)){
                            PricebookEntry pb = priceBookMap.get(opp.Pricebook2.Name);
                            OSIWrapper wrap = new OSIWrapper();
                            wrap.UnitPrice = 0;
                            wrap.Quantity = 1;
                            wrap.Product2Id = pb.Product2Id;
                            wrap.OpportunityId = opp.Id;
                            wrap.PricebookEntryId = pb.Id;
                            wrapList.add(wrap);
                            /*OpportunityLineItem item = new OpportunityLineItem();
item.UnitPrice = 0;
item.Quantity = 1;
item.Product2Id = pb.Product2Id;
item.OpportunityId = opp.Id;
item.PricebookEntryId = pb.Id;
itemList.add(item);*/
                        }    
                    }
                }
                if(wrapList.size() > 0){
                    String wrapJSON = JSON.serialize(wrapList);
                    insertTTBOSI(wrapJSON);
                    //insertTTBOSI(itemList);
                }
            }
            catch(Exception e){
                system.debug(e);
            }
        }
        
    }
    public static void checkForTaxToolBoxOSI(List<OpportunityLineItem> items){
        try{
            List<Id> itemIds = new List<Id>();
            for(OpportunityLineItem item : items){
                itemIds.add(item.Id);   
            }
            for(OpportunityLineItem services : [select id,product2.name,opportunityId,product2.ProductCode from OpportunityLineItem where Id IN : itemIds]){
                if(services.product2.ProductCode == 'ATAPKG'){
                    oppIds.add(services.opportunityId);
                }
            }
        }
        catch(Exception e){
            system.debug(e);
        }
    }
    
    @future
    public static void insertTTBOSI(String wrapJSON){
        try{
            List<OSIWrapper> wrapList = (List<OSIWrapper>)JSON.deserialize(wrapJSON, List<OSIWrapper>.class);
            List<OpportunityLineItem> itemsToInsert = new List<OpportunityLineItem>();
            for(OSIWrapper wrap : wrapList){
                OpportunityLineItem item = new OpportunityLineItem();
                item.UnitPrice = wrap.unitPrice;
                item.Quantity = wrap.quantity;
                item.Product2Id = wrap.Product2Id;
                item.OpportunityId = wrap.opportunityId;
                item.PricebookEntryId = wrap.PricebookEntryId;
                itemsToInsert.add(item);
            }
            if(itemsToInsert.size() > 0){
                insert itemsToInsert;
            }
        }
        catch(Exception e){
            system.debug(e);
        }
    }
}