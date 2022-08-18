public class setOfBooksHandler {
    
    public static void bkChange(List<Set_of_Books__c> newList, Map<Id,Set_Of_Books__c> newMap, Map<Id,Set_Of_Books__c> oldMap) {
        
        List<Bookkeeping__c> updateList = new List<Bookkeeping__c>();
                
        for (Set_of_Books__c bookset : newList) {
            
            system.debug(bookset.id);
            
            // SCH-0048
            if(!newMap.equals(oldMap)) {
                system.debug('cond chk: '+ ( !newMap.equals(oldMap) ) );
                for (Bookkeeping__c bk : [SELECT Id,Name, Bookkeeper__c FROM Bookkeeping__c WHERE Set_Of_Books__c = :bookset.id]) {
                    
                    system.debug('bk.Name: '+bk.Name);
                    
                    //Record Details
                    bk.Bookkeeper__c 		    = bookset.Bookkeeper__c;
                    bk.Bookkeeper_Reviewer__c   = bookset.Bookkeeping_Reviewer__c;
                    bk.Client_Name__c		    = bookset.Client__c;
                    bk.Case__c  			    = bookset.Case__c;
                    bk.Quickbooks_Record_URL__c = bookset.Quickbooks_Record_URL__c;
                    bk.Box_Viewable_Folder__c   = bookset.Box_Viewable_Folder__c;
                    
                    //Stage info
                    bk.Jan_Bookkeeping_Stages__c = bookset.Jan_Bookkeeping_Stages__c;
                    bk.Feb_Bookkeeping_Stages__c = bookset.Feb_Bookkeeping_Stages__c;
                    bk.Mar_Bookkeeping_Stages__c = bookset.Mar_Bookkeeping_Stages__c;
                    bk.Apr_Bookkeeping_Stages__c = bookset.Apr_Bookkeeping_Stages__c;
                    bk.May_Bookkeeping_Stages__c = bookset.May_Bookkeeping_Stages__c;
                    bk.Jun_Bookkeeping_Stages__c = bookset.Jun_Bookkeeping_Stages__c;
                    bk.Jul_Bookkeeping_Stages__c = bookset.Jul_Bookkeeping_Stages__c;
                    bk.Aug_Bookkeeping_Stages__c = bookset.Aug_Bookkeeping_Stages__c;
                    bk.Sep_Bookkeeping_Stages__c = bookset.Sep_Bookkeeping_Stages__c;
                    bk.Oct_Bookkeeping_Stages__c = bookset.Oct_Bookkeeping_Stages__c;
                    bk.Nov_Bookkeeping_Stages__c = bookset.Nov_Bookkeeping_Stages__c;
                    bk.Dec_Bookkeeping_Stages__c = bookset.Dec_Bookkeeping_Stages__c;
                    
                    //Draft Financial Info
                    bk.Jan_Draft_Financial_Sent_to_Client_On__c = bookset.Jan_Draft_Financial_Sent_to_Client_On__c;
                    bk.Feb_Draft_Financial_Sent_to_Client_On__c = bookset.Feb_Draft_Financial_Sent_to_Client_On__c;
                    bk.Mar_Draft_Financial_Sent_to_Client_On__c = bookset.Mar_Draft_Financial_Sent_to_Client_On__c;
                    bk.Apr_Draft_Financial_Sent_to_Client_On__c = bookset.Apr_Draft_Financial_Sent_to_Client_On__c;
                    bk.May_Draft_Financial_Sent_to_Client_On__c = bookset.May_Draft_Financial_Sent_to_Client_On__c;
                    bk.Jun_Draft_Financial_Sent_to_Client_On__c = bookset.Jun_Draft_Financial_Sent_to_Client_On__c;
                    bk.Jul_Draft_Financial_Sent_to_Client_On__c = bookset.Jul_Draft_Financial_Sent_to_Client_On__c;
                    bk.Aug_Draft_Financial_Sent_to_Client_On__c = bookset.Aug_Draft_Financial_Sent_to_Client_On__c;
                    bk.Sep_Draft_Financial_Sent_to_Client_On__c = bookset.Sep_Draft_Financial_Sent_to_Client_On__c;
                    bk.Oct_Draft_Financial_Sent_to_Client_On__c = bookset.Oct_Draft_Financial_Sent_to_Client_On__c;
                    bk.Nov_Draft_Financial_Sent_to_Client_On__c = bookset.Nov_Draft_Financial_Sent_to_Client_On__c;
                    bk.Dec_Draft_Financial_Sent_to_Client_On__c = bookset.Dec_Draft_Financial_Sent_to_Client_On__c;
                    
                    //Tax Info
                    bk.Fiscal_Year_End__c 					= bookset.Fiscal_Year_End__c;
                    bk.Completing_Books_for_Tax_Year__c     = bookset.Completing_Books_for_Tax_Year__c;
                    bk.Sent_to_Tax__c						= bookset.Sent_To_Tax__c;
                    bk.Extension_Filed__c					= bookset.Extension_Filed__c;
                    bk.Return_Filed__c						= bookset.Return_Filed__c;
                    bk.X1099_Info__c						= bookset.X1099_Info__c;
                    
                    
                    updateList.add(bk);
                }
                
            }
            
        }
        
        update updateList;
        
    }
}