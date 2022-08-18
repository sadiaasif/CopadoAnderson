public with sharing class SetOfBooksBeforeHandler {
    public static void insertHandler(List<Set_of_Books__c> newList, Map<Id,Set_Of_Books__c> newMap) {
        if( newList.size() > 0 ){
            List<Set_of_Books__c> updatedList = [Select Id, Client__r.Name From Set_of_Books__c Where Id in: newMap.keyset()];
            
            Integer i = 0;
            for( Set_of_Books__c sob : newList ){
                Map<String, String> params = new Map<String, String>();
                if( sob.Bookkeeper__c != null ){
                    params.put('Recipient', sob.Bookkeeper__c);
                    if( updatedList.get(i).Client__r.Name != '' ){
                        params.put('ClientName', updatedList.get(i).Client__r.Name);
                    }
                    params.put('setOfBooksId', sob.Id);
                    params.put('Entity', 'Bookkeeper');

                    flow.Interview.Bookkeeping_Notify_Bookkeeper_and_Supervisor StaterenewalFlow = new flow.Interview.Bookkeeping_Notify_Bookkeeper_and_Supervisor(params);
                    StaterenewalFlow.start();
                }
                else if( sob.Bookkeeper__c == null && sob.Bookkeeping_Reviewer__c != null ){
                    params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    if( updatedList.get(i).Client__r.Name != '' ){
                        params.put('ClientName', updatedList.get(i).Client__r.Name);
                    }
                    params.put('setOfBooksId', sob.Id);
                    params.put('Entity', 'Bookkeeper');
                    
                    flow.Interview.Bookkeeping_Notify_Bookkeeper_and_Supervisor StaterenewalFlow = new flow.Interview.Bookkeeping_Notify_Bookkeeper_and_Supervisor(params);
                    StaterenewalFlow.start();
                }

                i++;
            }
        }
    }
    public static void updateHandler(List<Set_of_Books__c> newList, Map<Id,Set_Of_Books__c> newMap, Map<Id,Set_Of_Books__c> oldMap) {
        if( newList.size() > 0 ){
            List<Set_of_Books__c> updatedList = [Select Id, Client__r.Name From Set_of_Books__c Where Id in: newMap.keyset()];
            
            Integer i = 0;
            for( Set_of_Books__c sob : newList ){
                /**
                 * Check for bookkeeper update
                 */
                if( sob.Bookkeeper__c != oldMap.get(sob.Id).Bookkeeper__c && sob.Bookkeeper__c != '' ){
                    
                    Map<String, String> params = new Map<String, String>();
                    
                    params.put('Recipient', sob.Bookkeeper__c);
                    params.put('ClientName', updatedList.get(i).Client__r.Name);
                    params.put('setOfBooksId', sob.Id);
                    params.put('Entity', 'Bookkeeper');
                    
                    flow.Interview.Bookkeeping_Notify_Bookkeeper_and_Supervisor StaterenewalFlow = new flow.Interview.Bookkeeping_Notify_Bookkeeper_and_Supervisor(params);
                    StaterenewalFlow.start();
                }
                else{
                    /**
                     * Check for month update and notify bookkeeper
                     */
                    //January
                    Map<String, String> params = new Map<String, String>();

                    if( sob.Bookkeeping_Status__c != oldMap.get(sob.Id).Bookkeeping_Status__c && 
                    ( sob.Bookkeeping_Status__c != '' && 
                    sob.Bookkeeping_Status__c == 'Review Notes' || sob.Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }
                        
                    //February
                    else if( sob.Feb_Bookkeeping_Status__c != oldMap.get(sob.Id).Feb_Bookkeeping_Status__c && 
                    ( sob.Feb_Bookkeeping_Status__c != '' &&
                    sob.Feb_Bookkeeping_Status__c == 'Review Notes' || sob.Feb_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.Feb_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }
    
                    //March
                    else if( sob.Mar_Bookkeeping_Status__c != oldMap.get(sob.Id).Mar_Bookkeeping_Status__c && 
                    ( sob.Mar_Bookkeeping_Status__c != '' &&
                    sob.Mar_Bookkeeping_Status__c == 'Review Notes' || sob.Mar_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.Mar_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }
    
                    //April
                    else if( sob.April_Bookkeeping_Status__c != oldMap.get(sob.Id).April_Bookkeeping_Status__c && 
                    ( sob.April_Bookkeeping_Status__c != '' &&
                    sob.April_Bookkeeping_Status__c == 'Review Notes' || sob.April_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.April_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }

                    //May
                    else if( sob.May_Bookkeeping_Status__c != oldMap.get(sob.Id).May_Bookkeeping_Status__c && 
                    ( sob.May_Bookkeeping_Status__c != '' &&
                    sob.May_Bookkeeping_Status__c == 'Review Notes' || sob.May_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.May_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }

                    //June
                    else if( sob.June_Bookkeeping_Status__c != oldMap.get(sob.Id).June_Bookkeeping_Status__c && 
                    ( sob.June_Bookkeeping_Status__c != '' &&
                    sob.June_Bookkeeping_Status__c == 'Review Notes' || sob.June_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.June_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }

                    //July
                    else if( sob.July_Bookkeeping_Status__c != oldMap.get(sob.Id).July_Bookkeeping_Status__c && 
                    ( sob.July_Bookkeeping_Status__c != '' &&
                    sob.July_Bookkeeping_Status__c == 'Review Notes' || sob.July_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.July_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }

                    //August
                    else if( sob.Aug_Bookkeeping_Status__c != oldMap.get(sob.Id).Aug_Bookkeeping_Status__c && 
                    ( sob.Aug_Bookkeeping_Status__c != '' &&
                    sob.Aug_Bookkeeping_Status__c == 'Review Notes' || sob.Aug_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.Aug_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }

                    //September
                    else if( sob.Sep_Bookkeeping_Status__c != oldMap.get(sob.Id).Sep_Bookkeeping_Status__c && 
                    ( sob.Sep_Bookkeeping_Status__c != '' &&
                    sob.Sep_Bookkeeping_Status__c == 'Review Notes' || sob.Sep_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.Sep_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }

                    //October
                    else if( sob.Oct_Bookkeeping_Status__c != oldMap.get(sob.Id).Oct_Bookkeeping_Status__c && 
                    ( sob.Oct_Bookkeeping_Status__c != '' &&
                    sob.Oct_Bookkeeping_Status__c == 'Review Notes' || sob.Oct_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.Oct_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }

                    //November
                    else if( sob.Nov_Bookkeeping_Status__c != oldMap.get(sob.Id).Nov_Bookkeeping_Status__c && 
                    ( sob.Nov_Bookkeeping_Status__c != '' &&
                    sob.Nov_Bookkeeping_Status__c == 'Review Notes' || sob.Nov_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.Nov_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }

                    //December
                    else if( sob.Dec_Bookkeeping_Status__c != oldMap.get(sob.Id).Dec_Bookkeeping_Status__c && 
                    ( sob.Dec_Bookkeeping_Status__c != '' &&
                    sob.Dec_Bookkeeping_Status__c == 'Review Notes' || sob.Dec_Bookkeeping_Status__c == 'Send Financials' ) ) {
                        params.put('BookkeepingStage', sob.Dec_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeper__c);
                    }

                    /**
                     * Check for month update and notify bookkeeping reviewer
                     */
                    //January
                    else if( sob.Bookkeeping_Status__c != oldMap.get(sob.Id).Bookkeeping_Status__c && 
                    ( sob.Bookkeeping_Status__c != '' && 
                    sob.Bookkeeping_Status__c == 'Review' || sob.Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    //February
                    else if( sob.Feb_Bookkeeping_Status__c != oldMap.get(sob.Id).Feb_Bookkeeping_Status__c && 
                    ( sob.Feb_Bookkeeping_Status__c != '' &&
                    sob.Feb_Bookkeeping_Status__c == 'Review' || sob.Feb_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.Feb_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }
    
                    //March
                    else if( sob.Mar_Bookkeeping_Status__c != oldMap.get(sob.Id).Mar_Bookkeeping_Status__c && 
                    ( sob.Mar_Bookkeeping_Status__c != '' &&
                    sob.Mar_Bookkeeping_Status__c == 'Review' || sob.Mar_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.Mar_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }
    
                    //April
                    else if( sob.April_Bookkeeping_Status__c != oldMap.get(sob.Id).April_Bookkeeping_Status__c && 
                    ( sob.April_Bookkeeping_Status__c != '' &&
                    sob.April_Bookkeeping_Status__c == 'Review' || sob.April_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.April_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    //May
                    else if( sob.May_Bookkeeping_Status__c != oldMap.get(sob.Id).May_Bookkeeping_Status__c && 
                    ( sob.May_Bookkeeping_Status__c != '' &&
                    sob.May_Bookkeeping_Status__c == 'Review' || sob.May_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.May_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    //June
                    else if( sob.June_Bookkeeping_Status__c != oldMap.get(sob.Id).June_Bookkeeping_Status__c && 
                    ( sob.June_Bookkeeping_Status__c != '' &&
                    sob.June_Bookkeeping_Status__c == 'Review' || sob.June_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.June_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    //July
                    else if( sob.July_Bookkeeping_Status__c != oldMap.get(sob.Id).July_Bookkeeping_Status__c && 
                    ( sob.July_Bookkeeping_Status__c != '' &&
                    sob.July_Bookkeeping_Status__c == 'Review' || sob.July_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.July_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    //August
                    else if( sob.Aug_Bookkeeping_Status__c != oldMap.get(sob.Id).Aug_Bookkeeping_Status__c && 
                    ( sob.Aug_Bookkeeping_Status__c != '' &&
                    sob.Aug_Bookkeeping_Status__c == 'Review' || sob.Aug_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.Aug_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    //September
                    else if( sob.Sep_Bookkeeping_Status__c != oldMap.get(sob.Id).Sep_Bookkeeping_Status__c && 
                    ( sob.Sep_Bookkeeping_Status__c != '' &&
                    sob.Sep_Bookkeeping_Status__c == 'Review' || sob.Sep_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.Sep_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    //October
                    else if( sob.Oct_Bookkeeping_Status__c != oldMap.get(sob.Id).Oct_Bookkeeping_Status__c && 
                    ( sob.Oct_Bookkeeping_Status__c != '' &&
                    sob.Oct_Bookkeeping_Status__c == 'Review' || sob.Oct_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.Oct_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    //November
                    else if( sob.Nov_Bookkeeping_Status__c != oldMap.get(sob.Id).Nov_Bookkeeping_Status__c && 
                    ( sob.Nov_Bookkeeping_Status__c != '' &&
                    sob.Nov_Bookkeeping_Status__c == 'Review' || sob.Nov_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.Nov_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    //December
                    else if( sob.Dec_Bookkeeping_Status__c != oldMap.get(sob.Id).Dec_Bookkeeping_Status__c && 
                    ( sob.Dec_Bookkeeping_Status__c != '' &&
                    sob.Dec_Bookkeeping_Status__c == 'Review' || sob.Dec_Bookkeeping_Status__c == 'Completed' ) ) {
                        params.put('BookkeepingStage', sob.Dec_Bookkeeping_Status__c );
                        params.put('Recipient', sob.Bookkeeping_Reviewer__c);
                    }

                    params.put('SOBName', sob.Name);
                    params.put('ClientName', updatedList.get(i).Client__r.Name);
                    params.put('setOfBooksId', sob.Id);
                    params.put('Entity', 'Status');
                    
                    system.debug('params-else:' + params);
                    flow.Interview.Bookkeeping_Notify_Bookkeeper_and_Supervisor StaterenewalFlow = new flow.Interview.Bookkeeping_Notify_Bookkeeper_and_Supervisor(params);
                    StaterenewalFlow.start();
                }

                i++;
            }
        }
    }
}