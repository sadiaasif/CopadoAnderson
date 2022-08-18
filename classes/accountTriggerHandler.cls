// Test class: TestAccountHandler

public with sharing class accountTriggerHandler {
    
    public static boolean alreadyProcessed = false;
    public static boolean firstRun = false;  
    
    // This code logs a user's name and notes into the important notes field on the account page.
    
    public void importantNotesInsert(List<Account> newRecordsList, List<Account> oldRecordsList, Map<Id, Account> newMap, Map<Id, Account> oldMap, String eventType, String triggerType){
        
        if (alreadyProcessed == true) return;
        alreadyProcessed = true;
        
        String userName=UserInfo.getName();
        TimeZone userTime=UserInfo.getTimeZone();

        
        if(eventType=='Before' && triggerType=='Insert') {
            for(Account acc : newRecordsList) {
                if(acc.Important_Notes__c!=Null){
                    
                    acc.Important_Notes__c=acc.Important_Notes__c + '<br/>' + '-Name ' + userName + '<br/>' + '-Time ' +  System.now().format() + '<br/>';
                    
                }
            }
        }
    }

    public void importantNotesUpdate(List<Account> newRecordsList, List<Account> oldRecordsList, Map<Id, Account> newMap, Map<Id, Account> oldMap, String eventType, String triggerType){
        
        if (firstRun == true) return;
        firstRun = true;
        
        String userName=UserInfo.getName();
        TimeZone userTime=UserInfo.getTimeZone();
        
        if(eventType=='Before' && triggerType=='Update') {
            for(Account acc : newRecordsList) {
                Account oldAccount=(Account)Trigger.oldMap.get(acc.Id);
                
                if(oldAccount.Important_Notes__c==Null && acc.Important_Notes__c!=Null){
                    acc.Important_Notes__c=acc.Important_Notes__c + '<br/>' + '-Name ' + userName + '<br/>' + '-Time ' +  System.now().format() + '<br/>';
                  
                }
                else if(oldAccount.Important_Notes__c!=Null && acc.Important_Notes__c!=Null) {
                
                    if(oldAccount.Important_Notes__c.remove('<br>')!=acc.Important_Notes__c.remove('<br>')){
                        acc.Important_Notes__c=acc.Important_Notes__c + '<br/>' + '-Name ' + userName + '<br/>' + '-Time ' +  System.now().format() + '<br/>';
                      
                        
                    }
                }
            }
        }
    }
    
}