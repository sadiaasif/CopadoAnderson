public with sharing class AddPlans {
	ID oppyID;
	public List<WrapperFamily> lstFamily {get;set;}
	public List<WrapperEntityType> lstEntityType {get;set;}
	public List<WrapperOpportunityLines> lstOppyLines {get;set;}
	set<String> setSelectedFamily = new set<String>();
	set<String> setSelectedEntityType = new set<String>();
	Map<ID,Product2> mapSelectedProducts = new Map<ID,Product2>();
	Opportunity recOppy = new Opportunity();
	OpportunityLineItem[] arrInsertOLIs = new OpportunityLineItem[]{}; 
	Map<String,OpportunityLineItem> mapExistingLineItems = new Map<String,OpportunityLineItem>();
	private transient ApexPages.Message currentMsg;
	public AddPlans(){
		lstFamily = new List<WrapperFamily>();
		lstEntityType = new List<WrapperEntityType>();
		lstOppyLines = new List<WrapperOpportunityLines>();
		oppyID = ApexPages.currentPage().getParameters().get('oppyID');
		if(oppyID != null){
			recOppy = [Select Id, Pricebook2Id From Opportunity o where id = :oppyID];
			retrieveProductFamily();
			retrieveEntityType();
			for(OpportunityLineItem objOLI: [select id, OpportunityId, PricebookEntryId,Quantity, UnitPrice,ListPrice,ServiceDate,Description from OpportunityLineItem where OpportunityId = :oppyID]){
				mapExistingLineItems.put(objOLI.OpportunityId + '|' + objOLI.PricebookEntryId, objOLI);
			}
		}
		
	}
	public PageReference selectAndAddProducts(){
		if(recOppy.Pricebook2Id  != null){
			for(WrapperFamily objFamily: lstFamily){
				if(objFamily.isSelected == true){
					setSelectedFamily.add(objFamily.familyName);
				}
			}
			
			for(WrapperEntityType objET: lstEntityType){
				if(objET.isSelected == true){
					setSelectedEntityType.add(objET.entityTypeName);
				}
			}
			
			//Option 2
			String[] tempArray = new String[]{};
			for(Product2 p: [select id,Name,ProductCode, Family, Description, Entity_Type__c from Product2 where isActive = true and Family in: setSelectedFamily and Entity_Type__c in:setSelectedEntityType order by Family,Entity_Type__c ]){
				mapSelectedProducts.put(p.Id, p); 
				/*
				//tempArray.clear();
				//tempArray = p.Plan__c.split(';');
				System.debug('tempArray =' + tempArray);
				for(String s: tempArray){
					if(setSelectedFamily.contains(s)){
						mapSelectedProducts.put(p.Id, p); 
					}
				}*/
			}
			System.debug('mapSelectedProducts =' + mapSelectedProducts);
			System.debug('recOppy.Pricebook2Id  =' + recOppy.Pricebook2Id );
			List<PricebookEntry> lstPBEntry = new List<PricebookEntry>([Select p.UnitPrice, p.Product2Id, p.Pricebook2Id, p.Id 
										From PricebookEntry p where Pricebook2Id = :recOppy.Pricebook2Id 
										And Product2Id in: mapSelectedProducts.keySet()
										And IsActive = true
										order by Product2.Family, Product2.Entity_Type__c, UnitPrice desc]);
			
			
			for(PricebookEntry PBEntry: lstPBEntry){
				if(mapExistingLineItems.get(oppyID + '|' + PBEntry.Id) == null){
					OpportunityLineItem OLI = new OpportunityLineItem();
					OLI.OpportunityId = oppyID;
					OLI.PricebookEntryId = PBEntry.Id;
					OLI.UnitPrice = PBEntry.UnitPrice;
					OLI.Quantity = 0;
					lstOppyLines.add(new WrapperOpportunityLines(mapSelectedProducts.get(PBEntry.Product2Id),OLI));
				}else{
					OpportunityLineItem OLI = mapExistingLineItems.get(oppyID + '|' + PBEntry.Id);
					lstOppyLines.add(new WrapperOpportunityLines(mapSelectedProducts.get(PBEntry.Product2Id),OLI));
				}
				//arrInsertOLIs.add(OLI);
			}
			
			System.debug('arrInsertOLIs =' + arrInsertOLIs);
	        PageReference pageRef = Page.AddPriceToPlans;
	        return pageRef;
		}else{
			String msg = '';
			msg = 'Please add price book to opportunity before adding a product.';
            currentMsg = new ApexPages.Message(ApexPages.severity.ERROR, msg);
            ApexPages.addMessage(currentMsg);
            return null;
		}
		return null;
		//update lstOppyLineItems;
	}
	public void save(){
		arrInsertOLIs.clear();
		for(WrapperOpportunityLines objOppyLine: lstOppyLines){
			OpportunityLineItem objOLI = objOppyLine.OLI;
			if(objOLI.Quantity > 0){
				arrInsertOLIs.add(objOLI);
			}
		}
		if(arrInsertOLIs.size() > 0){
			upsert arrInsertOLIs;
		}
		
	}
	public PageReference cancel(){
		PageReference pageRef = new PageReference('/' + oppyID);
        pageRef.setRedirect(true);
        return pageRef;
	}
	public PageReference selectAndAddPrice(){
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
	
	public PageReference previous(){
		 PageReference pageRef = Page.SelectFamily;
	     return pageRef;
	}
	public PageReference next(){
		 PageReference pageRef = Page.SelectEntityType;
	     return pageRef;
	}
	public void retrieveProductFamily(){
		Schema.Describefieldresult familyPick = Product2.Family.getDescribe();
		List<Schema.Picklistentry> pList = familyPick.getPicklistValues();
		for(Integer i=0; i<pList.size(); i++){
		  lstFamily.add(new WrapperFamily(false, String.valueOf(pList.get(i).getValue())));        
		}
		
	}
	public void retrieveEntityType(){
		Schema.Describefieldresult entityTypePick = Product2.Entity_Type__c.getDescribe();
		List<Schema.Picklistentry> pList = entityTypePick.getPicklistValues();
		for(Integer i=0; i<pList.size(); i++){
		  lstEntityType.add(new WrapperEntityType(false, String.valueOf(pList.get(i).getValue())));        
		}
		
	}
	public class WrapperFamily{
		public Boolean isSelected {get;set;}
		public String familyName {get;set;}
		public WrapperFamily(Boolean isSelected, String fName){
			this.isSelected = isSelected;
			this.familyName = fName;
		}
	}
	public class WrapperEntityType{
		public Boolean isSelected {get;set;}
		public String entityTypeName {get;set;}
		public WrapperEntityType(Boolean isSelected, String eName){
			this.isSelected = isSelected;
			this.entityTypeName = eName;
		}
	}
	public class WrapperOpportunityLines{
		public Product2 product {get;set;}
		public OpportunityLineItem OLI {get;set;}
		public WrapperOpportunityLines(Product2 p, OpportunityLineItem OLI){
			this.product = p;
			this.OLI = OLI;
		}
	}
	
}