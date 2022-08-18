@isTest
public class NotarizationGetDocumentTest {
 @isTest static void testPostCallout() {
		 Notarization__c n=new Notarization__c();
     n.Transaction_ID__c='ot_n8ba8mn';
     n.Transaction_Status__c='Completed';
     Insert n;
     Account a =new Account();
     a.First_Name__c='Erica';
     a.Last_Name__c='Terrel';
     a.Name='Erica';
     a.E_Mail__c='eterrell@andersonadvisors.com';
         insert a;
      Contact con =new Contact();
    con.accountID=a.id;
     con.FirstName='Erica';
     con.LastName='Terrel';
     con.Email='eterrell@andersonadvisors.com';
     insert con;
        test.startTest();
    
    Test.setMock(HttpCalloutMock.class, new NotarizecalloutMock());
        List<String> TransactionIds=New List<String>();
     TransactionIds.add('ot_n8ba8mn');
        NotarizationGetDocument.makePostCallouttogetDocument(TransactionIds);
       Notarization__c nUpdate=[Select id, SignorEmail__c from Notarization__c where Transaction_ID__c= 'ot_n8ba8mn' limit 1];
       System.assertEquals('eterrell@andersonadvisors.com',nUpdate.SignorEmail__c , 'Please Check!');
      
        test.stopTest();
        
    }
}