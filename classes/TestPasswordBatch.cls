@isTest(SeeAllData=false)
Public Class TestPasswordBatch
{
static testMethod void testMethod1() 
    {        
        Test.startTest();
            PasswordBatch obj = new PasswordBatch();
            DataBase.executeBatch(obj);
        Test.stopTest();
    }
}