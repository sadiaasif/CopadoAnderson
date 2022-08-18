// SCH-0048
@istest
public class setOfBooksHandlerTest {
        
    @testSetup
    public static void createData() {
        
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        
        Set_of_Books__c bookset = new Set_Of_Books__c();
        bookset.Client__c = a.id;
        bookset.Name = 'Test Bookset';
        insert bookset;
        
        Bookkeeping__c bk = new Bookkeeping__c();
        bk.Name = 'Test BK Record';
        bk.Set_of_Books__c = bookset.id;
        insert bk;
        
    }
    
    @isTest
    public static void setOfBooksSyncTest() {
        
        Set_of_Books__c bookset = [SELECT Id, Bookkeeper__c, Jan_Bookkeeping_Stages__c, Fiscal_Year_End__c, Completing_Books_for_Tax_Year__c, Sent_To_Tax__c FROM Set_of_Books__c];
        
        bookset.Bookkeeper__c 			  		 = 'Abraham Carrillo';
        bookset.Jan_Bookkeeping_Stages__c 		 = 'Not Started';
        bookset.Fiscal_Year_End__c 		  		 = 'Jan';
        bookset.Completing_Books_for_Tax_Year__c = '2018';
        bookset.Sent_To_Tax__c 					 = Date.today();
        update bookset;
        
        Bookkeeping__c bk = [SELECT Id, Bookkeeper__c, Jan_Bookkeeping_Stages__c, Fiscal_Year_End__c, Completing_Books_for_Tax_Year__c, Sent_To_Tax__c FROM Bookkeeping__c];
        System.assertEquals('Abraham Carrillo', bk.Bookkeeper__c);
        system.assertEquals('Not Started', bk.Jan_Bookkeeping_Stages__c);
        System.assertEquals('Jan', bk.Fiscal_Year_End__c);
        System.assertEquals('2018', bk.Completing_Books_for_Tax_Year__c);
        System.assertEquals(Date.today(), bk.Sent_to_Tax__c);
        
    }

}