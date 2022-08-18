@isTest
private class AccountUpdate_TC {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        
         Pricebook2[] PBs = [Select p.Name, p.Id From Pricebook2 p where Name = 'Standard Price Book'];
         
        Account a = new Account();
        a.Name = 'Test Account';
        a.BillingCity = 'Test City';
        a.BillingCountry = 'Test Country';
        a.LastName = 'test';
        a.FirstName = 'hdskjfh ';
        a.RecordTypeId = '012U0000000D9KR';
        //insert a;
        
        
        Opportunity o = new Opportunity();
        o.Name = 'Test Oppy';
        o.CloseDate = System.today();
        o.StageName = 'Closed Won';
        //o.Pricebook2Id = PBs[0].Id;
        o.AccountId = a.id;
        insert o;
        
        ChargentSFA__Transaction__c CT = new ChargentSFA__Transaction__c();
        //CT.Name = 'Test Transaction';
        CT.ChargentSFA__Response_Status__c = 'Approved';
        CT.ChargentSFA__Opportunity__c = o.id;
        
        insert CT;
        
        PriceBookEntry PBE = [select id from PriceBookEntry where PriceBookEntry.Product2.Name = 'Platinum Membership' limit 1];
        
        OpportunityLineItem OLI = new OpportunityLineItem();
    		OLI.Discount = 10;
    		OLI.OpportunityId = o.id;
    		OLI.PricebookEntryId = PBE.id;
    		OLI.PricebookEntry = PBE;
    		OLI.Quantity = 10;
    		OLI.ServiceDate = System.today();
    		//OLI.ListPrice = a.FirstClass.PriceBookEntry.UnitPrice;
    		OLI.UnitPrice = 10;
    		
    		//insert OLI;
    }
}