@isTest
private class TestctrlLeadRelatedList{

    static testMethod void myUnitTest() {
      
      Sales_Rep__c sr = new Sales_Rep__c();
      sr.Name = 'Test';
      insert sr;
      
      Lead ld = new Lead();
      ld.FirstName = 'testFirstName';
      ld.LastName = 'testLastName';
      insert ld;
      
      ApexPages.StandardController stdSR = new ApexPages.StandardController(sr);
       
      System.currentPageReference().getParameters().put('id',sr.id); 
      System.currentPageReference().getParameters().put('oppid',ld.id);
      ctrlLeadRelatedList objTaskList = new ctrlLeadRelatedList(stdSR);
    
        
    }
}