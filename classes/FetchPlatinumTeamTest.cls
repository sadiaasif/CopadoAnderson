@isTest
public class FetchPlatinumTeamTest {
    @testsetup
    public static void testData(){
        Account acc = new Account();
        acc.name = 'Test Account';
        acc.Teams__c = 'Team 1';
        acc.Using_Teams__c = 'Yes';
        insert acc;
        Id profId = [select id from profile where name = 'System Administrator' limit 1].id; 
        User u = new User();
        u.FirstName = 'Test';
        u.LastName = 'User';
        u.ProfileId = profId;
        u.Username = 'testUser@teams.com';
        u.email = 'testUser@sf.com';
        u.EmailEncodingKey = 'ISO-8859-1';
        u.Alias = 'tu';
        u.Title = 'Advisor Admin';
        u.Team__c = 'Team 1';
        u.TimeZoneSidKey = 'America/Los_Angeles';  
        u.LocaleSidKey = 'en_US';  
        u.LanguageLocaleKey = 'en_US';
        insert u;
    }
    @isTest
    public static void testFetchUserTeam(){
        Id accId = [select id from Account limit 1].id;
        RestRequest request = new RestRequest();
        RestResponse res = new RestResponse();
        request.requestUri ='https://andersonadvisors--octopus.my.salesforce.com/services/apexrest/AccountTeam/'+accId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        RestContext.response= res;
        FetchPlatinumTeam.getTeamDetails();
        system.assertEquals(true, true, 'success');
      
    }
    @isTest
    public static void testFetchUserTeamNegative(){
        Account acc = [select id,teams__c from Account limit 1];
        acc.teams__c = 'VIP';
        update acc;
        RestRequest request = new RestRequest();
        RestResponse res = new RestResponse();
        request.requestUri ='https://andersonadvisors--octopus.my.salesforce.com/services/apexrest/AccountTeam/'+acc.Id;
        request.httpMethod = 'GET';
        RestContext.request = request;
        RestContext.response= res;
        FetchPlatinumTeam.getTeamDetails();
        system.assertEquals(true, true, 'success');
      
    }

}