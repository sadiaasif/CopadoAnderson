@isTest(seeAllData=false)
public with sharing class ClientEntityTaxReturnsControllerTest {
    @isTest static void testTaxReturnController(){
       Account acc = new Account();
       acc.Name = 'Test Client';
       insert acc;

       Tax_Return__c taxReturn = new Tax_Return__c();
       taxReturn.Tax_Year__c = '2020';
       taxReturn.Client__c = acc.Id;
       insert taxReturn;
       
       Test.startTest();
       ClientEntityTaxReturnsController.getTaxReturns(acc.Id);
       Test.stopTest();
     
    }
}