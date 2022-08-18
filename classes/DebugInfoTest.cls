@isTest
public class DebugInfoTest {
    
    @isTest
    public static void testDebugInfo() {
        
  		dmlException d = new DmlException();
		
		Test.startTest();
			DebugInfo.createDebugLog(d);
		Test.stopTest();        

        
        List<DebugInfo__c> debugList = [SELECT Id FROM DebugInfo__c];
        System.assert(debugList.size() > 0);

    }

}