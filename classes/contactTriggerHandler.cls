// Test Class: UpdateSSNTest
// Test Class: testContactTrigger
public class contactTriggerHandler {
    
    public static void handleTrigger(List<Contact> newContacts, List<Contact> oldContacts, Map<Id, Contact> newMap, Map<Id, Contact> oldMap, TriggerOperation triggerEvent){
         switch on triggerEvent {

            
            when BEFORE_UPDATE {
                if(checkRecursive.runOnce()) {
                    // SCH-0034
                    UpdateSSN.processContact(newContacts);
                    
                    // SCH-0036
                    SyncSSN.processContact(newContacts, oldMap);
                }
            }
             
     
            when BEFORE_DELETE {
                for(Contact con : oldContacts) {
                    
                    if(!String.isBlank(oldMap.get(con.Id).Platinum_Wordpress_Id__c)) {
                        
                        con.addError('You cannot delete this contact because it is associated with a Platinum user.');
                    }
                }
            }
            
            when else {
                
            }
        }
    }
}