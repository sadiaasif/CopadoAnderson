trigger QuoteLine_Insert on QuoteLineItem (before insert) {
  set<ID> setPriceBookEntryIDs = new set<ID>();
  //OpportunityLineItem[] lstOppyLines = new OpportunityLineItem[]{};
  for(QuoteLineItem OLI: Trigger.new){
    if(OLI.PricebookEntryId != null){
      setPriceBookEntryIDs.add(OLI.PricebookEntryId);
    }
  }
  Map<ID,PricebookEntry> mapPBEntry = new Map<ID,PricebookEntry>([Select p.Product2.Entity_Type__c, p.Product2.Family, p.Product2Id, p.Id From PricebookEntry p where id in: setPriceBookEntryIDs ]);
  for(QuoteLineItem OLI: Trigger.new){
    OLI.Product_Family__c = mapPBEntry.get(OLI.PricebookEntryId).Product2.Family;
    OLI.Product_Entity_Type__c = mapPBEntry.get(OLI.PricebookEntryId).Product2.Entity_Type__c;
    //lstOppyLines.add(OLI);
  }
  //update lstOppyLines;
}