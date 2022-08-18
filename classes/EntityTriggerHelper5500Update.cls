/* 
* Author: Muhammad Awais Khan
* Date: 12/Jan/22
* Purpose: Update "Current Plan Year End" field based on "Updated Tax Year-End" when it is changed, 
			and also calculate and update "5500 Due Date"
Change History: Ali Hamza Added check based on trigger context and record type.
*/
public with sharing class EntityTriggerHelper5500Update {
    
    public static boolean helper5500Update(List<Entities__c> newData,Map<Id,Entities__c> oldMap, Boolean insertTrigger,Boolean updateTrigger){
        Boolean ret = true;
        Integer intCurrentYear = date.Today().year() ;
        String currentYear = String.valueOf( intCurrentYear );
        String nextYear = String.valueOf( intCurrentYear + 1 );
        Boolean isLeapYear = Date.isLeapYear( intCurrentYear + 1 );
        Id recordTypeIdPensionPlan =Schema.SObjectType.Entities__c.getRecordTypeInfosByName().get('Pension Plan').getRecordTypeId();
        //context is update and current plan year end change
        //context is update and Tax year end changed is updated
        //Record type check
        for (Entities__c Ent : newData) {
            if(Ent.RecordTypeId == recordTypeIdPensionPlan && 
               ((updateTrigger && oldMap!=null &&( Ent.Current_Plan_Year_End__c != oldMap.get(Ent.Id).Current_Plan_Year_End__c  || Ent.Updated_Tax_Year_End__c != oldMap.get(Ent.Id).Updated_Tax_Year_End__c) )
               || (insertTrigger && (Ent.Year_End__c != null || Ent.Current_Plan_Year_End__c != null || Ent.Updated_Tax_Year_End__c != null) ))
              )
            {
                if( insertTrigger && Ent.Year_End__c == null) { return false; }//First Tax Year End is null
                if(Ent.Year_End_Month__c != null ) {
                    MONTHS selectedMonths = getSelectedMonth(Ent.Year_End_Month__c);
                    system.debug('selectedMonths>'+selectedMonths);
                    Date PensionDueDate= getFormattedPensionDueDate(Ent.Recap_End_Date__c);
                    switch on selectedMonths {
                        when January {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '8/31/'+currentYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = ( Date.isLeapYear( Ent.Recap_End_Date__c.year() ) == true ) ? 
                                    PensionDueDate.addDays(122) : PensionDueDate.addDays(121);
                            }
                        }
                        when February {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '9/30/'+currentYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = PensionDueDate.addDays(123);
                            }
                        }
                        when March {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '10/31/'+currentYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = PensionDueDate.addDays(123);
                             }
                        }
                        when April {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '11/30/'+currentYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = PensionDueDate.addDays(124);
                            }
                        }
                        when May {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '12/31/'+currentYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = PensionDueDate.addDays(123);
                            }
                        }
                        when June {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '1/31/'+nextYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = PensionDueDate.addDays(124);
                            }                    
                        }
                        when July {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  ( isLeapYear == true ) ? date.parse( '02/29/'+nextYear ) : date.parse( '02/28/'+nextYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = PensionDueDate.addDays(123);
                             }
                        }
                        when August {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '3/31/'+nextYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = PensionDueDate.addDays(123);
                            }
                        }
                        when September {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '4/30/'+nextYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = PensionDueDate.addDays(124);
                            }
                        }
                        when October {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '5/31/'+nextYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = ( Date.isLeapYear( Ent.Recap_End_Date__c.year() + 1 ) == true ) ? 
                                    PensionDueDate.addDays(122) : PensionDueDate.addDays(121);
                            }
                        }
                        when November {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '6/30/'+nextYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = ( Date.isLeapYear( Ent.Recap_End_Date__c.year() + 1 ) == true ) ? 
                                    PensionDueDate.addDays(123) : PensionDueDate.addDays(122);
                            }
                        }
                        when December {
                            Ent.X5500_Due_Date__c = (Ent.Current_Plan_Year_End__c == null) ? null :  date.parse( '7/31/'+nextYear );
                            if(Ent.Recap_End_Date__c != null){
                                Ent.Pension_Due_Date__c = ( Date.isLeapYear( Ent.Recap_End_Date__c.year() + 1 ) == true ) ? 
                                    PensionDueDate.addDays(122) : PensionDueDate.addDays(121);
                            }
                        }
                        when else {
                            ret = false;
                        }
                    }
                }
            }
        }
        return ret;
    }
    private enum MONTHS {January, February, March, April,May,June,July,August,September,October,November,December}
    private static MONTHS getSelectedMonth(String CurrentMonth) {
        for (MONTHS m : MONTHS.values()) {
            if (String.valueOf(m) == CurrentMonth) {
                return m;
            }
        }
        return null;
    }
    private static Date getFormattedPensionDueDate(Date recapEndDate)
    {
        Date formattedDate = null;
        try
        {
            formattedDate = Date.newInstance(recapEndDate.year(), recapEndDate.month(), recapEndDate.day());
            return formattedDate;
        }
        catch(Exception ex){}
        return formattedDate;
    }
}