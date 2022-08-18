public class FbSfdatuploadcalloutclsBatchCall implements Schedulable {
    public void execute(SchedulableContext sc) {
        
     String taskQuery='';
         Id batchJobId1;
        if(!Test.isRunningTest()){
        taskQuery='Select id, Email__c, Phone__c, FirstName__c, LastName__c, CreatedDate, Event_Time_Unix_Timestamp__c,Amount__c,Service_Item_Quantity__c, Event_Time__c, City__c, Country__c, Service_Items_Name__c, Service_Item_IDs__c ,ZIPcode__c ,State__c from FacebookoBject__c where DateCreated__c=Today'; 
        }else{
              taskQuery='Select id, Email__c, Phone__c, FirstName__c, LastName__c, CreatedDate, Event_Time_Unix_Timestamp__c,Amount__c,Service_Item_Quantity__c, Event_Time__c, City__c, Country__c, Service_Items_Name__c, Service_Item_IDs__c ,ZIPcode__c ,State__c from FacebookoBject__c ';
        }
          if(!Test.isRunningTest()){
          batchJobId1 = Database.executeBatch(new FbSfdatuploadcalloutcls(taskQuery), 5);
         }else{
              batchJobId1 = Database.executeBatch(new FbSfdatuploadcalloutcls(taskQuery), 200);
         }
      
    }
}