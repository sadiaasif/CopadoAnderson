/**
* @author            :Chetu India Developer Team
* @Created date      :6/05/2018
* @Last Modified By  :Chetu India Team
* @Last Modified Date:05/19/2018 
* @Description       :This Class is used to test the Code Cover of UpdateInfomationOnTaxBookkeeping trigger.
**/
@IsTest
Public class UpdateInformationOnTaxAndBookkeepingTest {
    
               //test method to test the code coverage..
    public static testMethod  void testocc(){
             
        Account testAccount = new Account();//Insert Account
        testAccount.Name='Test Account' ;
        testAccount.First_Name__c='test1'; 
        testAccount.Last_Name__c ='testAccount';
        insert testAccount;  
        //create the harvestproject object..
        H2S__HarvestProject__c  HP = new H2S__HarvestProject__c(); // insert Project      
        //set all the required field..
        HP.name = 'Test project';
        HP.H2S__Account__c = testAccount.id;
        HP.H2S__Budget__c = 'Total project hours';
        HP.H2S__SyncStatus__c ='Harvest Project Not Found';	
        HP.H2S__InvoiceMethod__c ='This project is billable';
        HP.H2S__TotalProjectHours__c = 4000;
        //create the tax object..
        Tax__c tax = new Tax__c();
        //set all the required field..
        tax.Name =  'test';
        tax.Client_Name__c = testAccount.id;
        tax.Budget__c = 'Total project fees';
        //insert the tax object..
        insert tax;
        Set_of_Books__c sob=new Set_of_Books__c();
        sob.name='2020 set';
        sob.Client__c=testAccount.id;
        insert sob;
        //create the bookkeeping object..
        Bookkeeping__c bk = new Bookkeeping__c();
        //set all the required field..
        bk.Name = 'test';
        bk.Client_Name__c = testAccount.id;
        bk.Set_of_Books__c=sob.id;
        //insert bookkeeping..
        insert bk;
         //insert harvestproject..
        insert HP;
      
      
    }

}