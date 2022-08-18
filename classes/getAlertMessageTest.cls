@isTest
public class getAlertMessageTest {
    
        
    @isTest(seealldata=true)
    public static void runTest(){

        Account a = [SELECT Id FROM account LIMIT 1];

        getAlertMessage.findAlertMessage(a.id);
    }

}