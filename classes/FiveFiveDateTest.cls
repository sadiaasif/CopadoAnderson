@isTest
private class FiveFiveDateTest {
     public static Account testAccount = new Account();
    public static Contact cont = new Contact ();

    public static Opportunity testOpportunity = new Opportunity();
	public static void createTestData() {
        Id profileId = [select id from profile where name='Partner Community User'].id;
        
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='Edward';
        testAccount.Last_Name__c='Lee';
        testAccount.Assigned_CAM__c = 'Sara Winter';
        testAccount.Assigned_CSR__c = 'Ambria Tibbs';
        testAccount.phone='123456782';
        insert testAccount;
        
        cont.FirstName = 'FirstName';
        cont.LastName = 'LastName';
        cont.Email='email@email.com';
        cont.phone='12345678';
        cont.AccountId=testAccount.Id;
        insert cont;
        
    
        
      
    }
	@isTest static void FiveFiveDateTest() {
          createTestData();
          test.startTest();
        checkRecursive.run6=true;
       Entities__c et = new Entities__c();
        et.RecordTypeId = [SELECT Id, Name, DeveloperName, SobjectType FROM RecordType where Name = 'Limited Liability Company (LLC)' and SobjectType = 'Entities__c'].Id;
        et.Name ='Test Dec Entity';
        et.Origin__c = 'Anderson';
        et.Primary_Client__c =testAccount.id;
        //et.Primary_Client__c =test
        et.Organization_State__c = 'Wyoming';
        
        et.Status__c = 'Sent To Processing';
        et.Processing_Notes__c='19-11-2019 test1 ';
        et.X5500_Due_Date__c=date.parse('1/31/2017');
        et.Year_End__c = date.parse('01/01/2018');
        insert et;
        
      
        et.X5500_Due_Date__c= date.parse('1/31/2017');
        
      /*  et.Year_End__c = date.parse('01/31/2018');
         checkRecursive.run6=true;
        update et;
        et.Year_End__c = date.parse('02/28/2018');
         checkRecursive.run6=true;
        update et;
        et.Year_End__c = date.parse('03/31/2018');
         checkRecursive.run6=true;
        update et;
        et.Year_End__c = date.parse('04/30/2018');
         checkRecursive.run6=true;
        update et;
        et.Year_End__c = date.parse('05/31/2018');
         checkRecursive.run6=true;
        update et;
        et.Year_End__c = date.parse('06/30/2018');
         checkRecursive.run6=true;
        update et;
        et.Year_End__c = date.parse('07/31/2018');
         checkRecursive.run6=true;
        update et;
        et.Year_End__c = date.parse('08/31/2018');
         checkRecursive.run6=true;
        update et;
        et.Year_End__c = date.parse('9/30/2018');
         checkRecursive.run6=true;
        Update et;
        et.Year_End__c = date.parse('10/31/2018');
           checkRecursive.run6=true;
        Update et;
        et.Year_End__c = date.parse('11/30/2018');
           checkRecursive.run6=true;
        Update et;
        et.Year_End__c = date.parse('12/31/2018');
           checkRecursive.run6=true;
        update et;*/
        
         /*et.Year_End__c = date.parse('1/31/2017');
update et;
et.Year_End__c = date.parse('2/28/2017');
update et;

et.Year_End__c = date.parse('3/31/2017');
update et;

et.Year_End__c = date.parse('4/30/2017');
update et;

et.Year_End__c = date.parse('5/31/2017');
update et;

et.Year_End__c = date.parse('6/30/2017');
update et;

et.Year_End__c = date.parse('7/31/2017');
update et;

et.Year_End__c = date.parse('8/31/2017');
update et;

et.Year_End__c = date.parse('9/30/2017');
update et;

et.Year_End__c = date.parse('10/31/2017');
update et;

et.Year_End__c = date.parse('11/30/2017');
update et;

et.Year_End__c = date.parse('12/31/2017');
update et;*/ 
       checkRecursive.runOncetrgUpdateAccOppSourceType();
        Integer nextYear = System.today().addYears(1).year();
        et.Year_End__c = Date.newInstance(nextYear, 01, 31);
           checkRecursive.run6=true;
        update et;
        if(Date.isLeapYear(nextYear)) {
            et.Year_End__c = Date.newInstance(nextYear, 02, 29);
        }
        else {
            et.Year_End__c = Date.newInstance(nextYear, 02, 28);
        }
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 03, 31);
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 04, 30);
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 05, 31);
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 06, 30);
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 07, 31);
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 08, 31);
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 09, 30);
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 10, 31);
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 11, 30);
           checkRecursive.run6=true;
        update et;
        
        et.Year_End__c = Date.newInstance(nextYear, 12, 31);
           checkRecursive.run6=true;
        update et;
          test.stopTest();

	}
	
}