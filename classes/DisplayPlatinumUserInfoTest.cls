@isTest
public class DisplayPlatinumUserInfoTest {

    
    @isTest(seealldata=true)
    public static void runTest(){

        Contact c = [SELECT Id, Email FROM Contact WHERE LastName = 'apples' AND Email = 'chrisjj2014@mail.com'];

        DisplayPlatinumUserInfo.getPlatinumUser(c.id);
    }

}