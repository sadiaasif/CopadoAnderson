@isTest(seealldata=true)
public class SyncPlantinumandSfctrlwithAssertTest {

      @isTest
    static  void testwithAFS() {        
String conserviceItem='';
 Id accountID=[Select accountID from opportunity where Service_Item_List__c Like '%A06459%' Limit 1]?.accountID;
        test.startTest();
         SyncPlantinumandSfctrl syncPlatinumctrlinstance= new SyncPlantinumandSfctrl();
           SyncPlantinumandSfctrl.DigitalproductsListWrapper dpw=new SyncPlantinumandSfctrl.DigitalproductsListWrapper();
     dpw=SyncPlantinumandSfctrl.checkforDigitalservice(accountID);
        
        
        
        List <contact> PrimaryCon=[Select id,Service_Item_List__c from contact where AccountId = :accountId and Account_Roles__c = 'Primary Contact' ORDER BY CreatedDate ASC limit 1];
        if(PrimaryCon.size()>0){
            conserviceItem=PrimaryCon[0].Service_Item_List__c;
        }
       System.assert(conserviceItem.contains('A06459,')) ;
        test.stopTest();
}
          @isTest
    static  void testwithTAxToolBox() {        
String conserviceItem='';
 Id accountID=[Select accountID from opportunity where Service_Item_List__c Like '%A09275%' Limit 1]?.accountID;
   
        test.startTest();
         SyncPlantinumandSfctrl syncPlatinumctrlinstance= new SyncPlantinumandSfctrl();
           SyncPlantinumandSfctrl.DigitalproductsListWrapper dpw=new SyncPlantinumandSfctrl.DigitalproductsListWrapper();
     dpw=SyncPlantinumandSfctrl.checkforDigitalservice(accountID);
       
        SyncPlantinumandSfctrl.updatedigitalproductsoncon(dpw.Conid,dpw.hasDigitalproducts);
        
        
        List <contact> PrimaryConupdated=[Select id,Service_Item_List__c from contact where AccountId = :accountId and Account_Roles__c = 'Primary Contact' ORDER BY CreatedDate ASC limit 1];
        if(PrimaryConupdated.size()>0){
            conserviceItem=PrimaryConupdated[0].Service_Item_List__c;
        }
       System.assert(conserviceItem.contains('A09275,')) ;
        test.stopTest();
}
     @isTest
    static  void testwithATW() {        
String conserviceItem='';
 Id accountID=[Select accountID from opportunity where Service_Item_List__c Like '%A12363%' Limit 1]?.accountID;
        test.startTest();
         SyncPlantinumandSfctrl syncPlatinumctrlinstance= new SyncPlantinumandSfctrl();
           SyncPlantinumandSfctrl.DigitalproductsListWrapper dpw=new SyncPlantinumandSfctrl.DigitalproductsListWrapper();
     dpw=SyncPlantinumandSfctrl.checkforDigitalservice(accountID);
        
   SyncPlantinumandSfctrl.updatedigitalproductsoncon(dpw.Conid,dpw.hasDigitalproducts);        
        
        List <contact> PrimaryCon=[Select id,Service_Item_List__c from contact where AccountId = :accountId and Account_Roles__c = 'Primary Contact' ORDER BY CreatedDate ASC limit 1];
        if(PrimaryCon.size()>0){
            conserviceItem=PrimaryCon[0].Service_Item_List__c;
        }
     System.assert(conserviceItem.contains('A12363,')) ;
        test.stopTest();
}
     @isTest
    static  void testwithInfinity360() {        
String conserviceItem='';
 Id accountID=[Select accountID from opportunity where Infinity_Memebership__c ='360'  Limit 1]?.accountID;
        List<opportunity> oppwithBasic=[Select accountID from opportunity where Infinity_Memebership__c ='Basic' and accountId=:accountID ];
        test.startTest();
         SyncPlantinumandSfctrl syncPlatinumctrlinstance= new SyncPlantinumandSfctrl();
           SyncPlantinumandSfctrl.DigitalproductsListWrapper dpw=new SyncPlantinumandSfctrl.DigitalproductsListWrapper();
     dpw=SyncPlantinumandSfctrl.checkforDigitalservice(accountID);
        
           SyncPlantinumandSfctrl.updatedigitalproductsoncon(dpw.Conid,dpw.hasDigitalproducts);
        
        List <contact> PrimaryCon=[Select id,Service_Item_List__c from contact where AccountId = :accountId and Account_Roles__c = 'Primary Contact' ORDER BY CreatedDate ASC limit 1];
        if(PrimaryCon.size()>0){
            conserviceItem=PrimaryCon[0].Service_Item_List__c;
        }
        If(oppwithBasic.size()>0){
             System.assert(conserviceItem.contains('360')) ;
            System.assert(!conserviceItem.contains('Free'));
        }

        test.stopTest();
}
      @isTest
    static  void testwithAllService() {        
String conserviceItem='';
        
 Id accountID=[Select accountID from opportunity where Infinity_Memebership__c ='360'  Limit 1]?.accountID;
        List<opportunity> oppwithATW=[Select accountID from opportunity where  Service_Item_List__c Like '%A12363,%' and accountID=:accountID Limit 1];
         List<opportunity> oppwithAFS=[Select accountID from opportunity where  Service_Item_List__c Like '%A06459,%' and accountID=:accountID Limit 1];
          List<opportunity> oppwithTTB=[Select accountID from opportunity where  Service_Item_List__c Like '%A09275,%' and accountID=:accountID Limit 1];
        test.startTest();
         SyncPlantinumandSfctrl syncPlatinumctrlinstance= new SyncPlantinumandSfctrl();
           SyncPlantinumandSfctrl.DigitalproductsListWrapper dpw=new SyncPlantinumandSfctrl.DigitalproductsListWrapper();
     dpw=SyncPlantinumandSfctrl.checkforDigitalservice(accountID);
           SyncPlantinumandSfctrl.updatedigitalproductsoncon(dpw.Conid,dpw.hasDigitalproducts);
        
        
        List <contact> PrimaryCon=[Select id,Service_Item_List__c from contact where AccountId = :accountId and Account_Roles__c = 'Primary Contact' ORDER BY CreatedDate ASC limit 1];
        if(PrimaryCon.size()>0){
            conserviceItem=PrimaryCon[0].Service_Item_List__c;
        }
        If(oppwithATW.size()>0 && oppwithAFS.size()>0 && oppwithTTB.size()>0 ){
           System.assertEquals('A06459,A09275,A12363,360', conserviceItem, 'Please check!');
        }

        test.stopTest();
}
}