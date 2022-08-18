public class PlatinumClientsWithoutAddress {
    @future(callout=true)
    public static void PlatinumClientsWithoutAddressSendEmail() {
        List<Messaging.EmailFileAttachment> attachments=new List<Messaging.EmailFileAttachment>();
        List<Report>reportList = [SELECT Id,DeveloperName,Name FROM Report where DeveloperName ='New_PlatinumLast_week_wo_address_2qa'];
        if(reportList.size()>0){
           for(Report report:reportList){
               String reportId = (String)report.Id;     
               string reportName=(String)report.Name;     
               ApexPages.PageReference objPage = new ApexPages.PageReference('/'+reportId+'?csv=1&isdtp=p1');                    
               Messaging.EmailFileAttachment objMsgEmailAttach = new Messaging.EmailFileAttachment();
               objMsgEmailAttach.setFileName(reportName+'.csv');
               if(!Test.isRunningTest())
                   objMsgEmailAttach.setBody(objPage.getContent());
               objMsgEmailAttach.setContentType('text/csv');
               attachments.add(objMsgEmailAttach);
           }
        }  
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setUseSignature(false);
        mail.setToAddresses(new List<String>{'vvance@andersonadvisors.com'});
        mail.setCcAddresses(new List<String>{'plongworth@andersonadvisors.com','srajagopalan@andersonadvisors.com'});
        mail.setSubject('Anderson Business Advisors Platinum Clients withoutshiping address');
        mail.setHtmlBody('<br/><br/>Please Review the Platinum Clients Details Attached and update the address.<br/><br/><br/><br/>');
        if(!Test.isRunningTest())
        mail.setFileAttachments(attachments);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}