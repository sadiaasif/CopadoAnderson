trigger TaskAll on Task (after update) {

    if (Trigger.isAfter && Trigger.isUpdate) {
        ReplaceClosedTask();
    }
    
    
    
    public void ReplaceClosedTask() {
        
        Set<Id> whatIds = new Set<Id>();
        Id CharlesUserID=[Select id,Name from User where name ='Charles Rogler'].id;
        if (UserInfo.getUserId() != CharlesuserID) {
            for (Task newTask : Trigger.new) {
                Task oldTask = Trigger.oldMap.get(newTask.Id);
                if (newTask.WhatId != null && newTask.IsClosed == true && oldTask.IsClosed == false) {
                    whatIds.add(newTask.WhatId);
                }
            }
            // 
            
            Map<Id, Case> caseMap = new Map<Id, Case>([SELECT Id, IsClosed, OwnerId FROM Case WHERE Id IN :whatIds]);
            Map<Id, AggregateResult> arsMap = new Map<Id, AggregateResult>([SELECT WhatId Id, COUNT(Id) number FROM Task WHERE WhatId IN :caseMap.keyset() AND Isclosed = false GROUP BY WhatId]);
            List<Task> newTasks = new List<Task>();
            for (Task newTask : Trigger.new) {
                Task oldTask = Trigger.oldMap.get(newTask.Id);
                if (newTask.WhatId != null && newTask.IsClosed == true && oldTask.IsClosed == false &&  oldTask.Subject!=   
                'Bookkeeping Task' && caseMap.containsKey(newTask.WhatId) && newTask.RecordTypeId != '0120B000000t82rQAA' ) {
                if ( !caseMap.get(newTask.WhatId).IsClosed && newTask.OwnerId == caseMap.get(newTask.WhatId).OwnerId ) {
                    if (!arsMap.containsKey(newTask.WhatId) || arsMap.get(newTask.WhatId).get('number') == 0) {
                        Task newTask2 = new task();
                        newTask2.WhatId = newTask.WhatId;
                        newTask2.WhoId = newTask.WhoId;
                        newTask2.Subject = newTask.Subject;
                        newTask2.ActivityDate = Date.today().addDays(1);
                        newTask2.OwnerId = newTask.OwnerId;
                        newTasks.add(newTask2);
                    }
                }
            }
        }
        try {
        insert newTasks;
        } catch(Exception e) {
        //add error
        }
        
        
    }
      }   
       

}