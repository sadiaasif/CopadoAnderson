trigger setOfBooksTrigger on Set_of_Books__c (before update, after insert, after update) {
    if(trigger.isAfter && trigger.isUpdate) {
        checkRecursive.Run5 = false;
        setOfBooksHandler.bkChange(trigger.new, trigger.newMap, trigger.oldMap);
    }
    if(trigger.isAfter && trigger.isInsert) {
        checkRecursive.runSOBB = false;
        SetOfBooksBeforeHandler.insertHandler(trigger.new, trigger.newMap);
    }
    if(trigger.isBefore && trigger.isUpdate) {
        checkRecursive.runSOBB = false;
        SetOfBooksBeforeHandler.updateHandler(trigger.new, trigger.newMap, trigger.oldMap);
    }
}
