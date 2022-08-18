public class ctrlEntitySubscriptionList{
    public List<Subscriptions_Entities__c> lstSubscrEntity{get; set;}
    public string oppid {get; set;}
    
    public ctrlEntitySubscriptionList(ApexPages.StandardController controller) {
    
        lstSubscrEntity = new List<Subscriptions_Entities__c>();
        oppid = Apexpages.currentpage().getParameters().get('id');
        if(oppid != null){
            lstSubscrEntity = [select id,Entity__c,Subscription__c,Entity__r.Name,Subscription__r.Name,Subscription__r.Opportunity__c from Subscriptions_Entities__c where Subscription__r.opportunity__c =:oppid];
        }
    }
   
}