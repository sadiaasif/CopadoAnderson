@isTest
public class ConvertStringtoHashCodeTest {
	@isTest
    public static void testHashCode(){
        ConvertStringtoHashCode.Inputs input = new ConvertStringtoHashCode.Inputs();
        input.City = 'abc';
        input.Country = 'USA';
        input.phone = '(407) 416-5892';
        input.email = 'test@test.com';
        input.firstname = 'testfirst';
        input.lastname = 'testLast';
        input.States = 'Nevada';
        input.Zipcodes = '80001';
        List<ConvertStringtoHashCode.Inputs> testList = new list<ConvertStringtoHashCode.Inputs>();
        testList.add(input);
        Test.startTest();
        List<ConvertStringtoHashCode.Outputs> opt = ConvertStringtoHashCode.fetgetstrings(testList);
        Test.stopTest();
    }
}