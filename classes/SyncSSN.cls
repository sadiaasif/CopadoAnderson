// SCH-0036
public class SyncSSN {
 
    public static void processContact(List<Contact> newList, Map<Id,Contact> oldMap) {
        
        for(Contact con : newList) {
            
            if(con.SSN__c != oldMap.get(con.Id).SSN__c) {
                
                con.SSN_Text__c = con.SSN__c;
            }
            
            if(con.SSN_Text__c != oldMap.get(con.Id).SSN_Text__c) {
                
                con.SSN__c = con.SSN_Text__c;
            }
        }   
        
    }

}