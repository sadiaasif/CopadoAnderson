@isTest(seealldata=true)
public class TaxtasktabctrlTest {
@isTest
    static void Testtaxtax()
    {
      
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
      
        insert testAccount; 
       
        contact con=new contact();
        con.LastName='test contact';
        con.AccountId=testAccount.id;
        insert Con;
        
        List<task> taxtasklist=new list<task>();
        Task taxtax=new Task();
        taxtax.RecordTypeID='0120B000000t7pqQAA';
         taxtax.OwnerId='0050B000006okJaQAI';
         taxtax.Subject='Test Task 1';
        taxtax.Client__c=testAccount.id;
         taxtax.Priority='Normal';
       
        taxtasklist.add(taxtax);
        
        Task taxtax1=new Task();
        taxtax1.RecordTypeID='0120B000000t7pqQAA';
         taxtax1.OwnerId='0050B000006okJaQAI';
         taxtax1.Subject='Test Task 2';
        taxtax1.Client__c=testAccount.id;
         taxtax1.Priority='Normal';
       taxtasklist.add(taxtax1);
        
         Task taxtax2=new Task();
        taxtax2.RecordTypeID='0120B000000t7pqQAA';
         taxtax2.OwnerId='0050B000006okJaQAI';
         taxtax2.Subject='Test Task 3';
        taxtax2.Client__c=testAccount.id;
         taxtax2.Priority='Normal';
       taxtasklist.add(taxtax2);
        
              Task taxtax3=new Task();
        taxtax3.RecordTypeID='0120B000000t7pqQAA';
         taxtax3.OwnerId='0050B000006okJaQAI';
         taxtax3.Subject='Test Task 3';
        taxtax3.WhoId=con.Id;
         taxtax3.Priority='Normal';
       taxtasklist.add(taxtax3);
        insert taxtasklist;
        
        Test.startTest();
      ID accid;
        List<Account> accs=[Select id,name from Account where name ='Test Account'];
        for(Account a:accs){
          accid=a.id;
            
        }
       Taxtasktabctrl.getTaxtasks(accid);
        
        test.stopTest();
    }
    @isTest
    static void Testtaxtax2()
    {
      
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
      
      
        insert testAccount; 
        
        List<task> taxtasklist=new list<task>();
        Task taxtax=new Task();
        taxtax.RecordTypeID='0120B000000t7pqQAA';
         taxtax.OwnerId='0050B000006okJaQAI';
         taxtax.Subject='Test Task 1';
        taxtax.Client__c=testAccount.id;
         taxtax.Priority='Normal';
       
        taxtasklist.add(taxtax);
        
        Task taxtax1=new Task();
        taxtax1.RecordTypeID='0120B000000t7pqQAA';
         taxtax1.OwnerId='0050B000006okJaQAI';
         taxtax1.Subject='Test Task 2';
        taxtax1.Client__c=testAccount.id;
         taxtax1.Priority='Normal';
       taxtasklist.add(taxtax1);
        
         Task taxtax2=new Task();
        taxtax2.RecordTypeID='0120B000000t7pqQAA';
         taxtax2.OwnerId='0050B000006okJaQAI';
         taxtax2.Subject='Test Task 3';
        taxtax2.Client__c=testAccount.id;
         taxtax2.Priority='Normal';
       taxtasklist.add(taxtax2);
        
        insert taxtasklist;
        
        Test.startTest();
     
       Taxtasktabctrl.updateTaxtaskrecord(taxtasklist);
        
        
        test.stopTest();
    }
    @isTest
    static void Testtaxtax3()
    {
      
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
      
      
        insert testAccount; 
        
        contact con=new contact();
        con.LastName='test contact';
        con.AccountId=testAccount.id;
        insert Con;
        List<task> taxtasklist=new list<task>();
        Task taxtax=new Task();
        taxtax.RecordTypeID='0120B000000t7pqQAA';
         taxtax.OwnerId='0050B000006okJaQAI';
         taxtax.Subject='Test Task 1';
        taxtax.Client__c=testAccount.id;
         taxtax.Priority='Normal';
       
        taxtasklist.add(taxtax);
        
        Task taxtax1=new Task();
        taxtax1.RecordTypeID='0120B000000t7pqQAA';
         taxtax1.OwnerId='0050B000006okJaQAI';
         taxtax1.Subject='Test Task 2';
        taxtax1.Client__c=testAccount.id;
         taxtax1.Priority='Normal';
       taxtasklist.add(taxtax1);
        
         Task taxtax2=new Task();
        taxtax2.RecordTypeID='0120B000000t7pqQAA';
         taxtax2.OwnerId='0050B000006okJaQAI';
         taxtax2.Subject='Test Task 3';
        taxtax2.Client__c=testAccount.id;
         taxtax2.Priority='Normal';
       taxtasklist.add(taxtax2);
                       Task taxtax3=new Task();
        taxtax3.RecordTypeID='0120B000000t7pqQAA';
         taxtax3.OwnerId='0050B000006okJaQAI';
         taxtax3.Subject='Test Task 3';
        taxtax3.WhoId=con.Id;
         taxtax3.Priority='Normal';
       taxtasklist.add(taxtax3);
        insert taxtasklist; 
        
  
        
        Test.startTest();
      ID accid;
        String searchKey='Test';
        List<Account> accs=[Select id,name from Account where name ='Test Account'];
        for(Account a:accs){
          accid=a.id;
            
        }
       Taxtasktabctrl.findByName(searchKey,accid);
        
        test.stopTest();
    }
     @isTest
    static void Testtaxtax4()
    {
      
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
      
      
        insert testAccount; 
        List<task> taxtasklist=new list<task>();
        
        
        Test.startTest();
        Task taxtax3=new Task();
     taxtax3.RecordTypeID='0120B000000t7pqQAA';
       taxtax3.OwnerId='0050B000006okJuQAI';
         taxtax3.Subject='Test Task 3';
        taxtax3.Client__c=testAccount.id;
         taxtax3.Priority='Normal';
        taxtasklist.add(taxtax3);
        Taxtasktabctrl.updateTaxtaskrecord(taxtasklist);
        test.stopTest();
    }
}