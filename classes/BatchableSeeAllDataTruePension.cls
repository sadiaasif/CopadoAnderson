@isTest(SeeAllData=True)
private class BatchableSeeAllDataTruePension {
    static testMethod void testMethod1()
    {
        Test.startTest();
        BatchableSaleStageUpdate createSale = new BatchableSaleStageUpdate();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        
    }
    static testMethod void testMethod2()
    {
        Test.startTest();
        BatchableSaleCreationEntity createSale = new BatchableSaleCreationEntity();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        
    }
    static testMethod void testMethod3()
    {
        Test.startTest();
        BatchableFlipSaleStagePensionRenewals createSale = new BatchableFlipSaleStagePensionRenewals();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        
    }
    
}