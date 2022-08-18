@isTest
private class testCampaignMember
{
   @isTest
   static void itShould()
   {

      evt__Special_Event__c evnt=new evt__Special_Event__c();
      evnt.Name='test event';
      insert evnt;
      evt__Attendee__c attende=new evt__Attendee__c();
      attende.evt__Event__c=evnt.id;
      attende.evt__Invitation_Status__c='Cancelled';
      attende.evt__Is_Primary__c=true;
      insert attende;
      update attende;

      Campaign cam=new Campaign();
      cam.Name='test campaign';
      cam.Number_of_Attendees__c=10;
      insert cam;

      Contact con=new Contact(FirstName='first test name',LastName='last test name',Email='test@yahoo.com');
      insert con;

      CampaignMember camMember=new CampaignMember();
      camMember.campaignid  =cam.id;
      camMember.Attendee__c=attende.id;
      camMember.ContactId =con.id;
      camMember.status='Cancelled';
      insert camMember;
      camMember.Status='Attended';
      update camMember;

      attende.evt__Invitation_Status__c='Attended';
      update attende;
   }
}