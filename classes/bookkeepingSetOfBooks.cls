public class bookkeepingSetOfBooks {
    
    public static boolean alreadyProcessed;
    public static boolean runningfromHarvest = false;
    public static void matchFieldsAcrossBooks(List<Bookkeeping__c> newList, Map<Id,Bookkeeping__c> oldMap, Map<Id,Bookkeeping__c> newMap) {
        
        if (alreadyProcessed == true) return;
        alreadyProcessed = true;
        
        // Don't run when HarvestSync fields are updated
       /** Id PhilId = [SELECT Id FROM User Where Name = 'Phil Perna'].id;
        if (UserInfo.getUserId() == PhilId) {
            return;
        }    */
         if (runningfromHarvest == true) return;
        
        List<Bookkeeping__c> bkUpdateList = new List<Bookkeeping__c>();
        
        try {    
            
            for (Bookkeeping__c bk : newList){
                
                if (!newMap.equals(oldMap)) {
                    
                    if (bk.Jan_Called_Client_On__c == oldMap.get(bk.Id).Jan_Called_Client_On__c &&
                        bk.Feb_Called_Client_On__c == oldMap.get(bk.Id).Feb_Called_Client_On__c && 
                        bk.Mar_Called_Client_On__c == oldMap.get(bk.Id).Mar_Called_Client_On__c && 
                        bk.Apr_Called_Client_On__c == oldMap.get(bk.Id).Apr_Called_Client_On__c && 
                        bk.May_Called_Client_On__c == oldMap.get(bk.Id).May_Called_Client_On__c && 
                        bk.Jun_Called_Client_On__c == oldMap.get(bk.Id).Jun_Called_Client_On__c && 
                        bk.Jul_Called_Client_On__c == oldMap.get(bk.Id).Jul_Called_Client_On__c && 
                        bk.Aug_Called_Client_On__c == oldMap.get(bk.Id).Aug_Called_Client_On__c && 
                        bk.Sep_Called_Client_On__c == oldMap.get(bk.Id).Sep_Called_Client_On__c && 
                        bk.Oct_Called_Client_On__c == oldMap.get(bk.Id).Oct_Called_Client_On__c && 
                        bk.Nov_Called_Client_On__c == oldMap.get(bk.Id).Nov_Called_Client_On__c && 
                        bk.Dec_Called_Client_On__c == oldMap.get(bk.Id).Dec_Called_Client_On__c) {

                            for (Bookkeeping__c relatedBK : [SELECT Id FROM Bookkeeping__c 
                                                             WHERE Client_Name__c = :bk.Client_Name__c 
                                                             AND Set_Of_Books__c = :bk.Set_of_Books__c 
                                                             AND Set_Of_Books__c != null AND Id != :bk.Id]) {
                                                                 
                                                                 //Record Detail Information
                                                                 relatedBk.Bookkeeper__c 		   = bk.Bookkeeper__c;
                                                                 relatedBk.Bookkeeper_Reviewer__c  = bk.Bookkeeper_Reviewer__c;
                                                                 relatedBk.Jr_Bookkeeper__c 	   = bk.Jr_Bookkeeper__c;
                                                                 relatedBk.Sent_to_Tax__c 		   = bk.Sent_to_Tax__c;
                                                                 relatedBk.Return_Filed__c 		   = bk.Return_Filed__c;
                                                                 relatedBk.Extension_Filed__c 	   = bk.Extension_Filed__c;
                                                                 relatedBk.Client_Wide_Comments__c = bk.Client_Wide_Comments__c;                                 
                                                                 
                                                                 //January
                                                                 relatedBk.Jan_Bookkeeping_Stages__c 				= bk.Jan_Bookkeeping_Stages__c;
                                                                 relatedBk.Jan_Docs_Rcvd_From_Client__c 			= bk.Jan_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Jan_Draft_Financial_Sent_to_Client_On__c = bk.Jan_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Jan_Financials_Sent_to_Client_On__c 		= bk.Jan_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Jan_Due_Date__c 							= bk.Jan_Due_Date__c;
                                                                 relatedBk.Jan_Priority__c 							= bk.Jan_Priority__c;
                                                                 relatedBk.Jan_Called_Client_On__c 					= bk.Jan_Called_Client_On__c;
                                                                 
                                                                 //February
                                                                 relatedBk.Feb_Bookkeeping_Stages__c 				= bk.Feb_Bookkeeping_Stages__c;
                                                                 relatedBk.Feb_Docs_Rcvd_From_Client__c 			= bk.Feb_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Feb_Draft_Financial_Sent_to_Client_On__c = bk.Feb_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Feb_Financials_Sent_to_Client_On__c 		= bk.Feb_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Feb_Due_Date__c 							= bk.Feb_Due_Date__c;
                                                                 relatedBk.Feb_Priority__c 							= bk.Feb_Priority__c;
                                                                 relatedBk.Feb_Called_Client_On__c 					= bk.Feb_Called_Client_On__c;
                                                                 
                                                                 //March
                                                                 relatedBk.Mar_Bookkeeping_Stages__c 				= bk.Mar_Bookkeeping_Stages__c;
                                                                 relatedBk.Mar_Docs_Rcvd_From_Client__c 			= bk.Mar_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Mar_Draft_Financial_Sent_to_Client_On__c = bk.Mar_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Mar_Financials_Sent_to_Client_On__c 		= bk.Mar_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Mar_Due_Date__c 							= bk.Mar_Due_Date__c;
                                                                 relatedBk.Mar_Priority__c 							= bk.Mar_Priority__c;
                                                                 relatedBk.Mar_Called_Client_On__c 					= bk.Mar_Called_Client_On__c;
                                                                 
                                                                 //April
                                                                 relatedBk.Apr_Bookkeeping_Stages__c 				= bk.Apr_Bookkeeping_Stages__c;
                                                                 relatedBk.Apr_Docs_Rcvd_From_Client__c 			= bk.Apr_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Apr_Draft_Financial_Sent_to_Client_On__c = bk.Apr_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Apr_Financials_Sent_to_Client_On__c 		= bk.Apr_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Apr_Due_Date__c 							= bk.Apr_Due_Date__c;
                                                                 relatedBk.Apr_Priority__c 							= bk.Apr_Priority__c;
                                                                 relatedBk.Apr_Called_Client_On__c 					= bk.Apr_Called_Client_On__c;
                                                                 
                                                                 //May
                                                                 relatedBk.May_Bookkeeping_Stages__c 				= bk.May_Bookkeeping_Stages__c;
                                                                 relatedBk.May_Docs_Rcvd_From_Client__c 			= bk.May_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.May_Draft_Financial_Sent_to_Client_On__c = bk.May_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.May_Financials_Sent_to_Client_On__c 		= bk.May_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.May_Due_Date__c 							= bk.May_Due_Date__c;
                                                                 relatedBk.May_Priority__c 							= bk.May_Priority__c;
                                                                 relatedBk.May_Called_Client_On__c 					= bk.May_Called_Client_On__c;
                                                                 
                                                                 //June
                                                                 relatedBk.Jun_Bookkeeping_Stages__c 				= bk.Jun_Bookkeeping_Stages__c;
                                                                 relatedBk.Jun_Docs_Rcvd_From_Client__c 			= bk.Jun_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Jun_Draft_Financial_Sent_to_Client_On__c = bk.Jun_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Jun_Financials_Sent_to_Client_On__c 		= bk.Jun_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Jun_Due_Date__c 							= bk.Jun_Due_Date__c;
                                                                 relatedBk.Jun_Priority__c 							= bk.Jun_Priority__c;
                                                                 relatedBk.Jun_Called_Client_On__c 					= bk.Jun_Called_Client_On__c;
                                                                 
                                                                 //July
                                                                 relatedBk.Jul_Bookkeeping_Stages__c 				= bk.Jul_Bookkeeping_Stages__c;
                                                                 relatedBk.Jul_Docs_Rcvd_From_Client__c 			= bk.Jul_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Jul_Draft_Financial_Sent_to_Client_On__c = bk.Jul_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Jul_Financials_Sent_to_Client_On__c 		= bk.Jul_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Jul_Due_Date__c 							= bk.Jul_Due_Date__c;
                                                                 relatedBk.Jul_Priority__c 							= bk.Jul_Priority__c;
                                                                 relatedBk.Jul_Called_Client_On__c 					= bk.Jul_Called_Client_On__c;
                                                                 
                                                                 //August
                                                                 relatedBk.Aug_Bookkeeping_Stages__c 				= bk.Aug_Bookkeeping_Stages__c;
                                                                 relatedBk.Aug_Docs_Rcvd_From_Client__c 			= bk.Aug_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Aug_Draft_Financial_Sent_to_Client_On__c = bk.Aug_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Aug_Financials_Sent_to_Client_On__c 		= bk.Aug_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Aug_Due_Date__c 							= bk.Aug_Due_Date__c;
                                                                 relatedBk.Aug_Priority__c 							= bk.Aug_Priority__c;
                                                                 relatedBk.Aug_Called_Client_On__c 					= bk.Aug_Called_Client_On__c;
                                                                 
                                                                 //September 
                                                                 relatedBk.Sep_Bookkeeping_Stages__c 				= bk.Sep_Bookkeeping_Stages__c;
                                                                 relatedBk.Sep_Docs_Rcvd_From_Client__c 			= bk.Sep_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Sep_Draft_Financial_Sent_to_Client_On__c = bk.Sep_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Sep_Financials_Sent_to_Client_On__c 		= bk.Sep_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Sep_Due_Date__c 							= bk.Sep_Due_Date__c;
                                                                 relatedBk.Sep_Priority__c 							= bk.Sep_Priority__c;
                                                                 relatedBk.Sep_Called_Client_On__c 					= bk.Sep_Called_Client_On__c;
                                                                 
                                                                 //October
                                                                 relatedBk.Oct_Bookkeeping_Stages__c 				= bk.Oct_Bookkeeping_Stages__c;
                                                                 relatedBk.Oct_Docs_Rcvd_From_Client__c 			= bk.Oct_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Oct_Draft_Financial_Sent_to_Client_On__c = bk.Oct_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Oct_Financials_Sent_to_Client_On__c 		= bk.Oct_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Oct_Due_Date__c 							= bk.Oct_Due_Date__c;
                                                                 relatedBk.Oct_Priority__c 							= bk.Oct_Priority__c;
                                                                 relatedBk.Oct_Called_Client_On__c 					= bk.Oct_Called_Client_On__c;
                                                                 
                                                                 //November
                                                                 relatedBk.Nov_Bookkeeping_Stages__c 				= bk.Nov_Bookkeeping_Stages__c;
                                                                 relatedBk.Nov_Docs_Rcvd_From_Client__c 			= bk.Nov_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Nov_Draft_Financial_Sent_to_Client_On__c = bk.Nov_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Nov_Financials_Sent_to_Client_On__c 		= bk.Nov_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Nov_Due_Date__c 							= bk.Nov_Due_Date__c;
                                                                 relatedBk.Nov_Priority__c						 	= bk.Nov_Priority__c;
                                                                 relatedBk.Nov_Called_Client_On__c 					= bk.Nov_Called_Client_On__c;
                                                                 
                                                                 //December
                                                                 relatedBk.Dec_Bookkeeping_Stages__c 				= bk.Dec_Bookkeeping_Stages__c;
                                                                 relatedBk.Dec_Docs_Rcvd_From_Client__c 			= bk.Dec_Docs_Rcvd_From_Client__c;
                                                                 relatedBk.Dec_Draft_Financial_Sent_to_Client_On__c = bk.Dec_Draft_Financial_Sent_to_Client_On__c;
                                                                 relatedBk.Dec_Financials_Sent_to_Client_On__c 		= bk.Dec_Financials_Sent_to_Client_On__c;
                                                                 relatedBk.Dec_Due_Date__c 							= bk.Dec_Due_Date__c;
                                                                 relatedBk.Dec_Priority__c 							= bk.Dec_Priority__c;
                                                                 relatedBk.Dec_Called_Client_On__c 					= bk.Dec_Called_Client_On__c;
                                                                 
                                                                 bkUpdateList.add(relatedBk);
                                                                 
                                                                 
                                                             }
                        }
                    
                }
            }
            
            Map<Id,Bookkeeping__c> BKMap= new Map<Id,Bookkeeping__c>();
            BKMap.putAll(bkUpdateList);
            
            if(BKMap.size()>0){
                update BKMap.values(); 
            }
            
        } catch (Exception e) {
            debugInfo.createDebugLog(e);
        } finally {
            
            integer cpuTime = Limits.getCpuTime();
            integer Queries = Limits.getQueries();
            system.debug('CPU Time: '+cpuTime);
            system.debug('Queries: '+Queries);
        }
    }
    
}