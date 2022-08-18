@isTest
private class testAccountHandler
{
    @isTest
    static void insertAccount()
    {
        
        Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
        
        Account acc1 = [SELECT Id, Important_Notes__c from Account LIMIT 1];  
        acc1.Important_Notes__c='test important notes update ';
        update acc1;  
        
    }
    
    @isTest
    static void UpdateAccountNotesAreNull()
    {
        
        Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='';
        insert acc;
        
        test.startTest();
        Account acc1 = [SELECT Id, Important_Notes__c from Account LIMIT 1];  
        acc1.Important_Notes__c='test important notes update ';
        update acc1;
        test.stopTest();
        
    }
    
    @isTest
    static void UpdateAccountNotesAreNotNull()
    {
        
        Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
        
        test.startTest();
        Account acc1 = [SELECT Id, Important_Notes__c from Account LIMIT 1];  
        acc1.Important_Notes__c='test important notes update ';
        update acc1;  
        test.stopTest();
        
    }
    
}