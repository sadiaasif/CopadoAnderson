Public class clsNewEntity{
    
    //For Update Entity - Trigger
    
    public static boolean flag = false;

    Public Entities__c objEntity{get;set;}
    Public Deals_Entities__c objDeal{get;set;}     
    Public String OppId;
    Public String ClientId;
    Public List<Opportunity> lstOpportunity;
    Public List<Deals_Entities__c> lstDeal;
    Public string strRetSub {get;set;}
    public clsNewEntity(ApexPages.StandardController controller) {
        objEntity = new Entities__c();
        objDeal = new Deals_Entities__c();
        lstDeal = New List<Deals_Entities__c>();
        lstOpportunity = new List<Opportunity>();
        OppId = apexPages.CurrentPage().getParameters().get('OppId');
        objEntity.Organization_State__c = 'Nevada';
        if(OppId != null && OppId != ''){
            lstOpportunity = [select id,Name, AccountId from Opportunity where Id =: OppId];
            ClientId = lstOpportunity[0].AccountId ;
            objEntity.Primary_Client__c = ClientId;
        }
    }
    
    Public Pagereference NextToStep2(){
        
        Pagereference p = Page.NewEntityPageStep2;
        return p;
        
    }
    
    
    
    Public Pagereference PreviousToStep1(){
        
        Pagereference p = Page.NewEntityPageStep1;
        return p;
    }
    
    Public Pagereference NextToStep3(){
        
        
        Pagereference p = Page.NewEntityPageStep3;
        return p;
       
        
    }
    
    Public Pagereference NextToStep4(){
        
        Pagereference p = Page.NewEntityPageStep4;
        return p;
        
    }
    
    Public Pagereference PreviousToStep2(){
        
        Pagereference p = Page.NewEntityPageStep2;
        return p;
    
    }
    
    Public Pagereference PreviousToStep3(){
        
        Pagereference p = Page.NewEntityPageStep3;
        return p;
    
    }

    Public Pagereference Cancel(){
       
       
        retURL = '/'+ OppId;        
        Pagereference P = new Pagereference (retURL);
        P.setRedirect(True);
        return P;
       
    }
    
    Public string retURL;
    Public string EntityId;
    Public Pagereference Save(){        
        if(objEntity != null){
            insert objEntity;
            
            EntityId = objEntity.id;
            
            List<Entities__c> lstEntity = [select id,Name,Primary_Client__c,Entity_Type__c from Entities__c where id =: EntityId];
            
            for(Entities__c e :lstEntity){
               objDeal = new Deals_Entities__c(Deals__c = OppId, Entity__c = EntityId);  
               lstDeal.add(objDeal);
            }
            
            insert lstDeal;
        }
        System.debug('##########objEntity::' + objEntity);

        
        retURL = '/'+ OppId;      
        Pagereference P = new Pagereference (retURL);
        P.setRedirect(True);
        return P;
        
    }
    
    Public Pagereference SaveandNew(){
        System.debug('##########objEntity::' + objEntity);
        if(objEntity != null){
            insert objEntity;
            
            EntityId = objEntity.id;
            
            List<Entities__c> lstEntity = [select id,Name,Primary_Client__c,Entity_Type__c from Entities__c where id =: EntityId];
            
            for(Entities__c e :lstEntity){
               objDeal = new Deals_Entities__c(Deals__c = OppId, Entity__c = EntityId);  
               lstDeal.add(objDeal);
            }
            
            insert lstDeal;
        }
        System.debug('##########objEntity::' + objEntity);
        
        Pagereference P = new Pagereference ('/apex/NewEntityPageStep1?OppId='+OppId);
        P.setRedirect(True);
        return P;
    }
    
    
    /////////////// Test Method /////////////////
    static testMethod void testPageMethods() {
        
         Entities__c en = new Entities__c();
             en.Name = 'Test';
             insert en;
         
         account acc = new account();
            acc.name = 'test'; 
            acc.E_Mail__c = 'test@test.com';  
            insert acc;
         
                        
         Opportunity opp = new Opportunity();
             opp.Name = 'test';
             opp.AccountId = acc.id;
             opp.CloseDate = System.today();
             opp.StageName = 'Prospecting';
             opp.Amount = 1079.90;             
             opp.Entity_Type__c = 'S-Corporation';
             opp.Entrity_Name__c = 'Test';
             opp.ChargentSFA__Billing_Address__c = 'Test';
             opp.ChargentSFA__Billing_City__c = 'Test';
             opp.ChargentSFA__Billing_Company__c = 'Test';
             opp.ChargentSFA__Billing_Country__c = 'Test';
             opp.ChargentSFA__Billing_State__c = 'test';
             opp.ChargentSFA__Billing_Fax__c = '123456';
             opp.ChargentSFA__Billing_First__c = 'test';
             opp.ChargentSFA__Billing_Last__c = 'test';
             opp.ChargentSFA__Billing_Phone__c = '1234567890';
             opp.ChargentSFA__Billing_Postcode__c = '123456'; 
             opp.ChargentSFA__Payment_Method__c = 'Credit Card';
             opp.ChargentSFA__Card_Type__c = 'Visa';
             opp.ChargentSFA__Billing_Email__c = 'test@test.com';
             opp.ChargentSFA__Payment_Count__c = 25;
             opp.ChargentSFA__Payment_Start_Date__c = system.today();
             opp.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
             opp.ChargentSFA__Payment_Stop__c = 'Count';
             opp.ChargentSFA__Payment_Status__c = 'Partial';
             opp.ChargentSFA__Payment_Frequency__c = 'Daily';
             opp.ChargentSFA__Payment_Status__c = 'Recurring';
             insert opp;
         
         Deals_Entities__c de = new Deals_Entities__c();
             de.Deals__c = opp.id;
             de.Entity__c = en.id;
             insert de;
         
         apexPages.CurrentPage().getParameters().put('OppID', opp.Id);
         
         ApexPages.StandardController con = new ApexPages.StandardController(en);
         clsNewEntity cls = new clsNewEntity(con);
         cls.NextToStep2();
         cls.PreviousToStep1();
         cls.NextToStep3();
         cls.NextToStep4();
         cls.PreviousToStep2();
         cls.PreviousToStep3();
         cls.Cancel();
         cls.Save();
        
        Entities__c en1 = new Entities__c();
             en1.Name = 'Test';
             insert en1;
             
       account acc1 = new account();
            acc1.name = 'test'; 
            acc1.E_Mail__c = 'test@test.com';  
            insert acc1;
         
                        
         Opportunity opp1 = new Opportunity();
             opp1.Name = 'test';
             opp1.AccountId = acc1.id;
             opp1.CloseDate = System.today();
             opp1.StageName = 'Prospecting';
             opp1.Amount = 1079.90;             
             opp1.Entity_Type__c = 'S-Corporation';
             opp1.Entrity_Name__c = 'Test';
             opp1.ChargentSFA__Billing_Address__c = 'Test';
             opp1.ChargentSFA__Billing_City__c = 'Test';
             opp1.ChargentSFA__Billing_Company__c = 'Test';
             opp1.ChargentSFA__Billing_Country__c = 'Test';
             opp1.ChargentSFA__Billing_State__c = 'test';
             opp1.ChargentSFA__Billing_Fax__c = '123456';
             opp1.ChargentSFA__Billing_First__c = 'test';
             opp1.ChargentSFA__Billing_Last__c = 'test';
             opp1.ChargentSFA__Billing_Phone__c = '1234567890';
             opp1.ChargentSFA__Billing_Postcode__c = '123456'; 
             opp1.ChargentSFA__Payment_Method__c = 'Credit Card';
             opp1.ChargentSFA__Card_Type__c = 'Visa';
             opp1.ChargentSFA__Billing_Email__c = 'test@test.com';
             opp1.ChargentSFA__Payment_Count__c = 25;
             opp1.ChargentSFA__Payment_Start_Date__c = system.today();
             opp1.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
             opp1.ChargentSFA__Payment_Stop__c = 'Count';
             opp1.ChargentSFA__Payment_Status__c = 'Partial';
             opp1.ChargentSFA__Payment_Frequency__c = 'Daily';
             opp1.ChargentSFA__Payment_Status__c = 'Recurring';
             insert opp1;
         
         Deals_Entities__c de1 = new Deals_Entities__c();
             de1.Deals__c = opp1.id;
             de1.Entity__c = en1.id;
             insert de1;      
       
        apexPages.CurrentPage().getParameters().put('OppID', opp1.Id);
        ApexPages.StandardController con1 = new ApexPages.StandardController(en1);
        clsNewEntity cls1 = new clsNewEntity(con1);
         cls1.SaveandNew();
         
    
    }
}