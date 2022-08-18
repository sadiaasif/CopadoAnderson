@isTest
public class testFormatStatement {
    
    @testSetup static void createEntities() {
        
        List<Entities__c> updateList = new List<Entities__c>();
        
        for (Integer i = 0; i<20; i++){
            Entities__c myEnt = new Entities__c();
            myEnt.Name = 'Entity_'+i;
            myEnt.Origin__c = 'Anderson';
            myEnt.Organization_State__c = 'Maine';
            updateList.add(myEnt);
            
        }
        
        insert updateList;
    }
    
    @isTest static void createClientStatement() {
        
        List<Entities__c> entList = [SELECT Id FROM Entities__c];
        String[] idList = new String[]{};
            
            
        for (Entities__c ents : entList) {
                idList.add(ents.id);
            }   
        String commaList = string.join(idList,',');
        
        List<Entities__c> ent7List = [SELECT Id FROM Entities__c LIMIT 7];
        String[] id7List = new String[]{};
            
            
        for (Entities__c ents : ent7List) {
                id7List.add(ents.id);
            }   
        String comma7List = string.join(id7List,',');
 
        Client_Statement__c cs = new Client_Statement__c();
        cs.Name = 'Test CS';
        cs.All_Entities__c = commaList;
        cs.All_Entity_Extensions__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        cs.All_Tax_Return_Filings__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        cs.All_Bookkeeping_Completed_By__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        cs.All_1099_Tax_Forms__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        insert CS;
        
        cs.Name = 'Test CS - Update';
        update cs;
        
        cs.All_Entities__c = null;
        update cs;
        
        cs.Entity_11__c = null;
        update cs;
        
   		cs.Entity_6__c = null;
        update cs;
        
        Client_Statement__c cs1 = new Client_Statement__c();
        cs1.Name = 'Test CS 1';
        cs1.All_Entities__c = comma7List;
        cs1.All_Entity_Extensions__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        cs1.All_Tax_Return_Filings__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        cs1.All_Bookkeeping_Completed_By__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        cs1.All_1099_Tax_Forms__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        insert CS1;
        
        Client_Statement__c cs2 = new Client_Statement__c();
        cs2.Name = 'Test CS 2';
        cs2.All_Entity_Extensions__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        cs2.All_Tax_Return_Filings__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        cs2.All_Bookkeeping_Completed_By__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        cs2.All_1099_Tax_Forms__c = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V';
        insert CS2;
      
    }

}