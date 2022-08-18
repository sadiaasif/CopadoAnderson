@isTest(SeeAllData=True)
private class BatchableSeeAllDataTruePensionP4 {
    static testMethod void testMethod1()
    {
        Test.startTest();
        PensionMonthEndCrtNoServSale createSale = new PensionMonthEndCrtNoServSale();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        
    }
    static testMethod void testMethod2()
    {
        Test.startTest();
        PensionMonthEndCrtAdminSales createSale = new PensionMonthEndCrtAdminSales();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        
    }
    static testMethod void testMethod3()
    {
        Test.startTest();
        Pension1stOfMonthCloseOpenSales createSale = new Pension1stOfMonthCloseOpenSales();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        
    }
    static testMethod void testMethod4()
    {
        Test.startTest();
        PensionMonthEndUpdateRecap createSale = new PensionMonthEndUpdateRecap();  
        Id batchId = Database.executeBatch(createSale);
        Test.stopTest();
        
    }
    
}