@isTest
public class bookkeepingClientWideCommentsTest {
    
    
    @testSetup static void createData(){
        Account a = new Account();
        a.Name = '123';
        insert a;
        
        Bookkeeping__c bk = new Bookkeeping__c();
        bk.Name = '456';
        bk.Client_Name__c = a.id;
        insert bk;
        
        Bookkeeping__c bk2 = new Bookkeeping__c();
        bk.Name = '789';
        bk.Client_Name__c = a.id;
        insert bk2;
        
    }
    
    @isTest
    public static void commentUpdate() {
        
        Bookkeeping__c bk = [SELECT Id FROM Bookkeeping__c WHERE Name = '456'];
        bk.Client_Wide_Comments__c = 'New Comment';
        update bk;
        
        for (Bookkeeping__c allRecords : [SELECT Id,Client_Wide_Comments__c 
                                          FROM Bookkeeping__c 
                                          Where Name = '789']) {
            
            System.assertEquals('New Comment', allRecords.Client_Wide_Comments__c);
            
        }
        
    }
}