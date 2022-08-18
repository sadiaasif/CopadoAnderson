@istest
public class BookkeepingctrlTest {
   @testSetup
    public static void createData() {
       
        
        Account a = new Account();
        a.Name = 'Test Account';
        a.First_Name__c='Test';
        a.Last_Name__c='Account';
        insert a;
        
         Contact con = new Contact();
        con.FirstName='Test';
        con.LastName='Contact';
        con.AccountId=a.id;
        insert con;
        
         case c=new case();
        c.Subject='Test Subject';
        c.AccountId=a.id;
        c.ContactId=con.id;
        c.RecordTypeId='012U0000000g6UYIAY';
        c.Info_Sent_to_ABA_By__c='Access';
        c.Number_of_Entities__c='7';
        c.QuickBooks_Version__c='QBO';
        insert c;
        
           case c1=new case();
        c1.Subject='Second case';
       
        
        insert c1;
        
        Set_of_Books__c bookset = new Set_Of_Books__c();
        bookset.Client__c = a.id;
        bookset.Name = 'Test Bookset';
         bookset.Bookkeeper__c='Abraham Carrillo';
        bookset.Bookkeeping_Reviewer__c='Blanca Lemus';
        insert bookset;
        
        Bookkeeping__c bk = new Bookkeeping__c();
        bk.Name = 'Test BK Record';
        bk.Set_of_Books__c = bookset.id;
        bk.Bookkeeper__c='Abraham Carrillo';
        bk.Bookkeeper_Reviewer__c='Blanca Lemus';
        bk.Completing_Books_for_Tax_Year__c='2019';
        bk.Fiscal_Year_End__c='Dec';
        insert bk;
        
    }
     @isTest
    public static void bookkeeperChange() {
        Case c=[Select id from Case where Subject='Test Subject' Limit 1];
         Case c2=[Select id from Case where Subject='Second case' Limit 1];
        User u = [SELECT Id FROM User WHERE id ='0050B000006o1gqQAA' Limit 1];
        string Name='Test';
               List<Set_of_Books__c> SetofbooksList=new List<Set_of_Books__c>();
        List<Set_of_Books__c> SetofbooksList2=new List<Set_of_Books__c>();
        test.startTest();
        System.runAs(u) {
     
    SetofbooksList= BookkeepingCtrl.getSetofbooks(c.id,u.id);
            	BookkeepingCtrl.getbookkeepingRecords(c.id,u.id);
            	BookkeepingCtrl.getClientId(c.id);
            BookkeepingCtrl.getcontactId(c.id);
            	BookkeepingCtrl.findByNameSetofBooks(Name,c.id,u.id);
            BookkeepingCtrl.findByNameBookkeepingRecords(Name,c.id,u.id);
           System.assertEquals(1,SetofbooksList.size() , 'Please Check!');
            
           SetofbooksList2= BookkeepingCtrl.getSetofbooks(c2.id,u.id);
            	BookkeepingCtrl.getbookkeepingRecords(c2.id,u.id);
            	BookkeepingCtrl.getClientId(c2.id);
             BookkeepingCtrl.getcontactId(c2.id);
            	BookkeepingCtrl.findByNameSetofBooks(Name,c2.id,u.id);
            BookkeepingCtrl.findByNameBookkeepingRecords(Name,c2.id,u.id);
      
        }
        test.stopTest();
        
        
     
    }

    
}