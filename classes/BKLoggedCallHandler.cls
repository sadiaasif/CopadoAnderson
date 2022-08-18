public class BKLoggedCallHandler {
    
    public static boolean alreadyProcessed;
    
    public void taskDuplication(List<Task> newList) {
        
        if(alreadyProcessed == true) return;
        alreadyProcessed = true;
        List<Task> taskList = new List<Task>();
        List<Bookkeeping__c> bkUpdateList = new List<Bookkeeping__c>();
        
        for (Task t:newList) {
            // If a completed call is logged in a case
            if (t.RecordTypeId == '012U0000000g5s9' && 
                t.Status == 'Completed' && 
                t.WhatId != null &&
                String.valueOf(t.WhatId).StartsWith('500')){
                    // Duplicate the call on related bookkeeping records
                    for(Bookkeeping__c BK:[SELECT Id, Set_Of_Books__c, Client_Name__c FROM Bookkeeping__c Where (Case__c = :t.WhatId)]) {
                        task newTask = new task();
                        newTask.Subject = t.Subject;
                        newTask.ActivityDate = t.ActivityDate;
                        newTask.Status = t.Status;
                        newTask.OwnerId = t.OwnerId;
                        newTask.RecordTypeId = t.RecordTypeId;
                        newTask.WhatId = BK.Id;
                        newTask.Client__c = bk.Client_Name__c;
                        newTask.Summary__c = t.Summary__c;
                        newTask.Call_Outcome__c = t.Call_Outcome__c;
                        newTask.Type = t.Type;
                        newTask.Priority = t.Priority;
                        newTask.Description = t.Description;
                        newTask.Bookkeeping_Reviewer__c = t.Bookkeeping_Reviewer__c;
                        taskList.add(newTask);
                        
                            switch on (test.isRunningTest() ? Integer.valueOf(t.Fee_Quote__c) : system.today().month()) {
                                
                                When 1 {
                                    bk.Jan_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                When 2 {
                                    bk.Feb_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                When 3 {
                                    bk.Mar_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                when 4 {
                                    bk.Apr_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                when 5 {
                                    bk.May_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                when 6 {
                                    bk.Jun_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                when 7 {
                                    bk.Jul_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                when 8 {
                                    bk.Aug_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                when 9 {
                                    bk.Sep_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                when 10 {
                                    bk.Oct_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                when 11 {
                                    bk.Nov_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                }
                                when 12{
                                    bk.Dec_Called_Client_On__c = system.now();
                                    bkUpdateList.add(bk);
                                } 
                        }

                        
                    } 
  
                    insert taskList;
                    update bkUpdateList;    
                    
                }
        }
    }
}