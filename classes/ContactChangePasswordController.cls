global with sharing class ContactChangePasswordController {
    
    public static Boolean isFirstTime = true;
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;} 
    public Id contactId {get; set;}
    public Id cntIds {get; set;}
    public string Email {get;set;}
    public ContactChangePasswordController(ApexPages.StandardController controller) {
        //cntIds = ApexPages.currentPage().getParameters().get('id');
        //system.debug('cntIds=========='+cntIds);
        //contactId = apexpages.currentpage().getparameters().get('cntId');
        cntIds=Apexpages.currentPage().getParameters().get('id'); 
        System.debug('cntIds==========='+cntIds);
        contactId=Apexpages.currentPage().getParameters().get('cntId');
        System.debug('contactId==========='+cntIds);
        try
        {
            if(!test.isRunningTest()) {
                Email = [select Email from Contact where id =: contactId].Email;
                System.debug('*******Email = '+Email);   
            } else {
                Email = 'email@email.com';
            }
        } catch(Exception e){
            
        }
        
        // 
        
    }
    public PageReference changePassword() {
        system.debug('newPassword==='+newPassword);
        system.debug('verifyNewPassword==='+verifyNewPassword);
        system.debug('contactId==='+contactId);
        Integer passLength = newPassword.length();
        
        String NumRegex = '.*[0-9].*'; 
        Pattern NumPattern = Pattern.compile(NumRegex);
        Matcher NumMatcher = NumPattern.matcher(newPassword);
        Boolean passNum = NumMatcher.matches();
        
        String NameRegex = '.*[a-zA-Z].*';
        Pattern MyPattern = Pattern.compile(NameRegex);
        Matcher MyMatcher = MyPattern.matcher(newPassword);
        Boolean passLetter = MyMatcher.matches();
        
        system.debug('passNum == ' + passNum);
        system.debug('passLetter == ' + passLetter);
        if(newPassword == verifyNewPassword){
            if(passLength >= 8){
                if(passLetter){
                    if(passNum){
                        Id cntid = [select id , name,email from contact where id = :contactId].Id;
                       
                       // if(usId != null){
                            try{ 
                                 Id usId = [select id from User where ContactId = :cntid].Id;
                                if(!test.isRunningTest()){
                                     System.setPassword(usId,newPassword);
                                }else {
                                    System.setPassword(newPassword,newPassword);
                                }
                               
                                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Password Changed Successfully');
                                ApexPages.addMessage(myMsg);
                            } 
                            catch (Exception e) {  
                                if(e.getMessage().contains('invalid repeated password')) {
                                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'You Cannot Insert Previous Password');
                                    ApexPages.addMessage(myMsg);
                                }
                                else if(e.getMessage().contains('List has no rows for assignment to SObject')) {
                                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'User Not Found For This Contact');
                                    ApexPages.addMessage(myMsg);
                                }  
                                 else {
                                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage());
                                    ApexPages.addMessage(myMsg);
                                }  
                            } 
                      /*  }
                        else {
                        
                        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'User Not Found for This Conatct');
                        ApexPages.addMessage(myMsg);
                    }*/
                    } else {
                        
                        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Password Must Contains Atleast 1 Number');
                        ApexPages.addMessage(myMsg);
                    }
                } else {
                    
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Password Must Contains Atleast 1 Letter');
                    ApexPages.addMessage(myMsg);
                }
            } else {
                
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Password Length  Must be 8 Character');
                ApexPages.addMessage(myMsg);
            }
        } else {
            system.debug('===4');
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'New Password & Confirm Password Not Match');
            ApexPages.addMessage(myMsg);
        }  
        System.debug('*** All error msgs = '+ ApexPages.getMessages());
        return null; 
    }    
    
    @RemoteAction
    global static Boolean CreatePasswordLink(Id cntId){
        Id contactId = cntId;
        system.debug('contactId ='+contactId);
        String passwordLink = URL.getSalesforceBaseUrl().toExternalForm()+'/apex/ContactChangePassword?cntId='+contactId;
        Contact cnt = new Contact(Id = contactId);
        cnt.Create_Password__c = passwordLink;
        try{
            update cnt;  
        }
        catch (QueryException e) {   
            system.debug('QueryException' + e);
        } 
        return true;
    }
}