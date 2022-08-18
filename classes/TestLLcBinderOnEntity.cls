@isTest
public class TestLLcBinderOnEntity {
    
static testMethod void testmethod1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
        
           Opportunity o = new Opportunity();
        o.AccountId = acc.Id;
        o.Name = 'WY Statutory Trust Annual Renewal';
      o.StageName = 'Qualification';
      
   
    List<Entities__c> enList=new  List<Entities__c>();
        List<Entities__c> enListIds=new  List<Entities__c>();
        List<SaleEntity__c > SaleEntity=new  List<SaleEntity__c >();

    List<id> enids=new list<id>();
    
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.Sale__c=o.id;
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en2.id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
        
        
           
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=false;
    en.Managing_Entity__c=en2.id;
    enList.add(en);
    try{
    insert  enList;}
    catch (Exception e) { System.debug('Exception occured during TrustBinder: ' + e); }

    
    
              /*  SaleEntity__c sa=new SaleEntity__c(); 
                sa.Name=en.Name;    
                sa.Opportunity__c=en.Sale__c;    
               
                sa.Entity__c=en.id;
                SaleEntity.add(sa);
                insert  SaleEntity; */
    
    
    
    for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
       enids.add(eid.Id);
       enListIds.add(eid);
    }
    test.startTest();
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enListIds);
   
    test.stopTest();
    
    
}
    static testMethod void testmethod2()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
      List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
             insert en2;
            // enList.add(en2);
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
    enList.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Entity_Member_1__c=en2.id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Member-managed';
    enList.add(en1);
     insert en1;
   
    
        
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
     Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top corp Inc';
    en3.Entity_Member_1__c=en8.id;
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Member-managed';
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
    en4.Entity_Member_1__c=en2.id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
    en5.Entity_Member_1__c=en8.id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en8.id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
    
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
       enListIds.add(eid);
    }
   
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enListIds);
    test.stopTest();
    
    
}
        static testMethod void testmethodTopmanagermangedLevel1Entiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
     List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
     insert en2;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
    enList.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
   
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Structure__c='Member-managed';
    en6.Organization_State_EM1__c='Georgia';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
             
    
       enids.add(eid.Id);
    // enListIds(eid);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enListIds);
    test.stopTest();
    
    
}
     static testMethod void testmethodTopmanagermangedLevel1Entiesnull2()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
    
        List<Entities__c> enListIds=new  List<Entities__c>();
        
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Member-managed';
    enList.add(en2);
     insert en2;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Member-managed';
    enList.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
   
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Member-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Member-managed';
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Manager-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Manager-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          

       enids.add(eid.Id);
    }
    
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
    
    
}
     static testMethod void testmethodTopmanagermangedLevel1corp()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
       List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top corp';
    en2.RecordTypeId='012U0000000DE8S';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
  
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Member-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
   
    en1.RecordTypeId='012U0000000DE8S';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top corp ';
    en3.RecordTypeId='012U0000000DE8S';
   
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8m';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 corp';
   
    en4.RecordTypeId='012U0000000DE8S';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
   
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 corp';
 
    en5.RecordTypeId='012U0000000DE8S';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
   
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    
    en6.RecordTypeId='012U0000000DE8S';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
   
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 corp';
   
    en7.RecordTypeId='012U0000000DE8S';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
   
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
    
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
    
    
}
             static testMethod void testmethodTopmanagermangedLevel2mangermangedEntiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
    
    
} 
    
             static testMethod void testmethodTopmanagermangedLevel2membermangedEntiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Member-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
    
    
} 
      static testMethod void testmethodTopmanagermangedLevel2membermangedEntiesnull()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Member-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Entity_Member_1__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Member-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Member-managed';
    en3.Entity_Member_1__c=en9.Id;
    
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Managing_Entity__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Manager-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Managing_Entity__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Manager-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Managing_Entity__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Managing_Entity__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
     List <Entities__c> updateEn=[select Organization_State_EM1__c,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_EM1__c, 'Not Updated !!! Please Check !!!'); 
    
    
} 
     
           static testMethod void testmethodTopmanagermangedLevel2corpEntiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8S';
    en9.Organization_State__c='Georgia';
   
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
    
    
} 
    
    // Level 3
          static testMethod void testmethodTopmanagermangedLevel3mangermangedEntiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    en10.Structure__c='Manager-managed';
   
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Managing_Entity__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
     List <Entities__c> updateEn=[select Organization_State_EM1__c,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_EM1__c, 'Not Updated !!! Please Check !!!'); 
    
    
} 
    
             static testMethod void testmethodTopmanagermangedLevel3membermangedEntiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    en10.Structure__c='Member-managed';
    
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Entity_Member_1__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Member-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
    
    
} 
      static testMethod void testmethodTopmanagermangedLevel3membermangedEntiesnull()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
    Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    en10.Structure__c='Member-managed';
    
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Entity_Member_1__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Member-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Entity_Member_1__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Member-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Member-managed';
    en3.Entity_Member_1__c=en9.Id;
    
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Managing_Entity__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Manager-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Managing_Entity__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Manager-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Managing_Entity__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Managing_Entity__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
     List <Entities__c> updateEn=[select Organization_State_EM1__c,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_EM1__c, 'Not Updated !!! Please Check !!!'); 
    
} 
     
           static testMethod void testmethodTopmanagermangedLevel3corpEntiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
    
      Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8S';
    en10.Organization_State__c='Georgia';
   en10.Organization_State_EM1__c='Georgia';
    enList.add(en2);
    enListIds.add(en2);
     insert en10;
    
    Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Middle Entity';
    en9.Managing_Entity__c=en10.Id;
    en9.RecordTypeId='012U0000000DE8m';
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
   
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
     en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
     List <Entities__c> updateEn=[select Organization_State_EM1__c,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_EM1__c, 'Not Updated !!! Please Check !!!'); 
    
} 
    
    //Base
             static testMethod void testmethodTopmanagermangedBasemangermangedEntiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
      Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8m';
    en11.Organization_State__c='Georgia';
    en11.Organization_State_EM1__c='Georgia';
    en11.Structure__c='Manager-managed';
   
     insert en11;
    
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
    en10.Managing_Entity__c=en11.Id;
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    en10.Structure__c='Manager-managed';
   
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Managing_Entity__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
    
    
} 
    
             static testMethod void testmethodTopmanagermangedBasemembermangedEntiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
    
           List<Entities__c> enListIds=new  List<Entities__c>();
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
    
    
     Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8m';
    en11.Organization_State__c='Georgia';
    en11.Organization_State_EM1__c='Georgia';
    en11.Structure__c='Member-managed';
    
     insert en11;
    
    Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
    en10.Entity_Member_1__c=en11.Id;
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    en10.Structure__c='Member-managed';
    
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Managing_Entity__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
     List <Entities__c> updateEn=[select Organization_State_EM1__c,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_EM1__c, 'Not Updated !!! Please Check !!!'); 
    
} 
      static testMethod void testmethodTopmanagermangedBasemembermangedEntiesnull()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
     Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8m';
    en11.Organization_State__c='Georgia';
    en11.Organization_State_EM1__c='Georgia';
    en11.Structure__c='Member-managed';
    
     insert en11;
    
    Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
      en10.Entity_Member_1__c=en11.Id;
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    en10.Structure__c='Member-managed';
    
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Entity_Member_1__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Member-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Entity_Member_1__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Member-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Member-managed';
    en3.Entity_Member_1__c=en9.Id;
    
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Managing_Entity__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Manager-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Managing_Entity__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Manager-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Managing_Entity__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Managing_Entity__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true Limit 1]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
     List <Entities__c> updateEn=[select Organization_State_EM1__c,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_EM1__c, 'Not Updated !!! Please Check !!!'); 
    
} 
     
           static testMethod void testmethodTopmanagermangedBasecorpEntiesnull1()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
    
      Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8S';
    en11.Organization_State__c='Georgia';
   
    enList.add(en11);
     insert en11;
    
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Middle Entity';
    en10.Managing_Entity__c=en11.Id;
    en10.RecordTypeId='012U0000000DE8m';
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    en10.Structure__c='Manager-managed';
   
     insert en10;
    
    Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Middle Entity';
    en9.Managing_Entity__c=en10.Id;
    en9.RecordTypeId='012U0000000DE8m';
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
   
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
     en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Member-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Structure__c='Manager-managed';
    en.Signor_Update__c=true;
    en.Managing_Entity__c=en1.id;
    en.Managing_Entity_2__c=en3.id;
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
     List <Entities__c> updateEn=[select Organization_State_EM1__c,Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_EM1__c, 'Not Updated !!! Please Check !!!'); 
    
    
}  
    
 // Top Structure Member manged

       static testMethod void testmethodTopmembermangedl1Mangerl2Mangernull()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
      Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8m';
    en11.Organization_State__c='Georgia';
    en11.Organization_State_EM1__c='Georgia';
    en11.Structure__c='Manager-managed';
   
     insert en11;
    
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
    en10.Managing_Entity__c=en11.Id;
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    en10.Structure__c='Manager-managed';
   
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
     en3.Organization_State_EM1__c='Georgia';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Manager-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Managing_Entity__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Managing_Entity__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Organization_State_1__c='Georgia';
    en.Structure__c='Member-managed';
    en.Signor_Update__c=true;
    
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
     List <Entities__c> updateEn=[select Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_1__c, 'Not Updated !!! Please Check !!!'); 
    
    
} 
 static testMethod void testmethodTopmembermangedl1Mangerl2Mnagerl3Magernull()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
      Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8m';
    en11.Organization_State__c='Georgia';
    en11.Organization_State_EM1__c='Georgia';
    en11.Structure__c='Manager-managed';
   
     insert en11;
    
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
   
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    en10.Structure__c='Manager-managed';
   
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Managing_Entity__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
 en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Manager-managed';
    enList.add(en5);
     insert en5;
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Managing_Entity__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Managing_Entity__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Organization_State_1__c='Georgia';
    en.Structure__c='Member-managed';
    en.Signor_Update__c=true;
    
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
     List <Entities__c> updateEn=[select Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_1__c, 'Not Updated !!! Please Check !!!'); 
    
} 

 static testMethod void testmethodTopmembermangedl1Mangerl2Mnagerl3corp()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
        Entities__c en2=new Entities__c();
    en2.Primary_Client__c=acc.id;
    en2.Name='Top Entity';
    en2.RecordTypeId='012U0000000DE8m';
    en2.Organization_State__c='Georgia';
    en2.Organization_State_EM1__c='Georgia';
    en2.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en2;
      Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8m';
    en11.Organization_State__c='Georgia';
    en11.Structure__c='Manager-managed';
   
     insert en11;
    
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8S';
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
    insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Managing_Entity__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
    en9.Structure__c='Manager-managed';
    enList.add(en2);
    enListIds.add(en2);
     insert en9;
    
       Entities__c en1=new Entities__c();
    en1.Primary_Client__c=acc.id;
    en1.Name='Middle Entity';
    en1.Managing_Entity__c=en9.Id;
    en1.RecordTypeId='012U0000000DE8m';
    en1.Organization_State__c='Georgia';
    en1.Organization_State_EM1__c='Georgia';
    en1.Structure__c='Manager-managed';
    enList.add(en1);
     insert en1;
   
    
         Entities__c en3=new Entities__c();
    en3.Primary_Client__c=acc.id;
    en3.Name='Top llc ';
    en3.RecordTypeId='012U0000000DE8m';
     en3.Structure__c='Manager-managed';
    en3.Managing_Entity__c=en9.Id;
    en3.Organization_State__c='Georgia';
    en3.Organization_State_EM1__c='Georgia';
     insert en3;
    enList.add(en3);
    
      Entities__c en8=new Entities__c();
    en8.Primary_Client__c=acc.id;
    en8.Name='Top corp2 Inc';
    
    en8.RecordTypeId='012U0000000DE8S';
    en8.Organization_State__c='Georgia';
    en8.Organization_State_EM1__c='Georgia';
     insert en8;
    
       Entities__c en4=new Entities__c();
    en4.Primary_Client__c=acc.id;
    en4.Name='Middle Member1 LLc';
   en4.Entity_Member_1__c=en9.Id;
    en4.RecordTypeId='012U0000000DE8m';
    en4.Organization_State__c='Georgia';
    en4.Organization_State_EM1__c='Georgia';
    en4.Structure__c='Member-managed';
    enList.add(en4);
     insert en4;
      Entities__c en5=new Entities__c();
    en5.Primary_Client__c=acc.id;
    en5.Name='Middle Member2 LLc';
    en5.Entity_Member_1__c=en9.Id;
    en5.RecordTypeId='012U0000000DE8m';
    en5.Organization_State__c='Georgia';
    en5.Organization_State_EM1__c='Georgia';
    en5.Structure__c='Manager-managed';
    enList.add(en5);
     insert en5;
    
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Managing_Entity__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Managing_Entity__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Organization_State_4__c='Georgia';
    en.Structure__c='Member-managed';
    en.Signor_Update__c=true;
    
    en.Entity_Member_1__c=en4.id;
    en.Entity_Member_2__c=en5.id;
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
         
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
          List <Entities__c> updateEn=[select Organization_State_1__c,Organization_State_2__c,Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    
    System.assertEquals('Georgia',updateEn[0].Organization_State_4__c, 'Not Updated !!! Please Check !!!'); 
    
}    
    static testMethod void testmethodTopmembermangedl1Mangerl2Mnagerl3Magerbasemangernull()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
    
          List<Entities__c> enListIds=new  List<Entities__c>(); 
        
      Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8m';
    en11.Organization_State__c='Georgia';
    en11.Organization_State_EM1__c='Georgia';
        en11.Organization_State_3__c='Georgia';
    en11.Organization_State_4__c='Georgia';
    en11.Structure__c='Manager-managed';
   
     insert en11;
    
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
   en10.Managing_Entity__c=en11.Id;
    en10.Organization_State__c='Georgia';
    en10.Organization_State_EM1__c='Georgia';
        en10.Organization_State_3__c='Georgia';
    en10.Organization_State_4__c='Georgia';
    en10.Structure__c='Manager-managed';
   
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Managing_Entity__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Organization_State_EM1__c='Georgia';
        en9.Organization_State_3__c='Georgia';
    en9.Organization_State_4__c='Georgia';
    en9.Structure__c='Manager-managed';
  
     insert en9;
    
          
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Managing_Entity__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Organization_State_EM1__c='Georgia';
        en6.Organization_State_3__c='Georgia';
    en6.Organization_State_4__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Managing_Entity__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Organization_State_EM1__c='Georgia';
        en7.Organization_State_3__c='Georgia';
    en7.Organization_State_4__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_EM1__c='Georgia';
    en.Organization_State_3__c='Georgia';
    en.Organization_State_4__c='Georgia';
    en.Structure__c='Member-managed';
    en.Signor_Update__c=true;
    
   
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
  
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
      List <Entities__c> updateEn=[select Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    System.assertEquals('Georgia',updateEn[0].Organization_State_3__c, 'Not Updated !!! Please Check !!!'); 
    System.assertEquals('Georgia',updateEn[0].Organization_State_4__c, 'Not Updated !!! Please Check !!!'); 
    
} 

 static testMethod void testmethodTopmembermangedl1Mangerl2Mnagerl3mangerbasecorp()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
          List<Entities__c> enListIds=new  List<Entities__c>();
     
      
      Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8S';
    en11.Organization_State__c='Georgia';
    
   
     insert en11;
    
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
    en10.Managing_Entity__c=en11.Id;
    en10.Organization_State__c='Georgia';
    en10.Structure__c='Manager-managed';
    insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Managing_Entity__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Structure__c='Manager-managed';
  
     insert en9;
    
  
    
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Managing_Entity__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Managing_Entity__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Organization_State_3__c='Georgia';
    en.Organization_State_4__c='Georgia';
    en.Structure__c='Member-managed';
    en.Signor_Update__c=true;
    
  
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
    enList.add(en);
   
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
      List <Entities__c> updateEn=[select Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    System.assertEquals('Georgia',updateEn[0].Organization_State_3__c, 'Not Updated !!! Please Check !!!'); 
    System.assertEquals('Georgia',updateEn[0].Organization_State_4__c, 'Not Updated !!! Please Check !!!'); 
    
}   
     static testMethod void testmethodTopmembermangedl1Mangerl2Mnagerl3Magerbasemembernull()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
   
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
         List<Entities__c> enListIds=new  List<Entities__c>();
      Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8m';
    en11.Organization_State__c='Georgia';
    en11.Structure__c='Member-managed';
   
     insert en11;
    
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
   en10.Managing_Entity__c=en11.Id;
    en10.Organization_State__c='Georgia';
    en10.Structure__c='Manager-managed';
   
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Managing_Entity__c=en10.Id;
    en9.Organization_State__c='Georgia';
    en9.Structure__c='Manager-managed';
  
     insert en9;
    
          
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Managing_Entity__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Structure__c='Manager-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Managing_Entity__c=en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
    en7.Structure__c='Manager-managed';
    
    enList.add(en7);
    insert en7;
    
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
    en.Structure__c='Member-managed';
    en.Signor_Update__c=true;
    
   
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
  
    
   
    test.startTest();
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true]){
          
    
       enids.add(eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
    test.stopTest();
      List <Entities__c> updateEn=[select Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
     
  
    
    
} 
  static testMethod void testmethodTopmembermangedl1memberl2memberl3memberbasemembernull()
{
     Account acc=new account();
        acc.Name='test name';
        acc.Important_Notes__c='test important notes';
        insert acc;
    
    List<Entities__c> enList=new  List<Entities__c>();
    List<id> enids=new list<id>();
         List<Entities__c> enListIds=new  List<Entities__c>();
      Entities__c en11=new Entities__c();
    en11.Primary_Client__c=acc.id;
    en11.Name='Top Entity';
    en11.RecordTypeId='012U0000000DE8m';
    en11.Organization_State__c='Georgia';
        en11.Organization_State_3__c='Georgia';
    en11.Organization_State_4__c='Georgia';
    en11.Structure__c='Member-managed';
   
     insert en11;
    
     Entities__c en10=new Entities__c();
    en10.Primary_Client__c=acc.id;
    en10.Name='Top Entity';
    en10.RecordTypeId='012U0000000DE8m';
   en10.Entity_Member_1__c=en11.Id;
    en10.Organization_State__c='Georgia';
        en10.Organization_State_3__c='Georgia';
    en10.Organization_State_4__c='Georgia';
    en10.Structure__c='Member-managed';
   
     insert en10;
    
      Entities__c en9=new Entities__c();
    en9.Primary_Client__c=acc.id;
    en9.Name='Top Entity';
    en9.RecordTypeId='012U0000000DE8m';
    en9.Entity_Member_1__c=en10.Id;
    en9.Organization_State__c='Georgia';
        en9.Organization_State_3__c='Georgia';
    en9.Organization_State_4__c='Georgia';
    en9.Structure__c='Member-managed';
  
     insert en9;
    
          
       Entities__c en6=new Entities__c();
    en6.Primary_Client__c=acc.id;
    en6.Name='Middle Member3 LLc';
    en6.Entity_Member_1__c=en9.Id;
    en6.RecordTypeId='012U0000000DE8m';
    en6.Organization_State__c='Georgia';
    en6.Structure__c='Member-managed';
    enList.add(en6);
     insert en6;
      Entities__c en7=new Entities__c();
    en7.Primary_Client__c=acc.id;
    en7.Name='Middle Member4 LLc';
   en7.Entity_Member_1__c =en9.Id;
    en7.RecordTypeId='012U0000000DE8m';
    en7.Organization_State__c='Georgia';
        en7.Organization_State_3__c='Georgia';
    en7.Organization_State_4__c='Georgia';
    en7.Structure__c='Member-managed';
    
    enList.add(en7);
    insert en7;
    Entities__c en=new Entities__c();
    en.Primary_Client__c=acc.id;
    en.Name='Base Entity';
    en.RecordTypeId='012U0000000DE8m';
    en.Organization_State__c='Georgia';
        en.Organization_State_3__c='Georgia';
    en.Organization_State_4__c='Georgia';
    en.Structure__c='Member-managed';
    en.Signor_Update__c=true;
    
   
     en.Entity_Member_3__c=en6.id;
    en.Entity_Member_4__c=en7.id;
    insert en;
  
  Test.startTest();  
   Id testid;
  
     for(Entities__c eid:[select id from Entities__c where Signor_Update__c=true limit 1]){
         testid= eid.Id;
    
       enids.add(eid.Id);
         System.debug('id---'+eid.Id);
    }
  
   // LLcBinderOnEntity llc=new LLcBinderOnEntity();
    LLcBinderOnEntity.updateEntityLLcBinder(enList);
  
    
    test.stopTest();
       List <Entities__c> updateEn=[select Organization_State_3__c,Organization_State_4__c from Entities__c where id=:en.Id limit 1];
    System.assertEquals('Georgia',updateEn[0].Organization_State_3__c, 'Not Updated !!! Please Check !!!'); 
    System.assertEquals('Georgia',updateEn[0].Organization_State_4__c, 'Not Updated !!! Please Check !!!'); 

}    

}