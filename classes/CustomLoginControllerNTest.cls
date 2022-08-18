@IsTest(SeeAllData=true) 
global with sharing class CustomLoginControllerNTest {
    @IsTest 
    global static void testSiteLoginController () {
        Test.StartTest();
        List<User> Usr = [SELECT AccountId FROM User WHERE AccountId !=null];
        CustomLoginControllerN.login(Usr.get(0).AccountId); 
        Test.stopTest();      
    }
}