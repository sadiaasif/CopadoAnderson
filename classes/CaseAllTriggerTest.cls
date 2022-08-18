@isTest
private class CaseAllTriggerTest {
	
	@isTest static void testMethodChangeEntityOwner() {
		Case TestCase1 = new Case(Status = 'New',Origin = 'Email');
		insert TestCase1;
		List<Entities__c> TestEntities = new List<Entities__c>{new Entities__c(Name = 'TestEntity1'),
			new Entities__c(Name = 'TestEntity2'),new Entities__c(Name = 'TestEntity3',Case__c = TestCase1.id)};
		insert TestEntities;
   		Profile profile1 = [SELECT Id FROM Profile WHERE Name='Standard User']; 

		User testUser = new User(
   		ProfileId = profile1.Id,
   		Username ='DarkKnight@test.com',
   		Alias = 'batman',
   		Email='bruce.wayne@wayneenterprises.com',
   		EmailEncodingKey='UTF-8',
   		Firstname='Bruce',
   		Lastname='Wayne',
   		LanguageLocaleKey='en_US',
   		LocaleSidKey='en_US',
   		TimeZoneSidKey='America/Chicago'
   		);
		insert(TestUser);

		TestCase1.OwnerId = TestUser.id;
		TestEntities[0].Case_Owner__c = TestUser.id;
		update TestCase1;
		Entities__c testEn = [SELECT id,Case_Owner__c From Entities__c Where id = :TestEntities[2].id];
		system.assertEquals(TestEn.Case_Owner__c,TestCase1.OwnerId);
		system.assertNotEquals(TestEntities[1].Case_Owner__c,TestCase1.OwnerId);
	}
}