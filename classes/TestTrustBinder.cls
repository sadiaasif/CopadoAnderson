@isTest

public class TestTrustBinder {
    
    static testMethod void testmethod1(){
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
               
        Trust__c tr= new Trust__c();
    List<Trust__c> Litr= new list<Trust__c>();
             Id devoppLivingTrustobjRecordTypeId = Schema.SObjectType.Trust__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
             tr.RecordTypeId=devoppLivingTrustobjRecordTypeId;
        tr.Name='Test Living Trust';
     tr.First_Trustee_Type__c='Individual';
    tr.First_Trustee_Name__c='TestfirstName';
        tr.Primary_Client__c=acc.id;
      insert tr;
      system.debug('>>>Size of tr1>>'+tr) ;
    
    Trust__c tr1= new Trust__c();
     Id devoppLivingTrustobjRecordTypeId1 = Schema.SObjectType.Trust__c.getRecordTypeInfosByName().get('Living Trust').getRecordTypeId();
             tr1.RecordTypeId=devoppLivingTrustobjRecordTypeId1;
        tr1.Name='Test Living Trust2';
     tr1.First_Trustee_Type__c='Individual';
    tr1.First_Trustee_Name__c='TestfirstName2';
        tr1.Primary_Client__c=acc.id;
  insert tr1;
    system.debug('>>>Size of tr1>>'+tr1) ;
    
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
    List<id> Updatedenids=new list<id>();
    
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_1__c= '';
    en2.Trust_Member_1__c=tr1.id;
    en2.Signor_Update__c=false;
    en2.Structure__c='Manager-managed';
     insert en2;
    
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State_1__c= '';
    en.Organization_State__c='Georgia';
     en.Structure__c='Manager-managed';
        en.Trust_Member_2__c=tr.id;
    en.Signor_Update__c=false;
    en.Managing_Entity__c=en2.id;
      insert  en;
     
     enList =[select id,Name,Trust_Member_1__c ,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c,Signor_Update__c ,Trust_Member_1__r.First_Trustee_Name__c,Trust_Member_2__r.First_Trustee_Name__c,Trust_Member_3__r.First_Trustee_Name__c,Trust_Member_4__r.First_Trustee_Name__c,Trust_Member_2__c,Trust_Member_3__c,Trust_Member_4__c,
                          Signor_Title_1__c,Signor_Title_2__c,Signor_Title_3__c,Signor_Title_4__c from Entities__c];
     
          Map<Id, Entities__c> mapFromList = new Map<Id, Entities__c>(enList);    
     list<Entities__c> Uplist=new  list<Entities__c>();  
    	
    
For ( Entities__c Testet:[select id,Name,Trust_Member_1__c ,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c,Signor_Update__c ,Trust_Member_1__r.First_Trustee_Name__c,Trust_Member_2__r.First_Trustee_Name__c,Trust_Member_3__r.First_Trustee_Name__c,Trust_Member_4__r.First_Trustee_Name__c,Trust_Member_2__c,Trust_Member_3__c,Trust_Member_4__c,
                          Signor_Title_1__c,Signor_Title_2__c,Signor_Title_3__c,Signor_Title_4__c from Entities__c where ID IN : enList ]) 
                   
                            {
                                
                       Testet.Signor_Update__c   =true; 
                          Testet.Trust_Member_1__c=tr.id;
                           Testet.Trust_Member_2__c=tr.id;
                            Testet.Trust_Member_3__c=tr.id;
                             Testet.Trust_Member_4__c=tr.id;                                   
                             Uplist.add(Testet);
                                system.debug('Uplist'+ Uplist);
                          }


     update Uplist;       
    					  
       try {
           system.debug('>>>enList>>'+enList);
           system.debug('>>>mapFromList>>'+mapFromList);
           system.debug('>>>Uplist>>'+Uplist);
    TrustBinder.updateTrustMember(Uplist,mapFromList );
    
    }  catch (Exception e) { System.debug('Exception occured during TrustBinder: ' + e); } 
                                                    }
}
}