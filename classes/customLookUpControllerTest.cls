@isTest
public class customLookUpControllerTest {
 @isTest
    static void fetchLookUpValuesTest(){
         
        test.startTest();
      customLookUpController.fetchLookUpValues('Test', 'user'); 
        test.stopTest();
    }
}