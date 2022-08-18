public class FormatStatement {
    
    public static void Format(List<Client_Statement__c> newList, TriggerOperation operation) {

        Id lessThanFive = [SELECT Id FROM RecordType WHERE DeveloperName = 'Five_Or_Fewer'].id;
        Id lessThanTen  = [SELECT Id FROM RecordType WHERE DeveloperName = 'Ten_Or_Fewer'].id;
        Id moreThanTen  = [SELECT Id FROM RecordType WHERE DeveloperName = 'Eleven_or_More'].id;
        
        for (Client_Statement__c cs : newList) {

            if (cs.All_Entities__c != null ) {
             
           	List<String> allEntities = cs.All_Entities__c.split(',');
           		
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

            }
            
           if (cs.All_Entity_Extensions__c != null ) { 
               
               List<String> entExtensions = cs.All_Entity_Extensions__c.split(',');

                if(entExtensions.size() >= 1){
                    cs.Filing_an_Extension_for_Entity_Return_1__c = entExtensions[0].removeStart(' ');}
                if(entExtensions.size() >= 2){
                	cs.Filing_an_Extension_for_Entity_Return_2__c = entExtensions[1].removeStart(' ');}
                if(entExtensions.size() >= 3){
                    cs.Filing_an_Extension_for_Entity_Return_3__c = entExtensions[2].removeStart(' ');}
                if(entExtensions.size() >= 4){    
                    cs.Filing_an_Extension_for_Entity_Return_4__c = entExtensions[3].removeStart(' ');}
                if(entExtensions.size() >= 5){        
                    cs.Filing_an_Extension_for_Entity_Return_5__c = entExtensions[4].removeStart(' ');}
                if(entExtensions.size() >= 6){        
                    cs.Filing_an_Extension_for_Entity_Return_6__c = entExtensions[5].removeStart(' ');}
                if(entExtensions.size() >= 7){        
                    cs.Filing_an_Extension_for_Entity_Return_7__c = entExtensions[6].removeStart(' ');}
                if(entExtensions.size() >= 8){        
                    cs.Filing_an_Extension_for_Entity_Return_8__c = entExtensions[7].removeStart(' ');}
                if(entExtensions.size() >= 9){        
                    cs.Filing_an_Extension_for_Entity_Return_9__c = entExtensions[8].removeStart(' ');}
                if(entExtensions.size() >= 10){        
                    cs.Filing_an_Extension_for_Entity_Return_10__c = entExtensions[9].removeStart(' ');}
                if(entExtensions.size() >= 11){        
                    cs.Filing_an_Extension_for_Entity_Return_11__c = entExtensions[10].removeStart(' ');}
                if(entExtensions.size() >= 12){      
                    cs.Filing_an_Extension_for_Entity_Return_12__c = entExtensions[11].removeStart(' ');}
                if(entExtensions.size() >= 13){      
                    cs.Filing_an_Extension_for_Entity_Return_13__c = entExtensions[12].removeStart(' ');}
                if(entExtensions.size() >= 14){      
                    cs.Filing_an_Extension_for_Entity_Return_14__c = entExtensions[13].removeStart(' ');}
                if(entExtensions.size() >= 15){      
                    cs.Filing_an_Extension_for_Entity_Return_15__c = entExtensions[14].removeStart(' ');}
                if(entExtensions.size() >= 16){      
                    cs.Filing_an_Extension_for_Entity_Return_16__c = entExtensions[15].removeStart(' ');}
                if(entExtensions.size() >= 17){      
                    cs.Filing_an_Extension_for_Entity_Return_17__c = entExtensions[16].removeStart(' ');}
                if(entExtensions.size() >= 18){      
                    cs.Filing_an_Extension_for_Entity_Return_18__c = entExtensions[17].removeStart(' ');}
                if(entExtensions.size() >= 19){      
                    cs.Filing_an_Extension_for_Entity_Return_19__c = entExtensions[18].removeStart(' ');}
                if(entExtensions.size() >= 20){      
                    cs.Filing_an_Extension_for_Entity_Return_20__c = entExtensions[19].removeStart(' ');}
           
           } 
            
           if (cs.All_Bookkeeping_Completed_By__c != null ) { 
               
               List<String> bookkeeping = cs.All_Bookkeeping_Completed_By__c.split(',');
               
                if(bookkeeping.size() >= 1){
                    cs.Bookkeeping_Completed_By_1__c = bookkeeping[0].removeStart(' ');}
                if(bookkeeping.size() >= 2){
                	cs.Bookkeeping_Completed_By_2__c = bookkeeping[1].removeStart(' ');}
                if(bookkeeping.size() >= 3){
                    cs.Bookkeeping_Completed_By_3__c = bookkeeping[2].removeStart(' ');}
                if(bookkeeping.size() >= 4){    
                    cs.Bookkeeping_Completed_By_4__c = bookkeeping[3].removeStart(' ');}
                if(bookkeeping.size() >= 5){        
                    cs.Bookkeeping_Completed_By_5__c = bookkeeping[4].removeStart(' ');}
                if(bookkeeping.size() >= 6){        
                    cs.Bookkeeping_Completed_By_6__c = bookkeeping[5].removeStart(' ');}
                if(bookkeeping.size() >= 7){        
                    cs.Bookkeeping_Completed_By_7__c = bookkeeping[6].removeStart(' ');}
                if(bookkeeping.size() >= 8){        
                    cs.Bookkeeping_Completed_By_8__c = bookkeeping[7].removeStart(' ');}
                if(bookkeeping.size() >= 9){        
                    cs.Bookkeeping_Completed_By_9__c = bookkeeping[8].removeStart(' ');}
                if(bookkeeping.size() >= 10){        
                    cs.Bookkeeping_Completed_By_10__c = bookkeeping[9].removeStart(' ');}
                if(bookkeeping.size() >= 11){        
                    cs.Bookkeeping_Completed_By_11__c = bookkeeping[10].removeStart(' ');}
                if(bookkeeping.size() >= 12){      
                    cs.Bookkeeping_Completed_By_12__c = bookkeeping[11].removeStart(' ');}
                if(bookkeeping.size() >= 13){      
                    cs.Bookkeeping_Completed_By_13__c = bookkeeping[12].removeStart(' ');}
                if(bookkeeping.size() >= 14){      
                    cs.Bookkeeping_Completed_By_14__c = bookkeeping[13].removeStart(' ');}
                if(bookkeeping.size() >= 15){      
                    cs.Bookkeeping_Completed_By_15__c = bookkeeping[14].removeStart(' ');}
                if(bookkeeping.size() >= 16){      
                    cs.Bookkeeping_Completed_By_16__c = bookkeeping[15].removeStart(' ');}
                if(bookkeeping.size() >= 17){      
                    cs.Bookkeeping_Completed_By_17__c = bookkeeping[16].removeStart(' ');}
                if(bookkeeping.size() >= 18){      
                    cs.Bookkeeping_Completed_By_18__c = bookkeeping[17].removeStart(' ');}
                if(bookkeeping.size() >= 19){      
                    cs.Bookkeeping_Completed_By_19__c = bookkeeping[18].removeStart(' ');}
                if(bookkeeping.size() >= 20){      
                    cs.Bookkeeping_Completed_By_20__c = bookkeeping[19].removeStart(' ');}
          
           }
            
           if (cs.All_Tax_Return_Filings__c != null ) { 
               
               List<String> taxReturns = cs.All_Tax_Return_Filings__c.split(',');
               
                if(taxReturns.size() >= 1){
                    cs.Entity_Tax_Return_Filed_By_1__c = taxReturns[0].removeStart(' ');}
                if(taxReturns.size() >= 2){
                	cs.Entity_Tax_Return_Filed_By_2__c = taxReturns[1].removeStart(' ');}
                if(taxReturns.size() >= 3){
                    cs.Entity_Tax_Return_Filed_By_3__c = taxReturns[2].removeStart(' ');}
                if(taxReturns.size() >= 4){    
                    cs.Entity_Tax_Return_Filed_By_4__c = taxReturns[3].removeStart(' ');}
                if(taxReturns.size() >= 5){        
                    cs.Entity_Tax_Return_Filed_By_5__c = taxReturns[4].removeStart(' ');}
                if(taxReturns.size() >= 6){        
                    cs.Entity_Tax_Return_Filed_By_6__c = taxReturns[5].removeStart(' ');}
                if(taxReturns.size() >= 7){        
                    cs.Entity_Tax_Return_Filed_By_7__c = taxReturns[6].removeStart(' ');}
                if(taxReturns.size() >= 8){        
                    cs.Entity_Tax_Return_Filed_By_8__c = taxReturns[7].removeStart(' ');}
                if(taxReturns.size() >= 9){        
                    cs.Entity_Tax_Return_Filed_By_9__c = taxReturns[8].removeStart(' ');}
                if(taxReturns.size() >= 10){        
                    cs.Entity_Tax_Return_Filed_By_10__c = taxReturns[9].removeStart(' ');}
                if(taxReturns.size() >= 11){        
                    cs.Entity_Tax_Return_Filed_By_11__c = taxReturns[10].removeStart(' ');}
                if(taxReturns.size() >= 12){      
                    cs.Entity_Tax_Return_Filed_By_12__c = taxReturns[11].removeStart(' ');}
                if(taxReturns.size() >= 13){      
                    cs.Entity_Tax_Return_Filed_By_13__c = taxReturns[12].removeStart(' ');}
                if(taxReturns.size() >= 14){      
                    cs.Entity_Tax_Return_Filed_By_14__c = taxReturns[13].removeStart(' ');}
                if(taxReturns.size() >= 15){      
                    cs.Entity_Tax_Return_Filed_By_15__c = taxReturns[14].removeStart(' ');}
                if(taxReturns.size() >= 16){      
                    cs.Entity_Tax_Return_Filed_By_16__c = taxReturns[15].removeStart(' ');}
                if(taxReturns.size() >= 17){      
                    cs.Entity_Tax_Return_Filed_By_17__c = taxReturns[16].removeStart(' ');}
                if(taxReturns.size() >= 18){      
                    cs.Entity_Tax_Return_Filed_By_18__c = taxReturns[17].removeStart(' ');}
                if(taxReturns.size() >= 19){      
                    cs.Entity_Tax_Return_Filed_By_19__c = taxReturns[18].removeStart(' ');}
                if(taxReturns.size() >= 20){      
                    cs.Entity_Tax_Return_Filed_By_20__c = taxReturns[19].removeStart(' ');}
               
           }
            
            if (cs.All_1099_Tax_Forms__c != null ) { 
                
                List<String> x1099Forms = cs.All_1099_Tax_Forms__c.split(',');
                
                if(x1099Forms.size() >= 1){
                    cs.X1099_Tax_Forms_Completed_By_1__c = x1099Forms[0].removeStart(' ');}
                if(x1099Forms.size() >= 2){
                	cs.X1099_Tax_Forms_Completed_By_2__c = x1099Forms[1].removeStart(' ');}
                if(x1099Forms.size() >= 3){
                    cs.X1099_Tax_Forms_Completed_By_3__c = x1099Forms[2].removeStart(' ');}
                if(x1099Forms.size() >= 4){    
                    cs.X1099_Tax_Forms_Completed_By_4__c = x1099Forms[3].removeStart(' ');}
                if(x1099Forms.size() >= 5){        
                    cs.X1099_Tax_Forms_Completed_By_5__c = x1099Forms[4].removeStart(' ');}
                if(x1099Forms.size() >= 6){        
                    cs.X1099_Tax_Forms_Completed_By_6__c = x1099Forms[5].removeStart(' ');}
                if(x1099Forms.size() >= 7){        
                    cs.X1099_Tax_Forms_Completed_By_7__c = x1099Forms[6].removeStart(' ');}
                if(x1099Forms.size() >= 8){        
                    cs.X1099_Tax_Forms_Completed_By_8__c = x1099Forms[7].removeStart(' ');}
                if(x1099Forms.size() >= 9){        
                    cs.X1099_Tax_Forms_Completed_By_9__c = x1099Forms[8].removeStart(' ');}
                if(x1099Forms.size() >= 10){        
                    cs.X1099_Tax_Forms_Completed_By_10__c = x1099Forms[9].removeStart(' ');}
                if(x1099Forms.size() >= 11){        
                    cs.X1099_Tax_Forms_Completed_By_11__c = x1099Forms[10].removeStart(' ');}
                if(x1099Forms.size() >= 12){      
                    cs.X1099_Tax_Forms_Completed_By_12__c = x1099Forms[11].removeStart(' ');}
                if(x1099Forms.size() >= 13){      
                    cs.X1099_Tax_Forms_Completed_By_13__c = x1099Forms[12].removeStart(' ');}
                if(x1099Forms.size() >= 14){      
                    cs.X1099_Tax_Forms_Completed_By_14__c = x1099Forms[13].removeStart(' ');}
                if(x1099Forms.size() >= 15){      
                    cs.X1099_Tax_Forms_Completed_By_15__c = x1099Forms[14].removeStart(' ');}
                if(x1099Forms.size() >= 16){      
                    cs.X1099_Tax_Forms_Completed_By_16__c = x1099Forms[15].removeStart(' ');}
                if(x1099Forms.size() >= 17){      
                    cs.X1099_Tax_Forms_Completed_By_17__c = x1099Forms[16].removeStart(' ');}
                if(x1099Forms.size() >= 18){      
                    cs.X1099_Tax_Forms_Completed_By_18__c = x1099Forms[17].removeStart(' ');}
                if(x1099Forms.size() >= 19){      
                    cs.X1099_Tax_Forms_Completed_By_19__c = x1099Forms[18].removeStart(' ');}
                if(x1099Forms.size() >= 20){      
                    cs.X1099_Tax_Forms_Completed_By_20__c = x1099Forms[19].removeStart(' ');}
               
           }
            	
            if(operation == triggerOperation.BEFORE_INSERT) {
            	if (cs.Entity_11__c != null) {
                    cs.RecordTypeId = moreThanTen;
                } else if (cs.Entity_6__c != null) {
                    cs.RecordTypeId = lessThanTen;
                } else {cs.RecordTypeId = lessThanFive;}
            }
                
                
        }  
   } 
}