@isTest
private class testtrgInsertAddressinEntity{
 
    @testSetup static void createTestAccount() {
        
        Account acc = new account();
        Acc.name = 'Bobby Apples';
        acc.BillingStreet = '500 Commodore Way';
        acc.BillingCity = 'Las Vegas';
        acc.Billingstate = 'NV';
        acc.BillingPostalCode = '89135';
        insert acc;
        
    }
    
    @isTest public static void createEntityAndTestIt() {
        
        Entities__c ent = new Entities__c();
        ent.Name = 'Address Test Entity';
        ent.Primary_Client__c = [SELECT Id from Account LIMIT 1].id;
        ent.Origin__c = 'Anderson';
        ent.Organization_State__c = 'Alaska';
        ent.Business_Address__c = 'Boss Address';
        ent.Mailing_Address_Picklist__c = 'Boss Address';
        insert ent;
   
        Entities__c entCheck = [SELECT Id, Business_Location__c, Business_City__c,Mailing_Address__c FROM Entities__c];
        
        System.assertEquals('3225 McLeod Dr, Suite 100 Las Vegas, NV 89121', entCheck.Business_Location__c);
        System.assertEquals('Las Vegas',entCheck.Business_City__c);
        System.assertEquals('3225 McLeod Dr, Suite 100 Las Vegas, NV 89121',entCheck.Mailing_Address__c);
        
        ent.Business_Address__c = 'Wyoming';
        ent.Mailing_Address_Picklist__c = 'Wyoming';
        update ent;
        
        Entities__c entCheck2 = [SELECT Id, Business_Location__c, Business_City__c,Mailing_Address__c FROM Entities__c];
        
        System.assertEquals('1718 Capitol Ave. Cheyenne, WY 82001', entCheck2.Business_Location__c);
        System.assertEquals('Cheyenne',entCheck2.Business_City__c);
        System.assertEquals('1718 Capitol Ave. Cheyenne, WY 82001', entCheck2.Mailing_Address__c);
        
        ent.Business_Address__c = 'Client Address';
        ent.Mailing_Address_Picklist__c  = 'Client Address';
        update ent;
        
        Entities__c entCheck3 = [SELECT Id, Business_Location__c, Business_City__c,Mailing_Address__c FROM Entities__c];
        
        System.assertEquals('500 Commodore Way Las Vegas NV 89135', entCheck3.Business_Location__c);
        System.assertEquals('Las Vegas',entCheck3.Business_City__c);
        System.assertEquals('500 Commodore Way Las Vegas NV 89135', entCheck3.Mailing_Address__c);
        
        ent.Mailing_Address_Picklist__c = 'RA Address';
        update ent;
        
        Entities__c entCheck4 = [SELECT Id,Mailing_Address__c,Registered_Agent_Address__c FROM Entities__c];
        System.assertEquals(entcheck4.Registered_Agent_Address__c, entCheck4.Mailing_Address__c);
        
     
    }

}