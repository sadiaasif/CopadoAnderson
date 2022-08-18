/**
 * @author ericalexander
 * @date 11/29/16
 * @group Tests
 * @description Tests the Chargent Single Scope Batch Scheduler
 */
@isTest
private class Chargent_Single_Scope_Batch_Test {

    private static testmethod void testSchedule() {
        Test.startTest();

        // Schedule the test job
        String jobId = System.schedule('testChargentSingleScopeSchedule',
                Chargent_Single_Scope_Batch.CRON_EXP,
                new Chargent_Single_Scope_Batch());
        // Get the information from the CronTrigger API object
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered,
                NextFireTime
        FROM CronTrigger WHERE id = :jobId];

        // Verify the expressions are the same

        System.assertEquals(Chargent_Single_Scope_Batch.CRON_EXP,
                ct.CronExpression);

        // Verify the job has not run

        System.assertEquals(0, ct.TimesTriggered);

        // Verify the next time the job will run

        System.assertEquals(date.today().addYears(1).year() + '-09-03 00:00:00',
                String.valueOf(ct.NextFireTime));


        Test.stopTest();

    }

    @TestSetup private static void setupData(){
        
        ChargentBase__Gateway__c testGateway = new ChargentBase__Gateway__c(
                Name = 'TestGateway',
                ChargentBase__Active__c = TRUE,
                ChargentBase__Merchant_ID__c = '111111111111111',
                ChargentBase__Security_Key__c = '222222222222222',
                ChargentBase__Merchant_Reference__c = '123123123',
                ChargentBase__Test_Mode__c = TRUE,
                ChargentBase__Require_AVS__c = TRUE,
                ChargentBase__Require_CCV__c = TRUE,
                ChargentBase__Debug__c = TRUE,
                ChargentBase__Use_Tokenization__c = TRUE,
                ChargentBase__Accounting_Seed_Integration__c = false,
                ChargentBase__Available_Card_Types__c = 'Visa;Mastercard;Discover;American Express',
                ChargentBase__Charge_Amount_Behavior__c = 'Use Opportunity/Order/Case Charge Amount'
        );

        insert testGateway;

    }

}