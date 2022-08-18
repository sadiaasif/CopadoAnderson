@isTest
private class ctrlCreateSubscriptionTest {

    static testMethod void ctrlCreateSubscriptionTest() {
        Pricebook2[] PBs = [Select p.Name, p.Id From Pricebook2 p where Name = 'Standard Price Book'];
        Opportunity o = new Opportunity();
        o.Name = 'Test Oppy';
        o.CloseDate = System.today();
        o.StageName = 'Closed Won';
        o.Pricebook2Id = PBs[0].Id;
        insert o;
              
        Subscription__c objsubscription = new Subscription__c();
        objsubscription.Opportunity__c = o.id;
        insert objsubscription;
        
        Entities__c objEntity = [select Id, Name from Entities__c limit 1];
        objEntity.Name = 'Test2';
        update objEntity;
        
        Deals_Entities__c objdeEnt = new Deals_Entities__c();
        objdeEnt.Deals__c = o.id;
        objdeEnt.Entity__c = objEntity.id;
        insert objdeEnt;
        
        Subscriptions_Entities__c objsubsEnt = new Subscriptions_Entities__c();
        objsubsEnt.Subscription__c = objsubscription.id;
        objsubsEnt.Entity__c = objEntity.id;
        insert objsubsEnt;
        
        List<Subscription__c> lstSubscription = new List<Subscription__c>();
        lstSubscription.add(objsubscription);
        
        Apexpages.currentpage().getParameters().put('id',o.id);
        ApexPages.StandardController stdOpp = new ApexPages.StandardController(o);
        ApexPages.StandardsetController stdSub = new ApexPages.StandardsetController(lstSubscription);
        
        ctrlCreateSubscription objctrlCrsub1 = new ctrlCreateSubscription();
        ctrlCreateSubscription objctrlCrsub2 = new ctrlCreateSubscription(stdOpp);
       
        ctrlCreateSubscription objctrlCrsub3 = new ctrlCreateSubscription(stdSub);
        objctrlCrsub3.savesubscription();
        
        Apexpages.currentpage().getParameters().put('id',objsubscription.id);
        ctrlCreateSubscription objctrlCrsub = new ctrlCreateSubscription(stdSub);
        objctrlCrsub.savesubscription();
        objctrlCrsub.saveandnewsubscription();
        objctrlCrsub.cancelsubscription();
        objctrlCrsub.getlstProduct();
        objctrlCrsub.setProduct();
        //objctrlCrsub.SearchProduct();
        objctrlCrsub.SearchEntity();
        objctrlCrsub.done();
        objctrlCrsub.setEndDate();
        objctrlCrsub.AddEntity();
        objctrlCrsub.SelectedEntityId();
        objctrlCrsub.CreateEntity();
        objctrlCrsub.RemoveEntity();
        objctrlCrsub.NextToStep2();
        objctrlCrsub.PreviousToStep1();
        objctrlCrsub.NextToStep3();
        objctrlCrsub.PreviousToStep2();
        objctrlCrsub.NextToStep4();
        objctrlCrsub.PreviousToStep3();
        objctrlCrsub.Cancel();
        //objctrlCrsub.Save();
        
       
    }
}