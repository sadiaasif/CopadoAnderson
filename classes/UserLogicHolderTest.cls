/*****************************************************************************************************************************
@ Class Name:    UserLogicHolder
@ Version:       1.0
@ Author:        Sadia Asif
@ Description:   Test class for UserLogicHolder    
*****************************************************************************************************************************/
@isTest
public class UserLogicHolderTest {
    
    public static user USER =[select Id,name from user where id=:userinfo.getuserid() limit 1];
    public static Set<Id> userIds = new Set<Id>();
     @testSetup
    static void userDataSetUpTest(){
       
       Profile p = [select id from profile where name='System Administrator'];
       List<User> users= new List<User>();
       User usr= new User();
       usr.Username = 'testwsd@gmail.com';
       usr.LastName= 'User1';
       usr.Alias='Testb';
       usr.Email='testuser@gmail.com';
       usr.Job_Role__c='Internal';
       usr.ProfileId= p.Id;
       usr.TimeZoneSidKey = 'GMT';
       usr.LocaleSidKey ='en_US';
       usr.EmailEncodingKey ='ISO-8859-1';
       usr.LanguageLocaleKey ='en_US';
       usr.isActive = true;
       usr.Update_PlatinumSaleId__c=true;
       users.add(usr);
       userIds.add(usr.id);
       User usr1= new User();
       usr1.Username = 'testyzk@test.com';
       usr1.LastName= 'User1';
       usr1.Alias='Testa';
       usr1.Email='testuser1@gmail.com';
       usr1.Job_Role__c='Bookkeeping';
       usr1.ProfileId= p.id;
       usr1.TimeZoneSidKey = 'GMT';
       usr1.LocaleSidKey ='en_US';
       usr1.EmailEncodingKey ='ISO-8859-1';
       usr1.LanguageLocaleKey ='en_US';
       usr1.isActive = true;
       usr1.Update_PlatinumSaleId__c= false;
       usr1.Chargent_User__c=true;
       
       users.add(usr1);
       insert users;
       userIds.add(usr1.Id);
       
        System.RunAs(USER){
        Opportunity oppor = new Opportunity();
        oppor.RecordTypeId='012U0000000g5s4';
        oppor.Name='Test';
        oppor.StageName='Long Term Stall';
        oppor.CloseDate= date.today();
        insert oppor;
        
        Group grp=new Group();
        grp.Name='Anderson';
        grp.DeveloperName='Bookkeeping1';
        insert grp;
        
        GroupMember gm= new GroupMember();
        gm.UserOrGroupId= usr1.Id;
        gm.GroupId= grp.Id;
        insert gm;
        
        UserPackageLicense userlic= new UserPackageLicense();
        userlic.UserId = usr1.id;
        userlic.PackageLicenseId='050U0000000084LIAQ';
        insert userlic;
            
          }  
           
        
    }
    
    
    @isTest
   private static void userAssignmentTest(){
     
       Test.StartTest();
       UserLogicHolder.userLicenseandGroupAssign(userIds);
       
       Test.StopTest();
        
    }

}