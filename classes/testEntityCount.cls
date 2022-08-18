@isTest
public class testEntityCount {
    
    @testSetup static void createData(){
        
       Account acc = new Account();
       acc.Name = 'Test Account';
       insert acc;
        
       List<Entities__c> updateList = new List<Entities__c>(); 
        
       for (Integer i = 0; i<20; i++){
       Entities__c myEnt = new Entities__c();
       myEnt.Primary_Client__c = [SELECT Id From Account].id;    
       myEnt.Name = 'Entity_'+i;
       myEnt.Origin__c = 'Anderson';
       myEnt.Organization_State__c = 'Maine';
       updateList.add(myEnt);
       }
        
        insert updateList;
        
    }
    
    @isTest static void accountCheck() {
        
        Account acc = [Select Id from Account Limit 1];
       	acc.Nickname__c = 'Mr. Apples';
        update acc;
        
        Account updatedAcc = [SELECT Id, Entity_Count__c from Account Limit 1];
        
        System.assert(updatedAcc.Entity_Count__c != null);
       
        
    }

}