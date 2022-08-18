@isTest
public class ClientNotesComponentctrlTest {
  @testSetup
    public static void createTestData() {
     
        List<Account> acList=new List<Account>();
           List<Note__c> NoteList=new  List<Note__c>();
        
           Account a = new Account();
        a.Name = 'Bob Apples';
        a.First_Name__c='Bob';
        a.Last_Name__c='Apples';
        
       acList.add(a);
           Account a1 = new Account();
        a1.Name = 'Bob2 Apples2';
        a1.First_Name__c='Bob2';
        a1.Last_Name__c='Apples2';
        a1.Date_User_Advisor_Notes__c='Test Advisor notes';
        a1.Date_User_Partner_Notes__c='Test Partner Notes';
        a1.Bookkeeping_Notes__c='Test Bk Notes';
        a1.Service_Notes__c='Test Service Notes';
        a1.Tax_Notes__c='Test Tax Notes';
        a1.Renewal_Notes__c='Test Renewal Notes';
          a1.Update_Tax_Consult_Notes__c='Test tax consult Notes';
          a1.Update_Structure_Comments__c='Test Structure Notes';
          a1.Update_Keep_more_Solution__c='Test Keep more Solution Notes';
       acList.add(a1);
        insert acList;
        
        
        Note__c n1=new Note__c();
        n1.Notes_Type__c='Advisor';
        n1.Client__c=a1.id;
        n1.Notes__c='Test Advisor Notes 1';
          Note__c n2=new Note__c();
        n2.Notes_Type__c='Structure';
        n2.Client__c=a1.id;
        n2.Notes__c='Test Structure Notes 1';
          Note__c n3=new Note__c();
        n3.Notes_Type__c='Tax';
        n3.Client__c=a1.id;
        n3.Notes__c='Test Tax Consult Notes 1';
         Note__c n4=new Note__c();
        n4.Notes_Type__c='Tax Consult';
        n4.Client__c=a1.id;
        n4.Notes__c='Test Tax Consult Notes 1';
         Note__c n5=new Note__c();
        n5.Notes_Type__c='Keep more solution';
        n5.Client__c=a1.id;
        n5.Notes__c='Test Keep more solution Notes 1';
        NoteList.add(n5);
        insert n5;
      
        
    }
    @isTest
    static void TestaccordionDisplay(){
        Account a =[Select id,Name from account where First_Name__c='Bob2' limit 1];
        List <Note__c> NoteList=[Select id,Notes_Type__c,Notes__c from Note__c where Client__c=:a.id ];
                   User u =[Select id,Name from user where name='Anderson Advisors' and IsActive=True Limit 1];
        string Notetype='Advisor';
        string Notes='Test 123';
        test.startTest();
        ClientNotesComponentctrl.getstructureNotes(a.Id);
         ClientNotesComponentctrl.getTaxNotes(a.Id);
        ClientNotesComponentctrl.getNotesTypepicklist();
        ClientNotesComponentctrl.updatedAllNotesRecords(NoteList);
         ClientNotesComponentctrl.updatedNotesRecords(a.Id,Notes,Notetype,u.id);
        
    }
}