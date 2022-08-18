@isTest(seeAllData = false)
private class ActiveUserSendEmailTest {

    @isTest static void testSendMail(){
        Profile p = [select id from profile where name='Partner Community User'];
        Account acc = new Account(name='Test Account');
        acc.First_Name__c ='test';
        acc.Last_Name__c = 'chetu';
         insert acc;
         Contact cont = new Contact();
        cont.AccountId = acc.Id;
        cont.FirstName ='test2';
        cont.LastName ='ttestchetu';
        insert cont;
         User usr = new User();
        usr.Email = 'test@gmail.com';
        usr.Username ='tester@chetu.com';
        usr.LastName ='chetu';
        usr.Alias = 'testc';
        usr.ProfileId =p.id;
        usr.TimeZoneSidKey = 'GMT';
        usr.LocaleSidKey ='en_US';
        usr.EmailEncodingKey ='ISO-8859-1';
        usr.LanguageLocaleKey ='en_US';
        usr.isActive = true;
        //usr.AccountId = acc.id;
        usr.ContactId = cont.id;
          insert usr;  
         Opportunity oprt = new Opportunity();
          oprt.CloseDate  = Date.Today().addDays(1) ;
          oprt.StageName = 'Closed Won';
          oprt.Name ='Platinum Subscription';
          oprt.AccountId = acc.Id;
         insert oprt; 
       
        
    }
}