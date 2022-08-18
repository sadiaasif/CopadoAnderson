public class OpportunityLineItemInsertHandler {
    private static boolean runOnce = false;
    public static set<Id> oppIds = new set<Id>();
    public static List<Opportunity> oppList = new List<Opportunity>();
    public static List<OpportunityLineItem> itemList = new List<OpportunityLineItem>();
    public static set<Id> pricebook2Ids = new set<Id>();
    public static Map<String,PriceBookEntry> priceBookMap = new Map<String,PriceBookEntry>();
    public static void insertTaxToolBoxOSI(List<OpportunityLineItem> oppItems){
        if(!runonce){
            try{
                runOnce = true;
                for(OpportunityLineItem item : oppItems){
                    if(!oppIds.contains(item.OpportunityId)){
                        oppIds.add(item.OpportunityId);
                    }
                }
                for(Opportunity opp : [Select id,name,pricebook2Id,priceBook2.name from opportunity where Id IN : oppIds LIMIT : Limits.getLimitQueryRows()]){
                    pricebook2Ids.add(opp.Pricebook2Id);
                    oppList.add(opp);
                }
                if(pricebook2Ids.size() > 0){
                    for(PriceBookEntry pb : [Select id,pricebook2Id,product2Id from pricebookentry where pricebook2Id IN : pricebook2Ids and product2.Name = 'Tax Toolbox' limit : Limits.getLimitQueryRows()]){
                        if(!priceBookMap.containsKey(pb.PriceBook2.Name)){
                            priceBookMap.put(pb.Pricebook2.Name, pb);
                        }
                    }
                }
                if(priceBookMap.keySet().size() > 0){
                    for(Opportunity opp : oppList){
                        if(priceBookMap.containsKey(opp.Pricebook2.Name)){
                            PricebookEntry pb = priceBookMap.get(opp.Pricebook2.Name);
                            OpportunityLineItem item = new OpportunityLineItem();
                            item.UnitPrice = 0;
                            item.Quantity = 1;
                            item.Product2Id = pb.Product2Id;
                            item.OpportunityId = opp.Id;
                            item.PricebookEntryId = pb.Id;
                            itemList.add(item);
                        }    
                    }
                }
                if(itemList.size() > 0){
                    insert itemList;
                }
            }
            catch(Exception e){
                system.debug('Errorr: ' + e);
            }
        }
        
    }
}