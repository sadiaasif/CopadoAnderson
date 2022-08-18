trigger BookkeepingTrigger on Bookkeeping__c (after insert, after update) {


    if(checkRecursive.runOnceSetofBooks())
    {
           system.debug('inside recursive 3 update');
    	if (trigger.isAfter && Trigger.isUpdate) {
        system.debug('inside recursive 4 update');
        bookkeepingClientWideComments.ClientWideComments(trigger.new, trigger.oldMap);
        bookkeepingSetOfBooks.matchFieldsAcrossBooks(trigger.new, trigger.oldMap, trigger.NewMap);
        
    	}
    }
}