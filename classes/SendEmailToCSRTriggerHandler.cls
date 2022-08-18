public class SendEmailToCSRTriggerHandler {
    
    public static boolean isRecurive = true;
    
    public static void getProcess(List<Credit_Card_Detail__c> newItem){
        system.debug('newItem == ' + newItem);
        if(isRecurive){
            List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
            List<Account> accLst =  new List<Account>();
            List<Task> tasks = new List<Task>(); 
            map<Id,Credit_Card_Detail__c> accMap = new map<Id,Credit_Card_Detail__c>();
            map<Id,Decimal> mailMap = new map<Id,Decimal>();
            for(Credit_Card_Detail__c cc : newItem){  
                system.debug('Platinum_Subscription_Card__c == ' + cc.Platinum_Subscription_Card__c);
                accMap.put(cc.Account__c, cc);  
                system.debug('Mail_Check__c == ' + cc.Mail_Check__c);
                mailMap.put(cc.id, cc.Mail_Check__c);
            }
            map<String,Id> userMap = new map<String,Id>();
            for(User u :[SELECT Id, name from User]){
                userMap.put(u.name,u.id);
            }
            //User u = [SELECT Id, name from User where name Like '%Michael Preseren%' LIMIT 1];
            for(Account acc : [SELECT Id, Name, Assigned_CSR__c, LastName, FirstName, CSR_Email__c, First_Name__c, Last_Name__c FROM Account where id IN :accMap.keySet()] ){
                Credit_Card_Detail__c cardNumber = accMap.get(acc.Id);
                String evt = '';
                Integer mailVal = integer.valueOf(mailMap.get(cardNumber.id));
                system.debug('Mail Val = ' + mailVal);
                
                if(mailVal == 1){
                    
                    if(Trigger.isInsert) {
                        evt = 'inserted';
                    } 
                    if(Trigger.isUpdate) {
                        evt = 'updated';
                    }
                    
                    Task tsk = new Task();
                    tsk.Subject = 'Card '+ evt ;
                    tsk.whatID = acc.Id;
                    
                    if(acc.Assigned_CSR__c != null && userMap.get(acc.Assigned_CSR__c) != null){    
                        tsk.OwnerId = userMap.get(acc.Assigned_CSR__c);
                    }else{            
                        tsk.OwnerId = userMap.get('Michael Preseren');  
                    }
                    
                    Integer charLength = cardNumber.Card_Number__c.length();
                    
                    String res = cardNumber.Card_Number__c.right(charLength - (charLength-4));
                    String regExp = '[0-9]';
                    String dummyCsrName = ''; 
                    if(acc.Assigned_CSR__c != null && userMap.get(acc.Assigned_CSR__c) != null){ 
                        dummyCsrName = acc.Assigned_CSR__c; 
                    }else{
                        dummyCsrName = ''; 
                    }
                    
                    string dummyCardNo = cardNumber.Card_Number__c.replaceAll(regExp, '*').substring(0,charLength-4);
                    // String accountLinkUrl = 'https://andersonadvisors--comm--c.cs19.visual.force.com/'+acc.Id; // for sandbox
                    String accountLinkUrl = 'https://na48.salesforce.com/'+acc.Id; // for production 
                    String accountName = '<a href='+accountLinkUrl+'>'+acc.First_Name__c+' '+ acc.Last_Name__c +'</a></br>';
                    tsk.Description = 'Hi '+ dummyCsrName +', Client with name '+acc.First_Name__c+' '+ acc.Last_Name__c +' with card number '+ dummyCardNo +res +' has '+ evt +' their platinum payment card in community portal.'; 
                    tasks.add(tsk);
                    system.debug('Platinum_Subscription_Card__c = ' + cardNumber.Platinum_Subscription_Card__c);
                    if(cardNumber.Platinum_Subscription_Card__c == true){ 
                        if(acc.CSR_Email__c != null){
                            
                            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();            
                            //  list of people who should get the email            
                            List<String> sendTo = new List<String>();
                            sendTo.add(acc.CSR_Email__c);
                            mail.setToAddresses(sendTo);            
                            // Set email is sent from
                            mail.setReplyTo('noreply@andersonadvisors.com');
                            mail.setSenderDisplayName('Anderson Advisors');            
                            // Set email contents
                            mail.setSubject('Client Platinum Payment Card');
                            //String body = 'Dear ' + usr.FirstName +' '+ usr.LastName + ', ';
                            String body = 'Hi '+ dummyCsrName +', Client with name '+ accountName +' with card number '+ dummyCardNo +res +' has '+ evt +' their platinum payment card in community portal.';                 
                            mail.setHtmlBody(body);        
                            // Add your email to the master list
                            mails.add(mail);                
                        }
                    }
                }
                
                if(cardNumber.Platinum_Subscription_Card__c == true){
                   changeCardDetails(cardNumber.id,cardNumber.Account__c);
                }
                
            }
                //Shobi- Commenting based on Savannah's request Case : 00088853:Card Insterted/Updated Tasks
            /*if(tasks.size() > 0) {
            
              //  insert tasks;
                if(mails.size() > 0){
                    // Send all emails in the master list
                    if(!test.isRunningTest()){
                    //    Messaging.sendEmail(mails);
                    }
                    system.debug('=== Mail Sent ===');
                }
            }*/
            isRecurive = false;
        }
    }
    
    /**
* This method is used to udpate Mail Check Field on credit card object.
* 
* @author Prateeks
* @date Apr 24, 2019
*/
    public static void changeCardDetails(Id cardId, Id accId) {
       
            List<Credit_Card_Detail__c> CardListToUpd = new List<Credit_Card_Detail__c>();
            for (Credit_Card_Detail__c cardChk : [SELECT Id, Account__c, Platinum_Subscription_Card__c FROM Credit_Card_Detail__c where id != : cardId and Account__c = :accId and Platinum_Subscription_Card__c = true]){
                cardChk.Platinum_Subscription_Card__c = false;
                CardListToUpd.add(cardChk);
            }
            if(CardListToUpd.size()>0){
                update CardListToUpd;
                
            }
       
    }
    
}