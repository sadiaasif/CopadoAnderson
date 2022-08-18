@isTest
private class TestcopyCampaign
{
	@isTest
	static void itShould()
	{

                  Campaign cam=new Campaign();
                  cam.Name='test cam';
                  cam.Number_of_Attendees__c=10;
                   insert cam;

                  Lead ld = new Lead();
                  ld.FirstName = 'testFirstName';
                  ld.LastName = 'testLastName';
                  ld.Primary_Campaign_Dummy__c='test cam';
                  ld.pi__utm_campaign__c='test cam';
                  insert ld;
                  update ld;

	}
}