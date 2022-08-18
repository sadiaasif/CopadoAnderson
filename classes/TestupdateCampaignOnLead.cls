@isTest
private class TestupdateCampaignOnLead
{
	@isTest
	static void itShould()
	{
		Campaign cam=new Campaign();
		cam.Name='test cam';
		cam.Number_of_Attendees__c=10;
		insert cam;

		lead ll=new lead();
		ll.Campaign__c='test cam';
		ll.LastName='test name';
		insert ll;


	}
}