/**
* A trigger is used to update the task Comment field Blueprint modifier.
* 
* @Sharukh khan
* @version 1.0 - sep 15, 2020
*/

trigger UpdateCommentTaskModifier on Blueprint__c (after insert) {
    UpdateCommentTaskModiBp handler = new UpdateCommentTaskModiBp();
    handler.updateCommentTask(trigger.new);
}