@isTest(SeeAllData=false)
public class UpdateClientFieldTestclass {
    
    public static testmethod void testupdateclientfieldMethod()
    {
        Account tstAcc = new Account();
        tstAcc.Name='Test Account' ;
        tstAcc.First_Name__c='Edward';
        tstAcc.Last_Name__c='Lee';
        insert tstAcc;
        Blueprint__c b=new Blueprint__c();
        b.Name='test blueprint';
        b.AccountId__c=tstAcc.id;
        test.startTest();
        insert b;
        test.stopTest();
    }
    
}