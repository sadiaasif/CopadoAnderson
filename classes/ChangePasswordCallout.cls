/**
* A controller class is used to Change the wordpres password from community.
* 
* @author Sharukh khan/Deepesh kumar
* @version 1.0 - June 02, 2020
*/
public class ChangePasswordCallout {
    public static string username{get;set;}
    public static string password{get;set;}
    public static string cpassword{get;set;}
    Public static string usernameoutput{get;set;}
    Public static string passwordoutput{get;set;}
    public static List<Contact> con;
    public static List<user> uu{get;set;}
    public ChangePasswordCallout(ApexPages.StandardController controller){
        user uu = [select id,Name,Username,AccountId,ContactId from User where id=:UserInfo.getUserId() limit 1];
        system.debug('uu==='+uu);
    }
    @RemoteAction
    public static String sendNewPwdToWordpress(String usrName,String password) {
        Id loggedUserid = UserInfo.getUserId();
        user u = [select id,Name,Username,AccountId,ContactId from User where id=:loggedUserid limit 1];
        Id conId = u.ContactId;
		String wordPressId = [Select Platinum_Wordpress_UserId__c FROM USer WHERE Id=:loggedUserid Limit 1].Platinum_Wordpress_UserId__c;
        account acc = [select id,Name,First_Name__c,Last_Name__c from Account where id=:u.AccountId];
        con = [SELECT Account_Roles__c, AccountId,Email,Id FROM Contact where AccountId=:acc.id and Account_Roles__c='primary contact' AND Id = :conId];  
        String Email=con[0].Email;
        String resStatus;
        String resStatusMsg;
        String resCode;
        usernameoutput = usrName;
        passwordoutput=password;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Platinum_Portal/'+wordPressId);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"password":"'+passwordoutput+'"}');
        HttpResponse response = http.send(request);
        
        string reType='';
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        } if (response.getStatusCode() == 200) {
            sendingEmail(Email,acc.First_Name__c,passwordoutput,usernameoutput);
            reType='Your password has been updated successfully!';   
        } 
        else {
            System.debug(response.getBody());
            retype='We experienced an error updating your password. Please try again in 24 hours.';
        }
        return retype;
    } 
    
    @future
    private static void sendingEmail(String emailId,String firstName,String password,String userName)
    {    
        Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
        String[] sendingTo = new String[]{emailId};
            Integer passwordLength = (password.length())-4;
        password =Password.replace(Password.substring(0,passwordLength),'******');
        system.debug('pass=>'+password);
        semail.setToAddresses(sendingTo);
        semail.setSubject('Your new Platinum Password has been set!'); 
        semail.setHtmlBody('<p>Hello '+firstName+',</p><p>Thank you for being an Anderson Client!</p><p>This email is to confirm that your password has successfully been set in our new Platinum portal. For future reference, your login credentials are below:</p><p>Login URL: https://platinumportal.andersonadvisors.com/<br/> Username:&nbsp;&nbsp;&nbsp;'+userName+'<br/> Password :&nbsp;&nbsp;&nbsp;'+password+'</p><p>The current Platinum Portal will no longer be accessible starting on Friday, July 17, 2020.</p><p>All the content and features available in our existing portal will transfer to our new portal, along with some new features designed to make your experience as our client even better.</p><p>Thank you again for being a Platinum Member. Should you have any questions related to the transition feel free to call us at 1-800-706-4741</p><p>Best,</p><p>Anderson Business Advisors</p>');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {semail}); 
    }
    
    @RemoteAction
    public static string preUsername()
    {
        Id loggedUserid = UserInfo.getUserId();
        user u = [select id,Name,Username,AccountId,ContactId from User where id=:loggedUserid limit 1];
        system.debug('u====='+u);
        String uName=u.Username;
        system.debug('uName=='+uName);
        return uName;
    }
    
}