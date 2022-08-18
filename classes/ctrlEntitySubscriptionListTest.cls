@isTest
private class ctrlEntitySubscriptionListTest {

    static testMethod void ctrlEntitySubscriptionListTest () {
        Pricebook2[] PBs = [Select p.Name, p.Id From Pricebook2 p where Name = 'Standard Price Book'];
        Opportunity o = new Opportunity();
        o.Name = 'Test Oppy';
        o.CloseDate = System.today();
        o.StageName = 'Closed Won';
        o.Pricebook2Id = PBs[0].Id;
        insert o;
      
        Subscription__c objsubscription =  new Subscription__c();
        objsubscription.Opportunity__c = o.id;
        insert objsubscription;
        
        Apexpages.currentpage().getParameters().put('id',o.id);
        ApexPages.StandardController stdCon = new ApexPages.StandardController(o);
        ctrlEntitySubscriptionList obictrlEbtSub = new ctrlEntitySubscriptionList(stdCon);
        
     
    }
}