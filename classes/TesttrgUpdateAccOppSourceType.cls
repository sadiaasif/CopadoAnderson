@isTest(SeeAllData=True)
private class TesttrgUpdateAccOppSourceType {
    private static Id leadId;

    static testMethod void TesttrgUpdateAccOppSourceType() {
        Campaign c= new Campaign ();
        c.Name= 'test Campaign';
        c.IsActive=true;
           Insert c;
         
        Lead ld = new Lead();
        ld.LastName = 'Test';
      ld.Status='New Lead';
        ld.Main_Lead_Source__c='Anderson Event';
        ld.Original_Campaign_Source__c=c.id;
        insert ld;
        Account acc =new Account();
        acc.Name='test Account';
        insert acc;
         String strRecordTypeId = [Select Id From RecordType Where SobjectType = 'Opportunity' and Name = 'Bookkeeping'].Id;
       Opportunity opp = new Opportunity();
        opp.AccountId = acc.id;
        opp.RecordTypeId = strRecordTypeId;
        opp.StageName ='Closed Won';
        opp.Name ='Bookkeeping';
        opp.CloseDate = Date.Today().addDays(1);
        insert opp;
       leadId=ld.id;
     test.startTest();
        checkRecursive.run3=true;
      	database.leadConvert lc = new database.leadConvert();
         lc.setLeadId(leadId);
 			leadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
      		lc.setDoNotCreateOpportunity(false);
      		lc.setConvertedStatus(convertStatus.MasterLabel);
        	lc.setOpportunityName('test Enity');
 			Database.LeadConvertResult lcr = Database.convertLead(lc);
        Lead Convertedlead=[Select id, ConvertedAccountId , LastName from lead where IsConverted=true and LastName='Test' limit 1 ];
       		Convertedlead.LastName='Test 2';
        update Convertedlead;
               System.assert( lcr.isSuccess());
      
        test.stopTest();
    }
     
}