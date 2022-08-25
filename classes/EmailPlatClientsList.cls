public  class EmailPlatClientsList {
    @future(callout=true)
    public static void EmailPlatClientsListToexternalUser(List<String> reportNames, String reportType) {
        List<Messaging.EmailFileAttachment> attachments=new List<Messaging.EmailFileAttachment>();
        List<Report>reportList = [SELECT Id,DeveloperName,Name FROM Report where DeveloperName IN : reportNames];
        if(reportList.size()>0){
           for(Report report:reportList){
               String reportId = (String)report.Id;     
               string reportName=(String)report.Name;     
               ApexPages.PageReference objPage = new ApexPages.PageReference('/'+reportId+'?csv=1&isdtp=p1');                    
               Messaging.EmailFileAttachment objMsgEmailAttach = new Messaging.EmailFileAttachment();
               objMsgEmailAttach.setFileName(reportName+'.csv');
               if(!Test.isRunningTest()){
                   objMsgEmailAttach.setBody(objPage.getContent());
               	   objMsgEmailAttach.setContentType('text/csv');
               	   attachments.add(objMsgEmailAttach);
               }
           }
        }
        OrgWideEmailAddress[] owea = [select Id from OrgWideEmailAddress where Address = 'info@andersonadvisors.com'];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setUseSignature(false);
        mail.setOrgWideEmailAddressId(owea.get(0).Id);
        mail.setToAddresses(new List<String>{'fulfillment@lennoxco.com'});
        mail.setCcAddresses(new List<String>{'vvance@andersonadvisors.com','plongworth@andersonadvisors.com','kazim.zaidi@tkxel.com'});
        mail.setSubject('Anderson Business Advisors '+reportType+' Clients');
        mail.setHtmlBody('<br/><br/> Please Review the '+reportType+' Client Details Attached. <br/><br/><br/><br/>');
        if(!Test.isRunningTest()){
        	mail.setFileAttachments(attachments);
        	Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}
