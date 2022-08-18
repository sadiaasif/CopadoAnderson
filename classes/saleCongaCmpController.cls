public class saleCongaCmpController {
    
    @AuraEnabled
    public static Sales_Conga_Merge__c prepareSalesConga(Id saleId){
        
        Opportunity currentOpp = [SELECT Id, Name FROM Opportunity WHERE Id = :saleId];
        List<Sales_Conga_Merge__c> currentCongas = [SELECT Id FROM Sales_Conga_Merge__c WHERE Opportunity_Invoice__c = :saleId LIMIT 1];
        List<Sales_Conga_Merge__c> congaToSend = new List<Sales_Conga_Merge__c>();
        
        if(currentCongas.size() == 1) {
            
            congaToSend.add(currentCongas[0]);            
            
        }
        
        if(currentCongas.size() != 1) {
            
            Sales_Conga_Merge__c newConga = new Sales_Conga_Merge__c();
            newConga.Name = 'Conga Merge for ' + currentOpp.Name;
            newConga.Opportunity_Invoice__c = currentOpp.Id;
            insert newConga;
            congaToSend.add(newConga);
            
        }
        
        
        return congaToSend[0];
    }
    
    
}