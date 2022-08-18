@isTest
private class Task_Update_CommentsTest{
	public static testMethod void AfterUpdateEntityTestMethod()
	{
		Entities__c  et = new Entities__c  ();
        //et.RecordTypeId = [SELECT Id, Name, DeveloperName, SobjectType FROM RecordType where Name = 'Limited Liability Company (LLC)' and SobjectType = 'Entities__c'].Id; 
        et.Name='19-11-2019 test';
        et.Processing_Notes__c='19-11-2019 test';
        et.Status__c= 'Sent To Processing';
        insert et;
        et.Processing_Notes__c='19-11-2019 test Deep';
        update et; 
	}

}