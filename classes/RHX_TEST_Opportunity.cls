@isTest(SeeAllData=true)
public class RHX_TEST_Opportunity {
    static testMethod void RHX_Testmethod() {
        List<sObject> sourceList = [SELECT Id 
            FROM Opportunity order by lastmodifieddate desc LIMIT 1];
        if(sourceList.size() == 0) {
            sourceList.add(
                    new Opportunity()
            );
        }
      
    }
}