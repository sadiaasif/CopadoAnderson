/**
* A trigger is used to update the task Comment field With Entity member.
* 
* @Sharukh khan
* @version 1.0 - sep 1, 2020
*/

trigger UpdatedTask on Related_Parties__c (after insert, after update) {
    UpdateTaskforRelatedParties handler = new UpdateTaskforRelatedParties();
    
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            handler.updateTaskCommentByRelOninsert(Trigger.New);
        }
        else if(Trigger.isUpdate)
        {
            handler.updateTaskCommentByRelOnUpdate(Trigger.New,'update');
        }
    }
    
    
    
}