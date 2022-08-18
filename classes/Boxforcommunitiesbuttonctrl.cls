@isTest(SeeAllData=true)
public class Boxforcommunitiesbuttonctrl {
     static testmethod void BoxforcommunitiesbuttonctrlTestClass(){
         Test.startTest();
        
          Account acc=new account();
        acc.Name='test name';
 acc.First_Name__c='Bob';
        acc.Last_Name__c='Apples';
        acc.Important_Notes__c='test important notes';
        insert acc;
         
  
         
         ApexPages.currentPage().getParameters().put('Id',acc.id);
       
         Boxforcommunitiesbutton.doinit(acc.id);
         test.stopTest();
      
     }
     static testmethod void BoxforcommunitiesbuttonctrlTestClass2(){
         Test.startTest();
        
          Account acc=new account();
        acc.Name='test name';
 acc.First_Name__c='Bob';
        acc.Last_Name__c='Apples';
        acc.Important_Notes__c='test important notes';
        insert acc;
          box__FRUP__c bfL=new box__FRUP__c();
         bfL.box__Folder_ID__c='122457680707';
         bfL.box__Record_ID__c=acc.id;
         insert bfL;
  
         
         ApexPages.currentPage().getParameters().put('Id',acc.id);
       
         Boxforcommunitiesbutton.doinit(acc.id);
         test.stopTest();
      
     }
}