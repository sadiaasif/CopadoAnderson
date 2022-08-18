@istest
public with sharing class SetOfBooksBeforeHandlerTest {
    @testSetup
    public static void createData() {
        
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;

        Set_of_Books__c bookset = new Set_Of_Books__c();
        bookset.Client__c = a.id;
        bookset.Name = 'Test Bookset';
        insert bookset;
    }

    @isTest
    public static void updateTestBookkeepingReviewer() {
        Set_of_Books__c sob = [Select Id, Name, Bookkeeper__c, Bookkeeping_Reviewer__c, Bookkeeping_Status__c, Feb_Bookkeeping_Status__c, Mar_Bookkeeping_Status__c, April_Bookkeeping_Status__c, May_Bookkeeping_Status__c, June_Bookkeeping_Status__c, July_Bookkeeping_Status__c, Aug_Bookkeeping_Status__c, Sep_Bookkeeping_Status__c, Oct_Bookkeeping_Status__c, Nov_Bookkeeping_Status__c, Dec_Bookkeeping_Status__c, Client__r.Name From Set_of_Books__c Limit 1];
        
        sob.Bookkeeper__c = 'Ashley Cloutier';
        sob.Bookkeeping_Reviewer__c = 'Ashley Cloutier';
        update sob;

        sob.Bookkeeping_Status__c = 'Review';
        update sob;

        sob.Feb_Bookkeeping_Status__c = 'Completed';
        update sob;

        sob.Mar_Bookkeeping_Status__c = 'Review';
        update sob;

        sob.April_Bookkeeping_Status__c = 'Completed';
        update sob;

        sob.May_Bookkeeping_Status__c = 'Review';
        update sob;

        sob.June_Bookkeeping_Status__c = 'Completed';
        update sob;

        sob.July_Bookkeeping_Status__c = 'Review';
        update sob;

        sob.Aug_Bookkeeping_Status__c = 'Completed';
        update sob;

        sob.Sep_Bookkeeping_Status__c = 'Review';
        update sob;

        sob.Oct_Bookkeeping_Status__c = 'Completed';
        update sob;

        sob.Nov_Bookkeeping_Status__c = 'Review';
        update sob;

        sob.Dec_Bookkeeping_Status__c = 'Completed';
        update sob;
    }

    @isTest
    public static void updateTestBookkeeper() {
        Set_of_Books__c sob = [Select Id, Name, Bookkeeper__c, Bookkeeping_Reviewer__c, Bookkeeping_Status__c, Feb_Bookkeeping_Status__c, Mar_Bookkeeping_Status__c, April_Bookkeeping_Status__c, May_Bookkeeping_Status__c, June_Bookkeeping_Status__c, July_Bookkeeping_Status__c, Aug_Bookkeeping_Status__c, Sep_Bookkeeping_Status__c, Oct_Bookkeeping_Status__c, Nov_Bookkeeping_Status__c, Dec_Bookkeeping_Status__c, Client__r.Name From Set_of_Books__c Limit 1];
        
        sob.Bookkeeper__c = 'Ashley Cloutier';
        sob.Bookkeeping_Reviewer__c = 'Ashley Cloutier';
        update sob;

        sob.Bookkeeping_Status__c = 'Review Notes';
        update sob;

        sob.Feb_Bookkeeping_Status__c = 'Send Financials';
        update sob;

        sob.Mar_Bookkeeping_Status__c = 'Review Notes';
        update sob;

        sob.April_Bookkeeping_Status__c = 'Send Financials';
        update sob;

        sob.May_Bookkeeping_Status__c = 'Review Notes';
        update sob;

        sob.June_Bookkeeping_Status__c = 'Send Financials';
        update sob;

        sob.July_Bookkeeping_Status__c = 'Review Notes';
        update sob;

        sob.Aug_Bookkeeping_Status__c = 'Send Financials';
        update sob;

        sob.Sep_Bookkeeping_Status__c = 'Review Notes';
        update sob;

        sob.Oct_Bookkeeping_Status__c = 'Send Financials';
        update sob;

        sob.Nov_Bookkeeping_Status__c = 'Review Notes';
        update sob;

        sob.Dec_Bookkeeping_Status__c = 'Send Financials';
        update sob;
    }

    @isTest
    public static void insertTest() {
        Account a = [Select Id from Account Limit 1];

        Set_of_Books__c bookset = new Set_Of_Books__c();
        bookset.Client__c = a.id;
        bookset.Name = 'Test Bookset1';
        bookset.Bookkeeper__c = 'Ashley Cloutier';
        insert bookset;

        Set_of_Books__c bookset2 = new Set_Of_Books__c();
        bookset2.Client__c = a.id;
        bookset2.Name = 'Test Bookset2';
        bookset2.Bookkeeping_Reviewer__c = 'Ashley Cloutier';
        insert bookset2;
    }
}