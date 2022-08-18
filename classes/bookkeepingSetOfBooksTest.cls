@isTest
public class bookkeepingSetOfBooksTest {
    
    @testSetup static void createData() {
        
		Account a = new Account();
        a.Name = 'Bazam';
        insert a;
        
        Set_Of_Books__c bookSet = new Set_of_Books__c();
        bookSet.Client__c=a.id;
        bookSet.name = 'Testing Five Six';
        insert bookSet;
        
        Bookkeeping__c bk = new Bookkeeping__c();
        bk.Client_Name__c = a.id;
        bk.Name = 'Entity YTZ';
        bk.Set_of_Books__c = bookSet.id;
        insert bk;
        
        Bookkeeping__c bk1 = new Bookkeeping__c();
        bk1.Client_Name__c = a.id;
        bk1.Name = 'Entity NBC';
        bk1.Set_of_Books__c = bookSet.id;
        insert bk1;

    }
    
    @isTest 
    public static void setOfBooks() {
        
       bookkeeping__c bk = [SELECT Id,Jan_Bookkeeping_Stages__c FROM Bookkeeping__c WHERE Name = 'Entity YTZ'];
       bk.Jan_Bookkeeping_Stages__c = 'Completed';
       update bk;
        
       bookkeeping__c bk1 = [SELECT Id,Jan_Bookkeeping_Stages__c FROM Bookkeeping__C WHERE Name = 'Entity NBC'];
       System.assertEquals('Completed', bk1.Jan_Bookkeeping_Stages__c);
        
        checkRecursive.runOnce();
        checkRecursive.runOnce1();
        checkRecursive.runOnce2();
        checkRecursive.runOncetrgUpdateAccOppSourceType();
    }

}