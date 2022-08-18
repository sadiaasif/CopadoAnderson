/**
 * Email services are automated processes that use Apex classes
 * to process the contents, headers, and attachments of inbound
 * email.
 */
global class OpportunityQuoteHandler implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
		Id OpportunityId;

		for(Messaging.InboundEmail.Header h : email.headers) {
			System.Debug('CHECKING HEADER: ' + h);
			if(h.name.contains('OpportunityId')) {
				OpportunityId = h.value;
				break;
			}
		}
		
		insert new Attachment( Name = email.binaryAttachments[0].fileName,
						ParentId = OpportunityId,
						ContentType = 'application/pdf',
						Body = email.binaryAttachments[0].body
		);
		
        return result;
    }
    
    static testMethod void testMe() {
 
	  // create a new email and envelope object
	  Messaging.InboundEmail email = new Messaging.InboundEmail() ;
	  Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
	  
	  Opportunity o = new Opportunity(Name = 'Test', CloseDate = System.Today(), StageName = 'Test');
	  insert o;
	  
	  Messaging.InboundEmail.Header hditem= new Messaging.InboundEmail.Header();
	  email.headers=new Messaging.InboundEmail.Header[1];
	  hditem.name='OpportunityId';
	  hditem.value=o.Id;
	  email.headers[0]=hditem;
	  
	  // setup the data for the email
	  email.subject = 'Test Job Applicant';
	  email.fromname = 'FirstName LastName';
	  env.fromAddress = 'someaddress@email.com';
	 
	  // add an attachment
	  Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
	  attachment.body = blob.valueOf('my attachment text');
	  attachment.fileName = 'textfile.txt';
	  attachment.mimeTypeSubType = 'text/plain';
	 
	  email.binaryAttachments =
	    new Messaging.inboundEmail.BinaryAttachment[] { attachment };
	 
	  // call the email service class and test it with the data in the testMethod
	  OpportunityQuoteHandler emailProcess = new OpportunityQuoteHandler();
	  emailProcess.handleInboundEmail(email, env);
	 
	}
}