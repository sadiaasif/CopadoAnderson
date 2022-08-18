/**
* A trigger is used to update the task Comment field Blueprint modifier When entity status is changed to sent to processig.
* 
* @Sharukh khan
* @version 1.0 - sep 15, 2020
*/

trigger TaskUpdateComments on Task (before insert) {
    
   TaskUpdateCommentsClass tus=new TaskUpdateCommentsClass();
   tus.taskUpdated(trigger.new);
}