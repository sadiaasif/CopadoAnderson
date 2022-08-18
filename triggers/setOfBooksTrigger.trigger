trigger setOfBooksTrigger on Set_of_Books__c (after update) {
    
    checkRecursive.Run5 = false;
    setOfBooksHandler.bkChange(trigger.new, trigger.newMap, trigger.oldMap);
}