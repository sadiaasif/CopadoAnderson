public with sharing class EditAll_Quote {
  ID quoteID;
  public List<QuoteLineItem> lstOppyLineItems {get;set;}
  public EditAll_Quote (){
    quoteID= ApexPages.currentPage().getParameters().get('quoteID');
    lstOppyLineItems = [Select o.UnitPrice, o.Quantity,o.ServiceDate,o.TotalPrice, o.ListPrice, o.Id,  o.Description,o.PricebookEntry.Product2.Name,o.PricebookEntry.Product2.ProductCode,o.PricebookEntry.Product2.Family, o.PricebookEntry.Product2.Entity_Type__c 
              From QuoteLineItem o 
              where Quote.Id = :quoteID
              order by Product_Family__c, Product_Entity_Type__c, UnitPrice desc];
  }
  public void save(){
    update lstOppyLineItems;
  }
  public PageReference cancel(){
    PageReference pageRef = new PageReference('/' + quoteID);
        pageRef.setRedirect(true);
        return pageRef;
  }
  public PageReference saveClose(){
    save();
    PageReference pageRef = new PageReference('/' + quoteID);
        pageRef.setRedirect(true);
        return pageRef;
  }
}