@isTest
private class TestctrlTaskRelatedList{

    static testMethod void myUnitTest() {
      
      Sales_Rep__c sr = new Sales_Rep__c();
      sr.Name = 'Test';
      insert sr;
      
      Task objTask = new Task();
      objTask.OwnerId = system.userInfo.getUserId();
      objTask.Subject = 'Call';
      insert objTask;
      
     
      
      ApexPages.StandardController stdSR = new ApexPages.StandardController(sr);
       
      System.currentPageReference().getParameters().put('id',sr.id); 
      System.currentPageReference().getParameters().put('oppid',objTask.id);
      ctrlTaskRelatedList objTaskList = new ctrlTaskRelatedList(stdSR);
      
      
      objTaskList.EditTask();
      objTaskList.DeleteTask();
      
        
    }
}