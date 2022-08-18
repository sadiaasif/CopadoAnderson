@isTest(SeeAllData=true)

public class boxforcommunitiesDesignTest {
     static testmethod void boxforcommunitiesDesignTestClass(){
         Test.startTest();
          Account acc=new account();
        acc.Name='test name';
 		acc.First_Name__c='Bob Test acc';
        acc.Last_Name__c='Apples';
        acc.Important_Notes__c='test important notes';
        insert acc;
  
         
         ApexPages.currentPage().getParameters().put('Id',acc.id);
         boxforcommunitiesDesign.doinit();
          boxforcommunitiesDesign.createAttachmentinBox();
            boxforcommunitiesDesign.getthecreatedfolder();
         test.stopTest();
      
     }
     static testmethod void boxforcommunitiesDesignTestClass2(){
         Test.startTest();
          Account acc=new account();
        acc.Name='test name';
 		acc.First_Name__c='Bob Test acc';
        acc.Last_Name__c='Apples';
        acc.Important_Notes__c='test important notes';
        insert acc;
    box__FRUP__c bfL=new box__FRUP__c();
         bfL.box__Folder_ID__c='122457680707';
         bfL.box__Record_ID__c=acc.id;
         insert bfL;
         
         ApexPages.currentPage().getParameters().put('Id',acc.id);
         boxforcommunitiesDesign.doinit();
         test.stopTest();
      
     }

}