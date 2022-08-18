@isTest
private class TaskOwnerChangeTest {
	
	@isTest static void TaskTest() {
		// Create all required records
		Case myCase    = new Case();
		myCase.OwnerId	   = Id.valueOf('005U0000003p93g');
		myCase.Subject     = 'Sir Mix A Lot Testing Group';
		myCase.Reviewer__c = Id.valueOf('0050B000006okJa');

		insert myCase;

		Task myTask    = new Task();
		myTask.OwnerId		= Id.valueOf('005U0000003p93g');
		myTask.Subject		= 'Rugrats';
		myTask.Status  		= 'Review';

		insert myTask;

		myTask.Status = 'In Progress';

		update myTask;

	}
	
}