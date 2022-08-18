@isTest(seeAllData = false)
public class GetAccountTestClass {
    
    @testSetup
    public static void createTestData() {
        
        Account a1 = new Account();
        a1.Name = 'Bob2 Apples2';
        a1.First_Name__c='Bob2';
        a1.Last_Name__c='Apples2';
        insert a1;
    }
    
    @isTest
    static void TestBluePrint(){
        Account a =[Select id,Name from account where First_Name__c='Bob2' ];
        GetAccount.getAccount(a.id);
    }
    
}