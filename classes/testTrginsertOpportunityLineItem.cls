@isTest (seeAllData = false)
private class testTrginsertOpportunityLineItem  {

    static testMethod void myUnitTest() {
    
         account acc = new account();
            acc.Name = 'test'; 
            acc.E_Mail__c = 'test@test.com';  
            acc.RecordTypeId = '012U0000000D8qm';
            insert acc;
         
         //PricebookEntry pbe = [select id, Product2Id  from PricebookEntry where Product2Id = :System.Label.ProductId limit 1];
            
            List<Account> testAcct = [SELECT Id FROM Account LIMIT 1];
            
         Opportunity opp = new Opportunity();
             opp.Name = 'test';
             opp.AccountId = testAcct[0].Id;
             opp.CloseDate = System.today();
             opp.StageName = 'Prospecting';
             opp.Amount = 1079.90;             
             opp.Entity_Type__c = 'S-Corporation';
             opp.Entrity_Name__c = 'Test';
             opp.ChargentSFA__Billing_Address__c = 'Test';
             opp.ChargentSFA__Billing_City__c = 'Test';
             opp.ChargentSFA__Billing_Company__c = 'Test';
             opp.ChargentSFA__Billing_Country__c = 'Test';
             opp.ChargentSFA__Billing_State__c = 'test';
             opp.ChargentSFA__Billing_Fax__c = '123456';
             opp.ChargentSFA__Billing_First__c = 'test';
             opp.ChargentSFA__Billing_Last__c = 'test';
             opp.ChargentSFA__Billing_Phone__c = '1234567890';
             opp.ChargentSFA__Billing_Postcode__c = '123456'; 
             opp.ChargentSFA__Payment_Method__c = 'Credit Card';
             opp.ChargentSFA__Card_Type__c = 'Visa';
             opp.ChargentSFA__Billing_Email__c = 'test@test.com';
             opp.ChargentSFA__Payment_Count__c = 25;
             opp.ChargentSFA__Payment_Start_Date__c = system.today();
             opp.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
             opp.ChargentSFA__Payment_Stop__c = 'Count';
             opp.ChargentSFA__Payment_Status__c = 'Partial';
             opp.ChargentSFA__Payment_Frequency__c = 'Daily';
             opp.ChargentSFA__Payment_Status__c = 'Recurring';
             insert opp;
        
        
    }
}