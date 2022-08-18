public with sharing class AndersonReceit 
{
Decimal TotalPrice=0.0, Balance = 0.0;
 public AndersonReceit(ApexPages.StandardController controller) {
 	
 	for(OpportunityLineItem o : [select ListPrice, UnitPrice, TotalPrice,ServiceDate,Quantity,Description from OpportunityLineItem where OpportunityId = :ClientId])
 	{
 		TotalPrice = TotalPrice + o.TotalPrice;
 	}
 	for(ChargentSFA__Transaction__c c : [select ChargentSFA__Amount__c, ChargentSFA__Gateway_Date__c, ChargentSFA__Credit_Card_Name__c, ChargentSFA__Credit_Card_Number__c, ChargentSFA__Card_Last_4__c from ChargentSFA__Transaction__c where ChargentSFA__Opportunity__c = : ClientId  and ChargentSFA__Response_Status__c = 'Approved'])
 	{
 		Balance = Balance + c.ChargentSFA__Amount__c;
 	}
 	if(Balance > TotalPrice)
     {        
        //TotalPrice  =  O.ChargentSFA__Charge_Amount__c;   
        Balance = -1;
     }
 	
 	Decimal tt =  TotalPrice - Balance;
		if(tt<0)
		{
			CheckVE = true;
		}
 }
	Id ClientId = System.currentPageReference().getParameters().get('Id');
	Opportunity opp = [select AccountID, ChargentSFA__Balance_Due__c,ChargentSFA__Charge_Amount__c,ChargentSFA__Payment_Method__c,ChargentSFA__Card_Type__c, ChargentSFA__Card_Last_4__c from Opportunity where id=:ClientId];
	Account ClientInfo = [select id,Name,BillingCity,BillingCountry,BillingPostalCode,Phone,E_Mail__c,BillingState,BillingStreet from Account where id = :opp.AccountId];
	
	public Account getClientInfo()
	{
		return ClientInfo;
	}
	public Opportunity getOpps()
	{
		return opp;
	}
	
	public String getDate()
	{
		return System.today().month()+'/'+System.today().day()+'/'+System.today().year();
	}
	
	public List<ChargentSFA__Transaction__c> getTransactions()
	{
		return [select ChargentSFA__Credit_Card_Type__c,ChargentSFA__Payment_Method__c,ChargentSFA__Amount__c, ChargentSFA__Gateway_Date__c, ChargentSFA__Credit_Card_Name__c, ChargentSFA__Credit_Card_Number__c, ChargentSFA__Card_Last_4__c from ChargentSFA__Transaction__c where ChargentSFA__Opportunity__c = : ClientId and ChargentSFA__Response_Status__c = 'Approved'];
	}
	
	public List<OpportunityLineItem> getProdInfo()
	{
		return [select ListPrice, Entity_Name__c, Service_Name__c, Invoice_Number__c, UnitPrice, TotalPrice,ServiceDate,Quantity,Description from OpportunityLineItem where OpportunityId = : ClientId];
	}
	
	public OpportunityLineItem getGrandTotal()
	{
		OL.TotalPrice = TotalPrice;
		return OL;
		
	} 
	OpportunityLineItem OL = new OpportunityLineItem();
	OpportunityLineItem OL1 = new OpportunityLineItem();
	 
	public Decimal bal = opp.ChargentSFA__Balance_Due__c;
	public Decimal getBal()
	{
		return bal;
	}
	public boolean CheckVE = false;
	public boolean getCheckVE()
	{
		return CheckVE;
	}
	public OpportunityLineItem getDueBalance()
	{
		Decimal t =0;
		if(Balance >= 0)
		  t = TotalPrice - Balance;
		 
		  
	    if(Balance ==-1)
	    	t = TotalPrice;
		//OL1.TotalPrice = Math.abs(bal);
		OL1.TotalPrice = Math.abs(t);
		/*if(t<0)
		{
			return '-'+('$'+t).split('-')[0]+''+('$'+t).split('-')[1];
		}
		else
		{
			return '$'+t;
		}*/
		return OL1;
	}
}