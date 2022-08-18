public class newClientStatement {
    
    public static void makeItWork(List<Client_Statement__c> newList) {

        Id clientStatement = [SELECT Id FROM RecordType WHERE DeveloperName = 'Client_Statement'].id;
        
        for (Client_Statement__c cs : newList) {
            


            if (cs.All_Entities__c != null ) {
             
           	List<String> allEntities = cs.All_Entities__c.split(',');
                system.debug(allEntities.size());
           		
                if(allEntities.size() >= 1){
                    cs.Entity_1__c = allEntities[0].removeStart(' ');}
                if(allEntities.size() >= 2){
                	cs.Entity_2__c = allEntities[1].removeStart(' ');}
                if(allEntities.size() >= 3){
                    cs.Entity_3__c = allEntities[2].removeStart(' ');}
                if(allEntities.size() >= 4){    
                    cs.Entity_4__c = allEntities[3].removeStart(' ');}
                if(allEntities.size() >= 5){        
                    cs.Entity_5__c = allEntities[4].removeStart(' ');}
                if(allEntities.size() >= 6){        
                    cs.Entity_6__c = allEntities[5].removeStart(' ');}
                if(allEntities.size() >= 7){        
                    cs.Entity_7__c = allEntities[6].removeStart(' ');}
                if(allEntities.size() >= 8){        
                    cs.Entity_8__c = allEntities[7].removeStart(' ');}
                if(allEntities.size() >= 9){        
                    cs.Entity_9__c = allEntities[8].removeStart(' ');}
                if(allEntities.size() >= 10){        
                    cs.Entity_10__c = allEntities[9].removeStart(' ');}
                if(allEntities.size() >= 11){        
                    cs.Entity_11__c = allEntities[10].removeStart(' ');}
                if(allEntities.size() >= 12){      
                    cs.Entity_12__c = allEntities[11].removeStart(' ');}
                if(allEntities.size() >= 13){      
                    cs.Entity_13__c = allEntities[12].removeStart(' ');}
                if(allEntities.size() >= 14){      
                    cs.Entity_14__c = allEntities[13].removeStart(' ');}
                if(allEntities.size() >= 15){      
                    cs.Entity_15__c = allEntities[14].removeStart(' ');}
                if(allEntities.size() >= 16){      
                    cs.Entity_16__c = allEntities[15].removeStart(' ');}
                if(allEntities.size() >= 17){      
                    cs.Entity_17__c = allEntities[16].removeStart(' ');}
                if(allEntities.size() >= 18){      
                    cs.Entity_18__c = allEntities[17].removeStart(' ');}
                if(allEntities.size() >= 19){      
                    cs.Entity_19__c = allEntities[18].removeStart(' ');}
                if(allEntities.size() >= 20){      
                    cs.Entity_20__c = allEntities[19].removeStart(' ');}
                
      		cs.RecordTypeId = clientStatement;

            }
  
      }  
   } 
}