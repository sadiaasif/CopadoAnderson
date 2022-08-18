public class ctrlSalesRelatedList{
    public List<Opportunity> lstOpportunity{get; set;}
    public string SalesRepid {get; set;}
    public string oppid {get; set;}

    
    public Decimal intTotalAmt {get; set;}
    public ctrlSalesRelatedList(ApexPages.StandardController controller) {
        intTotalAmt  = 0;
        lstOpportunity = new List<Opportunity>();
        SalesRepid = Apexpages.currentpage().getParameters().get('id');
        if(SalesRepid != null){
            lstOpportunity = [select id,Name,Account.Name,CloseDate,Amount,Sales_Rep__c from Opportunity where Sales_Rep__c =:SalesRepid];
        }
        
        for(Opportunity o: lstOpportunity){
            intTotalAmt += o.Amount;
        }
    }
    public Pagereference EditOpportunity(){
        oppid = Apexpages.currentpage().getParameters().get('oppid');
        
        Pagereference pr = new Pagereference('/'+oppid+'/e?retURL='+SalesRepid);
        
        return pr;
    }
    public Pagereference DeleteOpportunity(){
        oppid = Apexpages.currentpage().getParameters().get('oppid');
        if(oppid != null && oppid != ''){
            List<Opportunity> lstdelOpp = [select id,Name,Account.Name,CloseDate,Amount,Sales_Rep__c from Opportunity where id =:oppid ];
            lstdelOpp[0].Sales_Rep__c = null;
            delete lstdelOpp;
        }
        Pagereference pr = new Pagereference('/'+SalesRepid);
        return pr;
    }
   
}