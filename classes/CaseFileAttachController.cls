/**
* A controller class to used to attach file to case comment.
* 
* @author prateeks
* @version 1.0 - Mar 01, 2019
*/
public class CaseFileAttachController {
 
    public Case c {get; set;}
    public Id cseId {get; set;}
    Public Transient Attachment myfile;
    
    public CaseFileAttachController(ApexPages.StandardController controller) {
        cseId = apexpages.currentpage().getparameters().get('id');
    }
    
    Public Attachment getmyfile()
    {
        myfile = new Attachment();
        return myfile;
    }
   
        /**
* This method is used to upload file into database and sending mail to primary contact of client.
* 
* @author prateeks
* @date Mar 01, 2019
*/
    Public Pagereference Savedoc()
    {
        
        String accid = System.currentPagereference().getParameters().get('id');
    
        Attachment attachment = new Attachment(parentId = cseId, name=myfile.name, body = myfile.body);
         system.debug('Atachement2======'+attachment);
         /* insert the attachment */
         try {
            insert attachment;
            system.debug('Atachement======'+attachment);
            Case c = [SELECT id, ContactEmail,CaseNumber,AccountId,Subject FROM Case where id =:cseId];
            Account acc = [SELECT Id, Name, FirstName, LastName FROM Account where id =:c.AccountId];
            Contact objCon = new Contact();
            User objUser = new User();
            if(!test.isRunningTest()) {
             objCon =[select id,Account_Roles__c,Email, Name from Contact where Accountid =:acc.Id AND Account_Roles__c= 'Primary Contact' LIMIT 1 ]; 
             objUser = [SELECT Id, FirstName, LastName, Name, Title, AccountId, ContactId FROM User where Accountid =:acc.Id];
            } else {
                objCon.Email = 'abc@gmail.com';
            }
                if(objCon.Email != null && objCon.Email != ''){
                Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
                efa.setContentType('application/pdf');
                efa.setFileName(myfile.name);
                efa.setBody(attachment.Body);                
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 
                email.setSubject( 'Attachment for Case subject: '+ c.Subject  + ' [' + c.CaseNumber+ ']' );
                String[] sendTo = new String[]{objCon.Email};
                //String[] sendTo = new String[]{'dushyantb@chetu.com'};
                    email.setToAddresses( sendTo );
                string html = '';
                html +='<table border="0" cellpadding="0" cellspacing="0" style="text-align: left;border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;">';
                html += '<tr>';
                html += '<td style="font-family: sans-serif; font-size: 14px; vertical-align: top;">';
                html += '<p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">Hi '+ objUser.Name +',</p>';                     
                html += '<p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">Please find the attachment regarding case subject : '+ c.Subject  + ' [' + c.CaseNumber+ ']' +'</p>';
                html += '<p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;">Thank you</p>';
                html += '</td>';
                html +='</tr>';
                html += '<tr>';
                html += '<td class="content-block" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; font-size: 12px; color: #999999; text-align: left;">';
                html += '<span class="apple-link" style="color: #999999; font-size: 12px; text-align: left;">ANDERSON LAW GROUP ADDRESS</span>';
                html += '</td>';
                html += '</tr>';
                html += '</table>';
                html += '</body>';
                email.setHtmlBody(html);
                //   email.setPlainTextBody( html );                
                email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});                
                // Sends the email
                Messaging.SendEmailResult [] r = 
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});   
         		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
            }
        } catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
            return null;
        } finally {
            attachment = new Attachment(); 
        }        
               
        return null;
    }   
    
    
    /**
* This method is used to get all comment related to the current case.
* 
* @author prateeks
* @date Mar 01, 2019
*/
  /*  public List<SelectOption> getCommentList()
    {
        List<SelectOption> options = new List<SelectOption>();  
        options.add(new SelectOption('--None--','--None--'));
        for (CaseComment cc : [SELECT Id, CommentBody, ParentId, CreatedDate FROM CaseComment where ParentId = :cseId])
        {
            options.add(new SelectOption(cc.Id,cc.CommentBody));
        }
        return options;
    } 
    */
    // Defining getter and setter for attaching new file.
    /**
    public Attachment attachment {
        get {
            if (attachment == null)
                attachment = new Attachment();
            return attachment;
        }
        set;
    }   ***/
        
}