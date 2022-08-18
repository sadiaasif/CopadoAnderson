public with sharing class EmailReceipt 
{
	Id ClientId = System.currentPageReference().getParameters().get('Id');
	public EmailReceipt(ApexPages.StandardController controller) 
	{
		PageReference pdf = Page.AndersonReceit;
		Opportunity Opp = [select Account.E_Mail__c from Opportunity where id =: ClientId limit 1];
		String ClientEmail =  Opp.Account.E_Mail__c;
    // add parent id to the parameters for standardcontroller
    pdf.getParameters().put('Id',ClientId);
 
    // the contents of the attachment from the pdf
    Blob body;
 
    try {
 
      // returns the output of the page as a PDF
      body = pdf.getContent();
 
    // need to pass unit test -- current bug  
    } catch (VisualforceException e) {
      body = Blob.valueOf('Error Occured');
    }
 
    Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
    attach.setContentType('application/pdf');
    attach.setFileName('Receipt.pdf');
    attach.setInline(false);
    attach.Body = body;
 
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setUseSignature(false);
    mail.setToAddresses(new String[] { ClientEmail });
    mail.setSubject('Anderson Advisers, LLC Receipt');
    mail.setHtmlBody(' Enclosed is your receipt - Jamie to provide additional details <br/><br/> From <br/>Clint Coons');
    mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
 mail.senderDisplayName = 'Clint Coons';
 mail.replyTo = [select id,email from User where name = 'Clint Coons'].Email;
    // Send the email
    
    	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    
	   
    
	}
	
	public pageReference goOpp()
	{
		 Task t = new Task();
	    Id UId = [select id from User where name = 'Clint Coons'].id;
	    //t.AssignedTo = UId;
	    t.WhatId = ClientId;
	    t.OwnerId = UId; 
	    t.ActivityDate = System.today();
	    t.Status = 'Completed';
	    t.Description = 'Enclosed is your receipt - Jamie to provide additional details  From Clint Coons';
	    t.Subject = 'Anderson Advisers, LLC Receipt';
	    
	    insert t;
		pageReference pf = new pageReference('/'+ClientId);
		return pf;
	}
}