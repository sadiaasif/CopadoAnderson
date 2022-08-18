public class entProcessCongaCmpController {
    
        @AuraEnabled
    	public static Conga__c prepareEntProcConga(Id entityId){
        
        Entities__c currentEnt = [SELECT Id, Name FROM Entities__c WHERE Id = :entityId];
        List<Conga__c> currentCongas = [SELECT Id FROM Conga__c WHERE Entity__c = :entityId LIMIT 1];
        List<Conga__c> congaToSend = new List<Conga__c>();
        
        if(currentCongas.size() == 1) {
            
            congaToSend.add(currentCongas[0]);            
            
        }
        
        if(currentCongas.size() != 1) {
            
            Conga__c newConga = new Conga__c();
            newConga.Name = 'Conga Merge for ' + currentEnt.Name;
            newConga.Entity__c = currentEnt.Id;
            insert newConga;
            congaToSend.add(newConga);
            
        }
        
        
        return congaToSend[0];
    }
    

}