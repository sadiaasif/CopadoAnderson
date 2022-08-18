public class ctrlTaskRelatedList{
    
    public List<Task> lstTask{get; set;}
    public List<Opportunity> lstopp{get; set;}
    public string SalesRepid {get; set;}
    public string taskId {get; set;}
    
   public ctrlTaskRelatedList(ApexPages.StandardController controller) {
        lstTask = new List<Task>();
        SalesRepid = Apexpages.currentpage().getParameters().get('id');
        Set<Id> oppid = new Set<Id>();
        if(SalesRepid != null){
            
            lstopp = [select id,Sales_Rep__r.Name from Opportunity where Sales_Rep__c =:SalesRepid];
            for(Opportunity  opp:lstopp ){
                oppid.add(opp.Id);     
            }
            lstTask = [select id,Who.Name,WhatId,What.Name,Priority,Owner.Name,ActivityDate,Subject,Description,Status,Type from Task where WhatId IN :oppid];
        }
    }
    
    public Pagereference EditTask(){
        taskId = Apexpages.currentpage().getParameters().get('taskId');
        
        Pagereference pr = new Pagereference('/'+taskId+'/e?retURL='+SalesRepid);
        
        return pr;
    }
    public Pagereference DeleteTask(){
        taskId = Apexpages.currentpage().getParameters().get('taskId');
        if(taskId != null && taskId != ''){
            List<Task> lstdelTask = [select id from Task where id =:taskId];
            //lstdelTask[0].Sales_Rep__c = null;
            delete lstdelTask;
        }
        Pagereference pr = new Pagereference('/'+SalesRepid);
        return pr;
    }
    
}