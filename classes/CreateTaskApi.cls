/**
* A controller class to used to Create Task for BluePrint Software.
* 
* @author Ranjeet
* @version 1.0 - March 8, 2019
*/
@RestResource(urlMapping='/task/v1/')
global class CreateTaskApi {
    
    
/**
* This method is used to create Task for Client object
* 
* @author Ranjeet
* @date March 8, 2019
* @return response on the basis of Task creation
*/
    @HttpPost
    global static map<String,String> createTask(String whatId, string subject, String priority, string description, string status){
        map<String,String> resultMap = new map<String,String>();
        Task t = new Task();
        
        try{
            
            
            t.WhatId = whatId;
            
               // t.OwnerId = '00529000001sEmH'; 
               
            if(whatId != '' && whatId != null){
                Account a = [Select id,Senior_Advisor_Picklist__c from Account where id =: whatId];
                if(a.Senior_Advisor_Picklist__c != null){
                     User u = [SELECT Id, name from User where name =: a.Senior_Advisor_Picklist__c LIMIT 1];
                     t.OwnerId = u.id;
                }else{
                    User u = [SELECT Id, name from User where name Like '%Michael Preseren%' LIMIT 1];
                    if(u.id != null)
                    t.OwnerId = u.id;  
                }
            } 
            
            // t.ActivityDate = date.today();  //date.today()+30; //for due date purpose only
            t.Subject = subject;
            t.priority= priority;
            t.status = status;
            t.description = description;
            insert t;
            resultMap.put('status','SUCCESS');
            resultMap.put('code','201');
            resultMap.put('message','success task is created');
            resultMap.put('clientId',whatId);
        }catch(Exception e){
            resultMap.put('status','ERROR');
            resultMap.put('code','400');
            resultMap.put('clientId',whatId);
            resultMap.put('message','Error '+e.getMessage()); 
        }
        
        return resultMap;
    }
}