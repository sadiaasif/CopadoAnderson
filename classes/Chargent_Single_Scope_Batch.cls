/**
 * @author ericalexander
 * @date 11/29/16
 * @group Schedulable
 * @description Executes the Chargent batch with a scope of One (1) so that errors in one opp data do not affect other recurring opps
 */

global  class Chargent_Single_Scope_Batch implements Schedulable{

    @TestVisible private static String CRON_EXP = '0 0 0 3 9 ? ' + date.today().addYears(1).year();

    global void execute(SchedulableContext sc) {
        ChargentSFA.TChargentBatchProcessing b = new ChargentSFA.TChargentBatchProcessing();
        database.executeBatch(b,1);
    }


}