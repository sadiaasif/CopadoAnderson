@isTest(SeeAllData=true)
public class RHX_TEST_H2S_HarvestProject {
    static testMethod void RHX_Testmethod() {
        List<sObject> sourceList = [SELECT Id 
            FROM H2S__HarvestProject__c LIMIT 1];
        if(sourceList.size() == 0) {
            sourceList.add(
                    new H2S__HarvestProject__c()
            );
        }
        
    }
}