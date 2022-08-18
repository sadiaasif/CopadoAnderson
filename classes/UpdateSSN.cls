// SCH-0034
public class UpdateSSN {

    public static void processContact(List<Contact> newList){
            
        for(Contact c : newList) {
         
            if (c.UpdateSSN__c == TRUE){
                
                c.SSN_Text__c = c.SSN__c;
                c.UpdateSSN__c = false;
                
            }
            
        }        
		       
    }

}