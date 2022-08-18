@isTest
public class Test_trgInsertAddressinEntity {
    
    static testMethod void Test() {
       

        Account acc1= new Account(); 
        acc1.Name='SFDC TEST1';
        insert acc1;
        
        
        Account acc2= new Account();
        acc2.Name='SFDC TEST2';
        insert acc2;
        
        
        Account acc3= new Account();
        acc3.Name='SFDC TEST3';
        insert acc3;
        
        String picklistval1 = 'Client Address';
        String picklistval2 = 'BOSS Address';
        String picklistval3 = 'Wyoming';
        String t1='3225 McLeod Dr, Suite 100 Las Vegas, NV 89121';
        String t2='1623 Central Ave, Suite 209 Cheyenne, WY 82001';
        
        Entities__c e1 = new Entities__c();
        e1.Name='Test';
        e1.Primary_Client__c =acc1.id;
        e1.Business_Address__c=picklistval1;
        
        insert e1;
        
        Entities__c e2 = new Entities__c();
        e2.Name='Test2';
        e2.Primary_Client__c =acc2.id;
        e2.Business_Address__c=picklistval2;
        
        insert e2;
        
              
        Entities__c e3 = new Entities__c();
        e3.Name='Test3';
        e3.Primary_Client__c =acc3.id;
        e3.Business_Address__c=picklistval3;
        
        insert e3;
                

                
    }
       

}