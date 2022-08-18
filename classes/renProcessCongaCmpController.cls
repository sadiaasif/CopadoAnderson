public class renProcessCongaCmpController {
    
    @AuraEnabled
    public static Renewal_Processing_Conga_Docs__c prepareRenProcConga(Id entityId){
        
        Entities__c currentEnt = [SELECT Id, Name FROM Entities__c WHERE Id = :entityId];
        List<Renewal_Processing_Conga_Docs__c> currentCongas = [SELECT Id FROM Renewal_Processing_Conga_Docs__c WHERE Entity_Name__c = :entityId LIMIT 1];
        List<Renewal_Processing_Conga_Docs__c> congaToSend = new List<Renewal_Processing_Conga_Docs__c>();
        
        if(currentCongas.size() == 1) {
            
            congaToSend.add(currentCongas[0]);            
            
        }
        
        if(currentCongas.size() != 1) {
            
            Renewal_Processing_Conga_Docs__c newConga = new Renewal_Processing_Conga_Docs__c();
            newConga.Name = 'Conga Merge for ' + currentEnt.Name;
            newConga.Entity_Name__c = currentEnt.Id;
            insert newConga;
            congaToSend.add(newConga);
            
        }
        
        
        return congaToSend[0];
    }
    
}