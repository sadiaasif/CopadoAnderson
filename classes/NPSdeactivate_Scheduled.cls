public class NPSdeactivate_Scheduled implements Schedulable{
    public void execute(SchedulableContext sc)
    {
        NPSdeactivate();
    }
    
    public void NPSdeactivate(){

        List<Contact> contacts = new List<Contact>([Select Id, NPS_Recipient__c FROM Contact WHERE NPS_Recipient__c = TRUE]);
        
        if(!contacts.isEmpty()) {
            for(Contact con : contacts){
                con.NPS_Recipient__c = FALSE;              
            }
            
            update contacts;
        }
        
    }
}