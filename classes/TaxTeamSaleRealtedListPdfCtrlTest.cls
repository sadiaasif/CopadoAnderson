@isTest
public class TaxTeamSaleRealtedListPdfCtrlTest {
    static testMethod void SaleRealtedListTest() {
        Account acc=new Account ();
        acc.Name='Bobby Apples';
        acc.First_Name__c='Bobby';
        acc.Last_Name__c='Apples';
        insert acc;
        opportunity opp=new opportunity();
        opp.Name='Test Sale';
        opp.RecordTypeId='012U0000000g5X1IAI';
        opp.StageName='Closed Won';
        opp.CloseDate=system.today();
        opp.AccountId=acc.id;
        insert opp;
         ApexPages.StandardController stdSR = new ApexPages.StandardController(acc);
       
      System.currentPageReference().getParameters().put('id',acc.id); 
        TaxTeamSaleRealtedListPdfCtrl objoppList = new TaxTeamSaleRealtedListPdfCtrl(stdSR);
    }    

}