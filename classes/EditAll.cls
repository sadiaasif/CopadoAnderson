public with sharing class EditAll {
	ID oppyID;
	public List<OpportunityLineItem> lstOppyLineItems {get;set;}
	public EditAll(){
		oppyID = ApexPages.currentPage().getParameters().get('oppyID');
		lstOppyLineItems = [Select o.UnitPrice, o.Quantity,o.ServiceDate,o.TotalPrice, o.ListPrice, o.Id,  o.Description,o.PricebookEntry.Product2.Name,o.PricebookEntry.Product2.ProductCode,o.PricebookEntry.Product2.Family, o.PricebookEntry.Product2.Entity_Type__c 
							From OpportunityLineItem o 
							where OpportunityId = :oppyID
							order by Product_Family__c, Product_Entity_Type__c, UnitPrice desc];
	}
	public void save(){
		update lstOppyLineItems;
	}
	public PageReference cancel(){
		PageReference pageRef = new PageReference('/' + oppyID);
        pageRef.setRedirect(true);
        return pageRef;
	}
	public PageReference saveClose(){
		save();
		PageReference pageRef = new PageReference('/' + oppyID);
        pageRef.setRedirect(true);
        return pageRef;
	}
}