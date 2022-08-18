@isTest
private class TestctrlSalesRelatedList {

    static testMethod void myUnitTest() {
      
      Sales_Rep__c sr = new Sales_Rep__c();
      sr.Name = 'Test';
      insert sr;
      
      Pricebook2[] PBs = [Select p.Name, p.Id From Pricebook2 p where Name = 'Standard Price Book'];
      Opportunity o = new Opportunity();
      o.Name = 'Test Oppy';
      o.CloseDate = System.today();
      o.StageName = 'Closed Won';
      o.Pricebook2Id = PBs[0].Id;
      o.Sales_Rep__c = sr.id;
      insert o;
      
     
      
     // ApexPages.StandardController stdSR = new ApexPages.StandardController(sr);
       
     // System.currentPageReference().getParameters().put('id',sr.id); 
     // System.currentPageReference().getParameters().put('oppid',o.id);
      //ctrlSalesRelatedList objSRList = new ctrlSalesRelatedList(stdSR);
      
      
      //objSRList.EditOpportunity();
      //objSRList.DeleteOpportunity();
      
        
    }
}