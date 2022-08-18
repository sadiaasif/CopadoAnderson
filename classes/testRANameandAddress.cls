@isTest
public class testRANameandAddress {
		
    static testMethod void Test1() {
     	
        Entities__c ent=new Entities__c();
        
        ent.Registered_Agent__c=true;
        
        ent.Organization_State__c='Alaska';
        
        ent.Name='test entity';
        
        insert ent;
        
        ent.Organization_State__c='Alabama';
        
        update ent;
        
        ent.Organization_State__c='Arkansas';
        
        update ent;
        
        ent.Organization_State__c='Arizona';
        
        update ent;
        
        ent.Organization_State__c='California';
        
        update ent;
        
        ent.Organization_State__c='Colorado';
        
        update ent;
        
        ent.Organization_State__c='Connecticut';
        
        update ent;
        
        ent.Organization_State__c='Delaware';
        
        update ent;
        
        ent.Organization_State__c='District of Columbia';
        
        update ent;
        
        ent.Organization_State__c='Florida';
        
        update ent;
        
        ent.Organization_State__c='Georgia';
        
        update ent;
        
        ent.Organization_State__c='Hawaii';
        
        update ent;
        
        ent.Organization_State__c='Iowa';
        
        update ent;
        
        ent.Organization_State__c='Idaho';
        
        update ent;
        
        ent.Organization_State__c='Illinois';
        
        update ent;
        
        ent.Organization_State__c='Indiana';
        
        update ent;
        
        ent.Organization_State__c='Kansas';
        
        update ent;
        
        ent.Organization_State__c='Kentucky';
        
        update ent;
        
        ent.Organization_State__c='Louisiana';
        
        update ent;
        
        ent.Organization_State__c='Massachusetts';
        
        update ent;
        
        ent.Organization_State__c='Maryland';
        
        update ent;
        
        ent.Organization_State__c='Maine';
        
        update ent;
        
        ent.Organization_State__c='Maryland';
        
        update ent;
        
        ent.Organization_State__c='Michigan';
        
        update ent;
        
        ent.Organization_State__c='Minnesota';
        
        update ent;
        
        ent.Organization_State__c='Missouri';
        
        update ent;
        
        ent.Organization_State__c='Mississippi';
        
        update ent;
        
        ent.Organization_State__c='Montana';
        
        update ent;
        
        ent.Organization_State__c='North Carolina';
        
        update ent;
        
     
      
         
        
    }
    
     static testMethod void Test2() {
     	
            



 
          Test.startTest();  
        
         Entities__c ent=new Entities__c();
        
        ent.Registered_Agent__c=true;
        
        ent.Organization_State__c='Alaska';
        
        ent.Name='test entity1';
        
        insert ent;


	ent.Organization_State__c='North Dakota';
        
        update ent;
        
        ent.Organization_State__c='Nebraska';
        
        update ent;
        
        ent.Organization_State__c='New Hampshire';
        
        update ent;
        
        ent.Organization_State__c='New Jersey';
        
        update ent;
        
        ent.Organization_State__c='New Mexico';
        
        update ent;
        
        ent.Organization_State__c='Nevada';
        
        update ent;
        
        ent.Organization_State__c='New York';
        
        update ent;
        
        ent.Organization_State__c='Ohio';
        
        update ent;
        
        ent.Organization_State__c='Oklahoma';
        
        update ent;
        
        ent.Organization_State__c='Oregon';
        
        update ent;
        
        ent.Organization_State__c='Pennsylvania';
        
        update ent;
        
        ent.Organization_State__c='Rhode Island';
        
        update ent;
        
        ent.Organization_State__c='South Carolina';
        
        update ent;
        
        ent.Organization_State__c='South Dakota';
        
        update ent;
        
        ent.Organization_State__c='Tennessee';
        
        update ent;
        
        ent.Organization_State__c='Texas';
        
        update ent;
        
        ent.Organization_State__c='Utah';
        
        update ent;
        
        ent.Organization_State__c='Virginia';
        
        update ent;
        
        ent.Organization_State__c='Vermont';
        
        update ent;
        
        ent.Organization_State__c='Washington';
        
        update ent;
        
        ent.Organization_State__c='Wisconsin';
        
        update ent;
        
        ent.Organization_State__c='West Virginia';
        
        update ent;
        
        ent.Organization_State__c='Wyoming';
        
        update ent;  
        
        Test.stopTest(); 
         

        
                 
     }
}