global class sendemail
{

    WebService static double movetonextstage(Id optid)
    {
     integer mo = date.today().month();
       
        integer yr = date.today().year();
        date dt = date.today();
        
      List<Entities__c> ents = new List<Entities__c>();
    
       List<Entities__c> ent = [select id,Renewal_Emailed__c,RecordTypeId,State_Renewal__c,Renewal_Printed__c,Vice_President__c,Treasurer__c,Secretary__c,President__c,Director_1__c,Director_2__c,Director_3__c,Director_4__c, Primary_Client__c, Name, Business_Address__c,Email__c,Primary_Client__r.BillingStreet,Primary_Client__r.BillingCity,Primary_Client__r.BillingState,Primary_Client__r.BillingCountry,Primary_Client__r.BillingPostalCode from Entities__c where (CALENDAR_MONTH(State_Renewal__c) =: mo and CALENDAR_YEAR(State_Renewal__c) =: yr)];
        
        for(Entities__c o: ent)
        {
        string text = '';
     string orgdate = '';
        if(o.State_Renewal__c != null)
            orgdate = + o.State_Renewal__c.month() + '-' + o.State_Renewal__c.day() + '-' + o.State_Renewal__c.year();
    
    Account ac = [select Id, Name, First_Name__c, Last_Name__c, E_Mail__c from Account where Id =: o.Primary_Client__c];
    Integer cnt = [select count() from Subscription__c where Account__c =: ac.Id]; 
         if(cnt >0)
         {
         Subscription__c sc = [Select Id, Name, Opportunity__c, Account__c, Product__c from Subscription__c where Account__c =: ac.Id]; 
         
         Integer cnt2 = [select count() from OpportunityLineItem where OpportunityId = :sc.Opportunity__c limit 1];
         if(cnt2 >0)
         {
             OpportunityLineItem OLI = [Select UnitPrice, Quantity, PricebookEntry.Product2Id, PricebookEntry.Product2.Name From OpportunityLineItem where OpportunityId = :sc.Opportunity__c limit 1];   
            
         }
        
         }
           o.Renewal_Printed__c = dt;
            o.State_Renewal__c = o.State_Renewal__c.addyears(1);
            if(o != null)
            ents.add(o); 
            
            }
            

            if(ents.size() >0)
            update ents;
            return 0;
    }
    
    WebService static double send(Id optid)
    {
    //00XJ0000000MK6j
    string text = '';
    Entities__c o = [select Id,Renewal_Emailed__c, Primary_Client__c, State_Renewal__c, Name from Entities__c where Id =:optid];
     string orgdate = '';
        if(o.State_Renewal__c != null)
            orgdate = + o.State_Renewal__c.month() + '-' + o.State_Renewal__c.day() + '-' + o.State_Renewal__c.year();
    o.Renewal_Emailed__c =date.today();
    Account ac = [select Id, Name, First_Name__c, Last_Name__c, E_Mail__c from Account where Id =: o.Primary_Client__c];
     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      String[] toAddresses = new String[] {ac.E_Mail__c}; 
            mail.setToAddresses(toAddresses); 
            mail.setReplyTo('dlewis@andersonadvisors.com');            
            mail.setSubject('INVOICE FOR FILING ANNUAL LIST');
            mail.setSenderDisplayName('Acorn Corporate Services, INC');
            
            
text +='<html>';
text +='<head>';
text +='<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>';
text +='<meta name="Generator" content="Microsoft Word 14 (filtered)"/>';
text +='<title>ANNUAL FILING WITH THE STATE OF NEVADA</title>';
text +='<style>';
text +='<!--';
text +=' /* Font Definitions */';
text +=' @font-face';
text +='    {font-family:Tahoma;';
text +='    panose-1:2 11 6 4 3 5 4 4 2 4;}';
text +=' /* Style Definitions */';
text +=' p.MsoNormal, li.MsoNormal, div.MsoNormal';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    font-size:12.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='h1';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:center;';
text +='    page-break-after:avoid;';
text +='    font-size:14.0pt;';
text +='    font-family:"Times New Roman","serif";';
text +='    text-decoration:underline;}';
text +='h2';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    page-break-after:avoid;';
text +='    font-size:12.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='h3';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    page-break-after:avoid;';
text +='    font-size:10.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='h4';
text +='    {margin-top:0in;';
text +='    margin-right:.25in;';
text +='    margin-bottom:0in;';
text +='    margin-left:.25in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:justify;';
text +='    page-break-after:avoid;';
text +='    font-size:11.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='p.MsoTitle, li.MsoTitle, div.MsoTitle';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:center;';
text +='    font-size:16.0pt;';
text +='    font-family:"Times New Roman","serif";';
text +='    font-weight:bold;}';
text +='p.MsoBodyText, li.MsoBodyText, div.MsoBodyText';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:justify;';
text +='    font-size:11.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='p.MsoBodyText2, li.MsoBodyText2, div.MsoBodyText2';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    font-size:12.0pt;';
text +='    font-family:"Times New Roman","serif";';
text +='    font-weight:bold;';
text +='    font-style:italic;}';
text +='p.MsoBodyText3, li.MsoBodyText3, div.MsoBodyText3';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    font-size:10.0pt;';
text +='    font-family:"Times New Roman","serif";';
text +='    font-weight:bold;}';
text +='p.MsoBlockText, li.MsoBlockText, div.MsoBlockText';
text +='    {margin-top:0in;';
text +='    margin-right:.25in;';
text +='    margin-bottom:0in;';
text +='    margin-left:.25in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:justify;';
text +='    font-size:11.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='a:link, span.MsoHyperlink';
text +='    {color:blue;';
text +='    text-decoration:underline;}';
text +='a:visited, span.MsoHyperlinkFollowed';
text +='    {color:purple;';
text +='    text-decoration:underline;}';
text +='p.MsoAcetate, li.MsoAcetate, div.MsoAcetate';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    font-size:8.0pt;';
text +='    font-family:"Tahoma","sans-serif";}';
text +='@page WordSection1';
text +='    {size:8.5in 11.0in;';
text +='    margin:.4in .5in .5in .5in;}';
text +='div.WordSection1';
text +='    {page:WordSection1;}';
text +=' /* List Definitions */';
text +=' ol';
text +='    {margin-bottom:0in;}';
text +='ul';
text +='    {margin-bottom:0in;}';
text +='-->';
text +='</style>';

text +='</head>';

text +='<body lang="EN-US" link="blue" vlink="purple">';

text +='<div class="WordSection1">';

text +='<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"';
text +=' style=\'\'margin-left:.45in;border-collapse:collapse\'\'>';
text +=' <tr>';
text +='  <td width="366" valign="top" style=\'\'width:274.5pt;padding:0in 5.4pt 0in 5.4pt\'\'>';
text +='  <p class="MsoNormal" style=\'\'margin-top:0.0pt\'\'><img width="47" height="56"';
text +='  src="https://cs10.salesforce.com/resource/1349572694000/Acornimage"';
text +='  align="left" hspace="12"/><B>';
text +='  <span style=\'\'font-size:10.0pt\'\'>ACORN CORPORATE SERVICES, INC.<br />';
text +='                                 3225 McLeod Drive #110<br />     ';                   
text +='                                 Las Vegas, NV 89121<br />';
text +='  </span></B></p>';
text +='  </td>';
text +='  <td width="366" valign="top" style=\'\'width:274.5pt;padding:0in 5.4pt 0in 5.4pt\'\'>';
text +='  <p class="MsoNormal" align="right" style=\'\'margin-top:0.0pt\'\'><b><span';
text +='  style=\'\'font-size:10.0pt\'\'>TOLL FREE: 1-800-266-1296<br /> ';
text +='                           FAX: 702-664-0546<br /> ';
text +='                           www.acorncorp.com<br /> ';
text +='  </span></b></p>';
 text +=' ';
text +='  </td>';
text +=' </tr>';
text +='</table>';

text +='<p class="MsoNormal"><span style=\'\'font-size:4.0pt\'\'> </span></p>';

text +='<p class="MsoNormal"><b><span style=\'\'font-size:2.0pt\'\'> </span></b></p>';

text +='<p class="MsoNormal" align="center" style=\'\'text-align:center\'\'><b><span';
text +='style=\'\'font-size:14.0pt\'\'>INVOICE FOR FILING ANNUAL LIST</span></b></p>';

text +='<p class="MsoNormal"><span style=\'\'font-size:11.0pt\'\'>RE: </span><span style=\'\'font-size:11.0pt\'\'>';
text += o.Name;
text +='</span></p>';

text +='<p class="MsoNormal"><span style=\'\'font-size:10.0pt\'\'> </span></p>';

text +='<p class="MsoNormal"><span style=\'\'font-size:10.0pt\'\'>Dear Client:</span></p>';

text +='<p class="MsoNormal" style=\'\'text-align:justify\'\'><span style=\'\'font-size:10.0pt\'\'> </span></p>';

text +='<p class="MsoNormal" style=\'\'text-align:justify\'\'><span style=\'\'font-size:10.0pt\'\'>It ';
text +='is time to renew your Annual Filing due by </span><b><span';
text +='style=\'\'font-size:11.0pt\'\'></span></b><b><span style=\'\'font-size:11.0pt\'\'>';
text += orgdate +'.';
text +='</span></b><span style=\'\'font-size:10.0pt\'\'> A delay in submitting this form back';
text +=' to our office will result in a <b>$175.00 penalty</b> imposed by the Secretary';
text +=' of State.  For faster service you can now file your entity online if nothing';
text +=' has changed.</span><span style=\'\'font-size:11.0pt\'\'></span><span';
text +=' style=\'\'font-size:10.0pt\'\'> State filing fees do not include renewal of the';
text +=' B.O.S.S. corporate headquarter or support services.  </span></p>';

text +='<p class="MsoNormal"><b><span style=\'\'font-size:10.0pt\'\'> </span></b></p>';

text +='<p class="MsoNormal"><b><span style=\'\'font-size:10.0pt\'\'>You may pay your invoice';
text +=' online using this link ____________________________.</span></b></p>';

text +='<p class="MsoNormal"><b><span style=\'\'font-size:10.0pt\'\'> </span></b></p>';

text +='<p class="MsoNormal"><span style=\'\'font-size:10.0pt\'\'>Call our office at';
text +=' 1-800-266-1296 if you would like to submit payment over the phone or if you';
text +=' have any questions about this invoice.</span></p>';



text +='<p class="MsoNormal"><span style=\'\'font-size:10.0pt\'\'>Thank you,<b/><br /> <br /> ';


 text +='                                                   Dorothy Bunker, President<br />'; 
 text +='                                                   Acorn Corporate Services';
text +='</span></p>';

text +='</div>';

text +='</body>';

text +='</html>';
              
       mail.htmlBody =text;
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        update o;
        return 0;
    }
    
     WebService static double sendall(string optid)
    {
        integer mo = date.today().month();
       
        integer yr = date.today().year();
        date dt = date.today();
        
        
    
       List<Entities__c> ent = [select id,Renewal_Emailed__c, RecordTypeId,State_Renewal__c,Renewal_Printed__c,Vice_President__c,Treasurer__c,Secretary__c,President__c,Director_1__c,Director_2__c,Director_3__c,Director_4__c, Primary_Client__c, Name, Business_Address__c,Email__c,Primary_Client__r.BillingStreet,Primary_Client__r.BillingCity,Primary_Client__r.BillingState,Primary_Client__r.BillingCountry,Primary_Client__r.BillingPostalCode from Entities__c where (CALENDAR_MONTH(State_Renewal__c) =: mo and CALENDAR_YEAR(State_Renewal__c) =: yr)];
        
        for(Entities__c o: ent)
        {
        string text = '';
     string orgdate = '';
        if(o.State_Renewal__c != null)
            orgdate = + o.State_Renewal__c.month() + '-' + o.State_Renewal__c.day() + '-' + o.State_Renewal__c.year();
    o.Renewal_Emailed__c = date.today();
    Account ac = [select Id, Name, First_Name__c, Last_Name__c, E_Mail__c from Account where Id =: o.Primary_Client__c];
      
    
     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      String[] toAddresses = new String[] {ac.E_Mail__c}; 
            mail.setToAddresses(toAddresses); 
             mail.setReplyTo('dlewis@andersonadvisors.com');            
            mail.setSubject('INVOICE FOR FILING ANNUAL LIST');
            mail.setSenderDisplayName('Acorn Corporate Services, INC');
            
            
text +='<html>';
text +='<head>';
text +='<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>';
text +='<meta name="Generator" content="Microsoft Word 14 (filtered)"/>';
text +='<title>ANNUAL FILING WITH THE STATE OF NEVADA</title>';
text +='<style>';
text +='<!--';
text +=' /* Font Definitions */';
text +=' @font-face';
text +='    {font-family:Tahoma;';
text +='    panose-1:2 11 6 4 3 5 4 4 2 4;}';
text +=' /* Style Definitions */';
text +=' p.MsoNormal, li.MsoNormal, div.MsoNormal';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    font-size:12.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='h1';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:center;';
text +='    page-break-after:avoid;';
text +='    font-size:14.0pt;';
text +='    font-family:"Times New Roman","serif";';
text +='    text-decoration:underline;}';
text +='h2';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    page-break-after:avoid;';
text +='    font-size:12.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='h3';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    page-break-after:avoid;';
text +='    font-size:10.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='h4';
text +='    {margin-top:0in;';
text +='    margin-right:.25in;';
text +='    margin-bottom:0in;';
text +='    margin-left:.25in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:justify;';
text +='    page-break-after:avoid;';
text +='    font-size:11.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='p.MsoTitle, li.MsoTitle, div.MsoTitle';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:center;';
text +='    font-size:16.0pt;';
text +='    font-family:"Times New Roman","serif";';
text +='    font-weight:bold;}';
text +='p.MsoBodyText, li.MsoBodyText, div.MsoBodyText';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:justify;';
text +='    font-size:11.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='p.MsoBodyText2, li.MsoBodyText2, div.MsoBodyText2';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    font-size:12.0pt;';
text +='    font-family:"Times New Roman","serif";';
text +='    font-weight:bold;';
text +='    font-style:italic;}';
text +='p.MsoBodyText3, li.MsoBodyText3, div.MsoBodyText3';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    font-size:10.0pt;';
text +='    font-family:"Times New Roman","serif";';
text +='    font-weight:bold;}';
text +='p.MsoBlockText, li.MsoBlockText, div.MsoBlockText';
text +='    {margin-top:0in;';
text +='    margin-right:.25in;';
text +='    margin-bottom:0in;';
text +='    margin-left:.25in;';
text +='    margin-bottom:.0001pt;';
text +='    text-align:justify;';
text +='    font-size:11.0pt;';
text +='    font-family:"Times New Roman","serif";}';
text +='a:link, span.MsoHyperlink';
text +='    {color:blue;';
text +='    text-decoration:underline;}';
text +='a:visited, span.MsoHyperlinkFollowed';
text +='    {color:purple;';
text +='    text-decoration:underline;}';
text +='p.MsoAcetate, li.MsoAcetate, div.MsoAcetate';
text +='    {margin:0in;';
text +='    margin-bottom:.0001pt;';
text +='    font-size:8.0pt;';
text +='    font-family:"Tahoma","sans-serif";}';
text +='@page WordSection1';
text +='    {size:8.5in 11.0in;';
text +='    margin:.4in .5in .5in .5in;}';
text +='div.WordSection1';
text +='    {page:WordSection1;}';
text +=' /* List Definitions */';
text +=' ol';
text +='    {margin-bottom:0in;}';
text +='ul';
text +='    {margin-bottom:0in;}';
text +='-->';
text +='</style>';

text +='</head>';

text +='<body lang="EN-US" link="blue" vlink="purple">';

text +='<div class="WordSection1">';

text +='<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"';
text +=' style=\'\'margin-left:.45in;border-collapse:collapse\'\'>';
text +=' <tr>';
text +='  <td width="366" valign="top" style=\'\'width:274.5pt;padding:0in 5.4pt 0in 5.4pt\'\'>';
text +='  <p class="MsoNormal" style=\'\'margin-top:0.0pt\'\'><img width="47" height="56"';
text +='  src="https://cs10.salesforce.com/resource/1349572694000/Acornimage"';
text +='  align="left" hspace="12"/><B>';
text +='  <span style=\'\'font-size:10.0pt\'\'>ACORN CORPORATE SERVICES, INC.<br />';
text +='                                 3225 McLeod Drive #110<br />     ';                   
text +='                                 Las Vegas, NV 89121<br />';
text +='  </span></B></p>';
text +='  </td>';
text +='  <td width="366" valign="top" style=\'\'width:274.5pt;padding:0in 5.4pt 0in 5.4pt\'\'>';
text +='  <p class="MsoNormal" align="right" style=\'\'margin-top:0.0pt\'\'><b><span';
text +='  style=\'\'font-size:10.0pt\'\'>TOLL FREE: 1-800-266-1296<br /> ';
text +='                           FAX: 702-664-0546<br /> ';
text +='                           www.acorncorp.com<br /> ';
text +='  </span></b></p>';
 text +=' ';
text +='  </td>';
text +=' </tr>';
text +='</table>';

text +='<p class="MsoNormal"><span style=\'\'font-size:4.0pt\'\'> </span></p>';

text +='<p class="MsoNormal"><b><span style=\'\'font-size:2.0pt\'\'> </span></b></p>';

text +='<p class="MsoNormal" align="center" style=\'\'text-align:center\'\'><b><span';
text +='style=\'\'font-size:14.0pt\'\'>INVOICE FOR FILING ANNUAL LIST</span></b></p>';

text +='<p class="MsoNormal"><span style=\'\'font-size:11.0pt\'\'>RE: </span><span style=\'\'font-size:11.0pt\'\'>';
text += o.Name;
text +='</span></p>';

text +='<p class="MsoNormal"><span style=\'\'font-size:10.0pt\'\'> </span></p>';

text +='<p class="MsoNormal"><span style=\'\'font-size:10.0pt\'\'>Dear Client:</span></p>';

text +='<p class="MsoNormal" style=\'\'text-align:justify\'\'><span style=\'\'font-size:10.0pt\'\'> </span></p>';

text +='<p class="MsoNormal" style=\'\'text-align:justify\'\'><span style=\'\'font-size:10.0pt\'\'>It ';
text +='is time to renew your Annual Filing due by </span><b><span';
text +='style=\'\'font-size:11.0pt\'\'></span></b><b><span style=\'\'font-size:11.0pt\'\'>';
text += orgdate +'.';
text +='</span></b><span style=\'\'font-size:10.0pt\'\'> A delay in submitting this form back';
text +=' to our office will result in a <b>$175.00 penalty</b> imposed by the Secretary';
text +=' of State.  For faster service you can now file your entity online if nothing';
text +=' has changed.</span><span style=\'\'font-size:11.0pt\'\'></span><span';
text +=' style=\'\'font-size:10.0pt\'\'> State filing fees do not include renewal of the';
text +=' B.O.S.S. corporate headquarter or support services.  </span></p>';

text +='<p class="MsoNormal"><b><span style=\'\'font-size:10.0pt\'\'> </span></b></p>';

text +='<p class="MsoNormal"><b><span style=\'\'font-size:10.0pt\'\'>You may pay your invoice';
text +=' online using this link ____________________________.</span></b></p>';

text +='<p class="MsoNormal"><b><span style=\'\'font-size:10.0pt\'\'> </span></b></p>';

text +='<p class="MsoNormal"><span style=\'\'font-size:10.0pt\'\'>Call our office at';
text +=' 1-800-266-1296 if you would like to submit payment over the phone or if you';
text +=' have any questions about this invoice.</span></p>';



text +='<p class="MsoNormal"><span style=\'\'font-size:10.0pt\'\'>Thank you,<b/><br /> <br /> ';


 text +='                                                   Dorothy Bunker, President<br />'; 
 text +='                                                   Acorn Corporate Services';
text +='</span></p>';

text +='</div>';

text +='</body>';

text +='</html>';
              
       mail.htmlBody =text;
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        update o;
        }
        
        return 0;
    }
}