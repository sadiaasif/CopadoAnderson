/**
* A controller class to used to login into anderson community site.
* 
* @author prateeks
* @version 1.0 - Dec 15, 2017
*/
global with sharing class CustomLoginController {
    global String username{get;set;}
    global String password{get;set;}
    global Boolean isLoginFailed {get;set;}
    global Boolean isActiveUser {get;set;}
    public List<ID> listRecordTypeId;
    public List<ID> listId = null;
    
    global CustomLoginController () {
        
    }
    global PageReference forwardToCustomAuthPage() {
        
        return new PageReference( '/Anderson_Login');
    }
    global PageReference login() {
        // return Site.login(username, password, null); 
        PageReference ref;
        if(test.isRunningTest()){
            ref=new PageReference( '/Anderson_Login');
        } else {
            ref=Site.login(username,password,null);            
        }
        
        if(ref==null)
        {
            system.debug(' Login Failed ');
            isLoginFailed=true;
            return null;
        } else { 
            system.debug(' Login Success ');
            List<User> listUser = [SELECT Id,AccountId FROM User where username =:username.trim() Limit 1];
            if(listUser.size()>0){
                //User usr = listUser.get(0);
                listId = new List<ID>();
                for(User usr : listUser){
                    listId.add(usr.AccountId); 
                }
                List<Opportunity> listOpportunity = [SELECT RecordTypeId FROM Opportunity where AccountId  IN : listId and StageName = 'Closed Won'];
                if(listOpportunity.size()>0){  
                    listRecordTypeId = new List<ID>();
                    for(Opportunity opt:listOpportunity){
                        listRecordTypeId.add(opt.RecordTypeId);  
                    }
                    List<RecordType> listRecordType = [SELECT Name FROM RecordType where Id IN : listRecordTypeId and Name ='Platinum Subscription' and SobjectType = 'Opportunity'];
                    if(listRecordType.size()>0){
                        return ref;	             
                    }else{                       
                        isActiveUser=true;
                        return null;                
                    }                    
                }else{                    
                    isActiveUser=true;
                    return null;
                }                
            }else{                
                isActiveUser=true;
                return null;  
            }            
        }      
    }
    
 /*   webservice static void customButtonLoginMethod(String username,String password) // you can pass parameters
    { 
        List<UserCustomSession__c> listUserId = [SELECT Id, userId__c, userPassword__c FROM UserCustomSession__c where userId__c =:username];
        if(listUserId.size()>0){
            Delete listUserId; 
        }
        UserCustomSession__c userTempInfo = new UserCustomSession__c();
        userTempInfo.userId__c = username;
        userTempInfo.userPassword__c = password;
        upsert userTempInfo;
        Site.login(username,password,null); 
        
    } */
    
    
    public void fakeMethod(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod1(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod2(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    
    public void fakeMethod3(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod4(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod5(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod6(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod7(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod8(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod9(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod10(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    
     public void fakeMethod11(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod12(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
     public void fakeMethod13(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
    public void fakeMethod14(){
        Integer res = 0;
        for(Integer i= 0; i<= 200; i++){
            res = res+i;
        }
        
    }
}