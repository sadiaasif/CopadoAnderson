public class ctrlCreateSubscription{
    public Account objaccount {get; set;}
    public Opportunity objOpportynity {get; set;}
    public Subscription__c objSubscription {get; set;}    
    public List<PricebookEntry> lstprod {get; set;}
    public List<Entities__c> lstEntity {get; set;} 
    public List<EntityInner> lstEntityInner {get; set;}
    public List<EntityInnerSelected> lstEntityInnerSelected {get; set;}  
    public List<Entities__c> lstSelectedEntity {get; set;}    
    public String oppid {get; set;}
    public String StrSearchProduct {get; set;}
    public String StrSearchEntity {get; set;}
    public String strProductName {get; set;}
    public String strEntityName{get; set;}    
    Public Boolean isProductPopup {get;set;}
    Public Boolean isEntityPopup {get;set;} 
    public String strPeriod{get; set;}
    public string strselectedid{get;set;}
    public string strSelectedRemoveid{get;set;}
    public string strCreatedEntid{get;set;}
    public set<Id> setContainDealsEntity {get; set;}
    public set<Id> setContainSubsEntity {get; set;}
    public set<Id> setRemoveEntity {get; set;}
    public string strOppAccId {get;set;}
    
    
    //----------------------------------
    //For Edit Subscription
    public String strSubscriptionName{get; set;}
    public string strSubscripId {get; set;}
    public List<Subscription__c> lstSubscription {get; set;}
    public string strOppSubId {get; set;}
    //Public Boolean isEditSubscription {get;set;}
    
    public class EntityInner{
        public ID entityId {get; set;}
        Public Boolean isEntitySelected {get;set;}
        public String strEntityName {get; set;}
        public date Organizationdate {get; set;}
    }
    
    public class EntityInnerSelected{
        public ID entityId {get; set;}
        Public Boolean isEntityInnerSelected {get;set;}
        public String strEntityName {get; set;}
        public date Organizationdate {get; set;}
    }
    
    public ctrlCreateSubscription(ApexPages.StandardController controller) {
    
        
        
    }
    
    public ctrlCreateSubscription(ApexPages.StandardSetController controller) {
       system.debug('############New Subscription');
         //OppCreEnId = apexPages.CurrentPage().getParameters().get('OppId');
        objaccount = new Account();
        
        objSubscription = new Subscription__c();
        oppid = Apexpages.currentpage().getParameters().get('id');
        if(oppid != null){
            List<Opportunity> lstopp = [select id,Account.Name from Opportunity where id =:oppid];
            if(lstopp.size() > 0){
                strOppAccId = lstopp[0].Account.id;
                objaccount.Name = lstopp[0].Account.Name;
                objSubscription.Opportunity__c = lstopp[0].id;                
                
            }
        }
        isProductPopup = false;
        //isEditSubscription = false;
        //strCreatedEntid = Apexpages.currentpage().getParameters().get('EntityId');
        //strselectedid = '';
        //SelectedEntityId();
        
    
        //----------------------------------
        //For Create Entity
    
        objEntity = new Entities__c();
        objDeal = new Deals_Entities__c();
        lstDeal = New List<Deals_Entities__c>();
        lstOpportunity = new List<Opportunity>();
        lstEntityInner = new List<EntityInner>();
        lstEntityInnerSelected = new List<EntityInnerSelected>();
        setRemoveEntity = new set<Id>();
       
        
        strSubscripId = Apexpages.currentpage().getParameters().get('id');        
        lstSubscription = new List<Subscription__c>();
        
        if(strSubscripId != null && strSubscripId != ''){
            strselectedid = '';
            //isEditSubscription = true;
            lstSubscription = [select id,Name,Opportunity__r.Name,Opportunity__r.Account.Name,Start_Date__c,End_Date__c,Product__c,Product__r.Name,Period__c from Subscription__c where id =: strSubscripId];
            if(lstSubscription != null && lstSubscription.size() > 0){
            
                strSubscriptionName = lstSubscription[0].Name;
                oppid = lstSubscription[0].Opportunity__c;
                strOppAccId = lstSubscription[0].Opportunity__r.Account.id;
                               
                objaccount.Name = lstSubscription[0].Opportunity__r.Account.Name;
                objSubscription.Opportunity__c = lstSubscription[0].Opportunity__c;
                objSubscription.Start_Date__c = lstSubscription[0].Start_Date__c; 
                objSubscription.End_Date__c = lstSubscription[0].End_Date__c;                
                objSubscription.Period__c = lstSubscription[0].Period__c;
                strPeriod = lstSubscription[0].Period__c;
                
                objSubscription.Product__c = lstSubscription[0].Product__c; 
                strProductName = lstSubscription[0].Product__r.Name;
                
                
                List<Subscriptions_Entities__c> lstEntityView = new List<Subscriptions_Entities__c>();
                lstEntityView = [select id,Subscription__c,Entity__c,Entity__r.Name,Entity__r.Organizational_Date__c,Entity__r.Primary_Client__c,Entity__r.Entity_Type__c from Subscriptions_Entities__c where Subscription__c =: strSubscripId];
                EntityInnerSelected objEntityInnerSelected;
                EntityInner objEntityInner;
                
                
                for(Subscriptions_Entities__c en :lstEntityView){
                    
                    strselectedid += en.Entity__c + ';';
                                                   
                    setRemoveEntity.add(en.Entity__c);
                    objEntityInnerSelected = new EntityInnerSelected();
                    objEntityInnerSelected.entityId = en.Entity__c;
                    objEntityInnerSelected.strEntityName= en.Entity__r.Name;
                    objEntityInnerSelected.Organizationdate = en.Entity__r.Organizational_Date__c;
                    lstEntityInnerSelected.add(objEntityInnerSelected);                           
                }
                
                
            }
        }
         
   }
    
   Public OpportunityLineItem OplineItem;
   Public string OppLineItemId;
    
    public ctrlCreateSubscription(){
        objaccount = new Account();
        objSubscription = new Subscription__c();
    }
    public PageReference savesubscription(){
      
        if(strSubscripId != null && strSubscripId != '' && lstSubscription.size() > 0){
            if(lstSubscription != null){
                lstSubscription[0].Start_Date__c = objSubscription.Start_Date__c;
                lstSubscription[0].Period__c = objSubscription.Period__c;
                lstSubscription[0].End_Date__c = objSubscription.End_Date__c;
                lstSubscription[0].Product__c = objSubscription.Product__c;
                lstSubscription[0].Account__c = strOppAccId;
                           
                update lstSubscription;
            }
            
           
            List<Deals_Entities__c> lstEntityOpp;
            lstEntityOpp = [select id,name,Entity__r.Name,Entity__r.Organizational_Date__c from Deals_Entities__c where Deals__c=:oppid];        
            setContainDealsEntity = new set<id>();
            
            for(Deals_Entities__c cent : lstEntityOpp){
            
                setContainDealsEntity.add(cent.Entity__c);
            }
            
            List<Subscriptions_Entities__c> lstSubscrEntity;
            lstSubscrEntity = [select id,Entity__c from Subscriptions_Entities__c where Subscription__c=:strSubscripId];           
            setContainSubsEntity = new set<id>();
            for(Subscriptions_Entities__c sent : lstSubscrEntity){
            
                setContainSubsEntity.add(sent.Entity__c);
            }
            
            lstSelectedEntity = new List<Entities__c>();
            if(strselectedid != null && strselectedid != ''){
                string[] selectedEntityIds = strselectedid.split(';');                                 
                lstSelectedEntity = [select id,Name,Organizational_Date__c from Entities__c where Id In: selectedEntityIds];
            }
            
            
                        
            Subscriptions_Entities__c objSubscEntities;            
            
            for(Entities__c ei:lstSelectedEntity ){
                if(setContainSubsEntity.contains(ei.id) == false){
                    objSubscEntities = new Subscriptions_Entities__c();                    
                    
                    objSubscEntities.Name  = objSubscription.Name + ' ' + objSubscription.Start_Date__c + '-' + objSubscription.End_Date__c;
                    objSubscEntities.Subscription__c = strSubscripId;
                    objSubscEntities.Entity__c = ei.id;
                    
                    insert objSubscEntities;
                }
            } 
            //set<ID> setRemoveEnt = new set<ID>();           
            Deals_Entities__c objdealsEntities;        
            for(Entities__c ei:lstSelectedEntity ){
                if(setContainDealsEntity.contains(ei.id) == false){
                    objdealsEntities = new Deals_Entities__c();
                    objdealsEntities.Deals__c = oppid;                    
                    objdealsEntities.Entity__c = ei.id;                    
                    insert objdealsEntities;
                }
                
            }           
            List<Entities__c> lstSelectedRemoveEntity = new List<Entities__c>();
            if(strSelectedRemoveid != null && strSelectedRemoveid != ''){
                string[] arrSelectedRemoveIds = strSelectedRemoveid.split(';');                                     
                lstSelectedRemoveEntity = [select id,Name,Organizational_Date__c from Entities__c where Id IN: arrSelectedRemoveIds];
            }
           
            set<ID> setRemoveEnt = new set<ID>();
            for(Entities__c erem:lstSelectedRemoveEntity){
                setRemoveEnt.add(erem.id);
            }
            if(setRemoveEnt.size() > 0){
                List<Subscriptions_Entities__c> lstSERemove = [select id,Entity__c,Subscription__c from Subscriptions_Entities__c where Entity__c IN: setRemoveEnt];
                if(lstSERemove != null && lstSERemove.size() > 0){
                    delete lstSERemove;
                }
                
                List<Deals_Entities__c> lstDERemove = [select id,Entity__c,Deals__c from Deals_Entities__c where Entity__c IN: setRemoveEnt];
                if(lstDERemove != null && lstDERemove.size() > 0){
                    delete lstDERemove;
                }
            }
            
            PageReference pr = new PageReference('/'+oppid);        
            return pr;
            
            
            
            
        }else{ 
        
            objSubscription.Name = objaccount.Name;
            
        
            objSubscription.Account__c = strOppAccId;
            if(objSubscription.Period__c == '1 day'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c;
            }else if(objSubscription.Period__c == '1 Month'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(1).adddays(-1);
            }else if(objSubscription.Period__c == '3 Month'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(3).adddays(-1);
            }else if(objSubscription.Period__c == '6 Month'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(6).adddays(-1);
            }else if(objSubscription.Period__c == '1 Year'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(12).adddays(-1);
            }
            insert objSubscription;       
            
            if(objSubscription.Product__c != null){
                PricebookEntry pbe = [select id, Product2Id ,UnitPrice from PricebookEntry where Product2Id = :objSubscription.Product__c limit 1];
                if(pbe != null){
                    OplineItem = new OpportunityLineItem();
                        OplineItem.OpportunityId = oppid;
                        OplineItem.ServiceDate = objSubscription.Start_Date__c;
                        OplineItem.Quantity = 1;
                        OplineItem.priceBookEntryId = pbe.id;
                        OplineItem.UnitPrice = pbe.UnitPrice;
                    insert OplineItem ;
                    
                    OppLineItemId = OplineItem.id;
                }
            }
            
            List<Deals_Entities__c> lstEntityOpp;
            lstEntityOpp = [select id,name,Entity__r.Name,Entity__r.Organizational_Date__c from Deals_Entities__c where Deals__c=:oppid];        
            setContainDealsEntity = new set<id>();
            
            for(Deals_Entities__c cent : lstEntityOpp){
            
                setContainDealsEntity.add(cent.Entity__c);
            }
            
            
            lstSelectedEntity = new List<Entities__c>();
            if(strselectedid != null && strselectedid != ''){
                string[] selectedEntityIds = strselectedid.split(';');                                 
                lstSelectedEntity = [select id,Name,Organizational_Date__c from Entities__c where Id In: selectedEntityIds];
            }
            
            
            List<Subscriptions_Entities__c> lstSubscrEntity;
            lstSubscrEntity = [select id,Entity__c from Subscriptions_Entities__c where Subscription__c=:objSubscription.id];           
            setContainSubsEntity = new set<id>();
            for(Subscriptions_Entities__c sent : lstSubscrEntity){
            
                setContainSubsEntity.add(sent.Entity__c);
            }
            
            Subscriptions_Entities__c objSubscEntities;            
            
            for(Entities__c ei:lstSelectedEntity ){
                if(setContainSubsEntity.contains(ei.id) == false){                
                    objSubscEntities = new Subscriptions_Entities__c();
                    if(objSubscription.Start_Date__c != null && objSubscription.End_Date__c != null)
                    objSubscEntities.Name  = objSubscription.Name + ' ' + objSubscription.Start_Date__c.format() + '-' + objSubscription.End_Date__c.format();
                    objSubscEntities.Subscription__c = objSubscription.id;
                    objSubscEntities.Entity__c = ei.id;
                    insert objSubscEntities;
                }
            }
            
            
            
            Deals_Entities__c objdealsEntities;                  
            for(Entities__c ei:lstSelectedEntity ){
                if(setContainDealsEntity.contains(ei.id) == false){
                    system.debug('########'+ei.id);
                    objdealsEntities = new Deals_Entities__c();
                    objdealsEntities.Deals__c = oppid;                    
                    objdealsEntities.Entity__c = ei.id;                    
                    insert objdealsEntities;
                }
            }        
            PageReference pr = new PageReference('/'+oppid);        
            return pr;
           }        
        
    }
    public PageReference saveandnewsubscription(){          
        objSubscription.Name = objaccount.Name;
        objSubscription.Account__c = strOppAccId;
        if(objSubscription.Period__c == '1 day'){
            objSubscription.End_Date__c = objSubscription.Start_Date__c;
        }else if(objSubscription.Period__c == '1 Month'){
            objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(1).adddays(-1);
        }else if(objSubscription.Period__c == '3 Month'){
            objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(3).adddays(-1);
        }else if(objSubscription.Period__c == '6 Month'){
            objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(6).adddays(-1);
        }else if(objSubscription.Period__c == '1 Year'){
            objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(12).adddays(-1);
        }
        insert objSubscription;     
        
        if(objSubscription.Product__c != null){
                PricebookEntry pbe = [select id, Product2Id ,UnitPrice from PricebookEntry where Product2Id = :objSubscription.Product__c limit 1];
                if(pbe != null){
                    OplineItem = new OpportunityLineItem();
                        OplineItem.OpportunityId = oppid;
                        OplineItem.ServiceDate = objSubscription.Start_Date__c;
                        OplineItem.Quantity = 1;
                        OplineItem.priceBookEntryId = pbe.id;
                        OplineItem.UnitPrice = pbe.UnitPrice;
                    insert OplineItem ;
                    
                    OppLineItemId = OplineItem.id;
                }
            }
        
        
        List<Deals_Entities__c> lstEntityOpp;
        lstEntityOpp = [select id,name,Entity__r.Name,Entity__r.Organizational_Date__c from Deals_Entities__c where Deals__c=:oppid];        
        setContainDealsEntity = new set<id>();
        
        for(Deals_Entities__c cent : lstEntityOpp){
        
            setContainDealsEntity.add(cent.Entity__c);
        }
        
        
        lstSelectedEntity = new List<Entities__c>();
        if(strselectedid != null && strselectedid != ''){
            string[] selectedEntityIds = strselectedid.split(';');                                 
            lstSelectedEntity = [select id,Name,Organizational_Date__c from Entities__c where Id In: selectedEntityIds];
        }
        
        
        List<Subscriptions_Entities__c> lstSubscrEntity;
        lstSubscrEntity = [select id,Entity__c from Subscriptions_Entities__c where Subscription__c=:objSubscription.id];           
        setContainSubsEntity = new set<id>();
        for(Subscriptions_Entities__c sent : lstSubscrEntity){
        
            setContainSubsEntity.add(sent.Entity__c);
        }
        
        Subscriptions_Entities__c objSubscEntities;
            
        system.debug('@@@@@@@'+lstEntityInner.size());
        for(Entities__c ei:lstSelectedEntity ){
            if(setContainSubsEntity.contains(ei.id) == false){
                objSubscEntities = new Subscriptions_Entities__c();
                objSubscEntities.Name  = objSubscription.Name + ' ' + objSubscription.Start_Date__c + '-' + objSubscription.End_Date__c;
                objSubscEntities.Subscription__c = objSubscription.id;
                objSubscEntities.Entity__c = ei.id;
                
                insert objSubscEntities;
            }
        }
        
        
        
        Deals_Entities__c objdealsEntities;        
        for(Entities__c ei:lstSelectedEntity ){
            if(setContainDealsEntity.contains(ei.id) == false){
                objdealsEntities = new Deals_Entities__c();
                objdealsEntities.Deals__c = oppid;                    
                objdealsEntities.Entity__c = ei.id;                    
                insert objdealsEntities;
            }
        }    
         
        PageReference pr = new PageReference('/apex/CreateSubscription?id='+oppid);
        pr.setredirect(true);
        return pr;
        
        
       
    }
    
    public PageReference cancelsubscription(){
        //if(strSubscripId != null && strSubscripId != ''){
        //    PageReference pr = new PageReference('/apex/ViewSubscription?id='+strSubscripId);
        //    return pr;
        //}else{ 
            PageReference pr = new PageReference('/'+oppid);        
            return pr;
        //}
    }
    public void getlstProduct(){
        isProductPopup = true; 
         
        //lstprod = [select id,name,productcode,description,family,Entity_Type__c from Product2 where Subscription_Product__c = true];        
        lstprod = [select id,Product2.name,Product2.productcode,Product2.description,Product2.family,Product2.Entity_Type__c,unitPrice from PricebookEntry where Product2.Subscription_Product__c = true];        
    }
  

    public PageReference setProduct(){       
        string productid=ApexPages.currentPage().getParameters().get('productid');
        list<Product2> lstProduct=[select id,name from Product2 where id=:productid];
        if(lstProduct.size() > 0){
            objSubscription.Product__c = lstProduct[0].id;            
            strProductName = lstProduct[0].Name;
        }
        isProductPopup = false;
        return null;
    }
    /*public PageReference setEntity(){       
        string entityid=ApexPages.currentPage().getParameters().get('entityid');
        list<Entities__c> lstent =[select id,name from Entities__c where id=:entityid];
        if(lstent.size() > 0){
            objSubscription.Entity__c = lstent[0].id;            
            strEntityName = lstent[0].Name;
        }
        isEntityPopup = false;
        return null;
    }*/
    public Void done(){
       isProductPopup = false; 
       isEntityPopup = false;         
    }
    Public Pagereference SearchProduct(){
        String strQuery = ''; 
        if(StrSearchProduct!= null && StrSearchProduct.trim().length()>0){
            strQuery = 'Select id,name,productcode,description,family,Entity_Type__c from Product2 where Subscription_Product__c = true and name Like' +'\'%' + StrSearchProduct + '%\' order by CreatedDate Limit 49000';            
        }else{
            strQuery = 'Select id,name,productcode,description,family,Entity_Type__c from Product2 where Subscription_Product__c = true order by CreatedDate Limit 49000';
        }
        if(strquery != ''){   
            lstprod = database.Query(strquery);
        }
        return null;
    }
    Public Pagereference SearchEntity(){
        String strQueryent = ''; 
        if(StrSearchEntity != null && StrSearchEntity.trim().length()>0){
            strQueryent = 'Select id,Name,Organizational_Date__c from Entities__c where Name Like' +'\'%' + StrSearchEntity+ '%\' and Primary_Client__c =: strOppAccId  order by CreatedDate Limit 49000';            
        }else{
            strQueryent = 'Select id,Name,Organizational_Date__c from Entities__c where Primary_Client__c =: strOppAccId order by CreatedDate Limit 49000';
        }
        if(strQueryent!= ''){   
            lstEntity = database.Query(strQueryent);
        }
         
        EntityInner objEntityInner;
        lstEntityInner = new List<EntityInner>();
        for(Entities__c en: lstEntity){
            objEntityInner = new EntityInner();
            objEntityInner.entityId = en.id;
            objEntityInner.strEntityName= en.Name;
            objEntityInner.Organizationdate = en.Organizational_Date__c;
            lstEntityInner.add(objEntityInner);            
        }
         if((lstEntityInner !=null)&&(lstEntityInner.size()>0)){
            for(EntityInner ens:lstEntityInner){                
                if(strselectedid.indexOf(ens.entityId)!=-1){
                    ens.isEntitySelected =true;
                }else{
                    ens.isEntitySelected =false;
                }
            }
        }
        lstEntity = new List<Entities__c>();
                  
        return null;
    }
   
    public PageReference setEndDate(){          
        if(objSubscription.Start_Date__c != null ){  
            if(strPeriod == '1 day'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c;
                objSubscription.Period__c = '1 day';
            }else if(strPeriod == '1 Month'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(1).adddays(-1);
                objSubscription.Period__c = '1 Month';
            }else if(strPeriod == '3 Month'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(3).adddays(-1);
                objSubscription.Period__c = '3 Month';
            }else if(strPeriod == '6 Month'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(6).adddays(-1);
                objSubscription.Period__c = '6 Month';
            }else if(strPeriod == '1 Year'){
                objSubscription.End_Date__c = objSubscription.Start_Date__c.addMonths(12).adddays(-1);
                objSubscription.Period__c = '1 Year';
            }else if(strPeriod == '--None--'){
                objSubscription.End_Date__c = null;
                objSubscription.Period__c = '';
            }
        }
        return null;
    } 
    
    
    
    public PageReference AddEntity(){          
        
        
        lstEntity = [select id,name,Organizational_Date__c from Entities__c where Primary_Client__c =: strOppAccId ];        
    
        EntityInner objEntityInner;
        lstEntityInner = new List<EntityInner>();
        for(Entities__c en: lstEntity){
            objEntityInner = new EntityInner();
            objEntityInner.entityId = en.id;
            objEntityInner.strEntityName= en.Name;
            objEntityInner.Organizationdate = en.Organizational_Date__c;
            lstEntityInner.add(objEntityInner);            
        }
        lstEntity = new List<Entities__c>();
        
        
        if((lstEntityInner !=null)&&(lstEntityInner.size()>0)){
            for(EntityInner ens:lstEntityInner){
                                
                if(strselectedid.indexOf(ens.entityId)!=-1){
                    ens.isEntitySelected =true;
                }else{
                    ens.isEntitySelected =false;
                }
                
                //if(strSelectedRemoveid.indexOf(ens.entityId)!=-1){
                  //  ens.isEntitySelected = false;                                       
                //}
                 
            }
        }
        
        isEntityPopup  = true;
        lstEntity  = new List<Entities__c>();
        List<Deals_Entities__c> lstEntityOpp;
        lstEntityOpp = [select id,name,Entity__r.Name,Entity__r.Organizational_Date__c from Deals_Entities__c where Deals__c=:oppid];        
        setContainDealsEntity = new set<id>();
        for(Deals_Entities__c cent : lstEntityOpp){
        
            setContainDealsEntity.add(cent.Entity__c);
        }
        
        
        
        return null;
    }
    Public void SelectedEntityId(){
     
        
        //if(strCreatedEntid != null && strCreatedEntid != ''){
        //    strselectedid += strCreatedEntid + ';';
        //}
        
        system.debug('@@@@@@@'+strselectedid);
        lstSelectedEntity = new List<Entities__c>();
        if(strselectedid != null && strselectedid != ''){
            string[] selectedEntityIds = strselectedid.split(';');                                 
            lstSelectedEntity = [select id,Name,Organizational_Date__c from Entities__c where Id In: selectedEntityIds];
        }
        
        
        EntityInnerSelected objEntityInnerSelected;
        setRemoveEntity = new set<Id>();
        lstEntityInnerSelected = new List<EntityInnerSelected>();
        for(Entities__c en: lstSelectedEntity){
        
            //if(setRemoveEntity.contains(en.id) == false){
                setRemoveEntity.add(en.id);
                objEntityInnerSelected = new EntityInnerSelected();
                objEntityInnerSelected.entityId = en.id;
                objEntityInnerSelected.strEntityName= en.Name;
                objEntityInnerSelected.Organizationdate = en.Organizational_Date__c;
                lstEntityInnerSelected.add(objEntityInnerSelected);
            //}
        }
        //lstSelectedEntity = new List<Entities__c>();
        
        
        
        
       // if(strCreatedEntid != null && strCreatedEntid != ''){
       //     lstSelectedEntity = [select id,Name,Organizational_Date__c from Entities__c where Id =: strCreatedEntid];
       // }
        
        isEntityPopup  = false;
    
    }
    public PageReference CreateEntity(){
        objEntity = new Entities__c();
        objDeal = new Deals_Entities__c();
        lstDeal = New List<Deals_Entities__c>();
        lstEntityInner = new List<EntityInner>();
        lstEntityInnerSelected = new List<EntityInnerSelected>();
        objEntity.Organization_State__c = 'Nevada';
        setRemoveEntity = new set<Id>();
        if(oppid != null && oppid != ''){            
            lstOpportunity = [select id,Name, AccountId from Opportunity where Id =: oppid];
            ClientId = lstOpportunity[0].AccountId ;
            objEntity.Primary_Client__c = ClientId;            
        }  
         
        PageReference pr = new PageReference('/apex/NewEntityPageSubStep1?id='+oppid);
        //Pagereference p = Page.NewEntityPageSubStep1;
        
          //  return p;
        return pr;
        
        
    }
    public PageReference RemoveEntity(){
        string[] arrSelectedRemoveIds;
        system.debug('#########'+strSelectedRemoveid);
        system.debug('#########'+setRemoveEntity);
        if(strSelectedRemoveid != null && strSelectedRemoveid != ''){
            arrSelectedRemoveIds = strSelectedRemoveid.split(';');
                                 
            lstSelectedEntity = [select id,Name,Organizational_Date__c from Entities__c where Id Not In: arrSelectedRemoveIds and ID IN: setRemoveEntity];
        }
        
        
        system.debug('@@@@@@@'+lstSelectedEntity.size());
        
        EntityInnerSelected objEntityInnerSelected;
        lstEntityInnerSelected = new List<EntityInnerSelected>();
        
        for(Entities__c en: lstSelectedEntity){
        
            objEntityInnerSelected = new EntityInnerSelected();
            
            objEntityInnerSelected.entityId = en.id;
            objEntityInnerSelected.strEntityName= en.Name;
            objEntityInnerSelected.Organizationdate = en.Organizational_Date__c;
            lstEntityInnerSelected.add(objEntityInnerSelected);
                        
        }
        
        
        //lstSelectedEntity = new List<Entities__c>();
        
           
        //lstSelectedEntity = [select id,Name,Organizational_Date__c from Entities__c where Id In: strSelectedRemoveid];
       
        
        
        return null;
    }
    //----------------------------------
    //For Create Entity
    
    
    Public Entities__c objEntity{get;set;}
    Public Deals_Entities__c objDeal{get;set;}     
    //Public String OppCreEnId;
    Public String ClientId;
    Public List<Opportunity> lstOpportunity;
    Public List<Deals_Entities__c> lstDeal;
       
    Public Pagereference NextToStep2(){       
        Pagereference p = Page.NewEntityPageSubStep2;
        return p;        
    }
    
    Public Pagereference PreviousToStep1(){
      
        Pagereference p = Page.NewEntityPageSubStep1;
        return p;
        
    }    
    Public Pagereference NextToStep3(){      
        Pagereference p = Page.NewEntityPageSubStep3;
        return p;        
    }
    
    Public Pagereference PreviousToStep2(){     
        Pagereference p = Page.NewEntityPageSubStep2;
        return p;        
    }
    
     Public Pagereference NextToStep4(){
        
        Pagereference p = Page.NewEntityPageSubStep4;
        return p;
        
    }
    
     Public Pagereference PreviousToStep3(){
        
        Pagereference p = Page.NewEntityPageSubStep3;
        return p;
    
    }
    
    Public Pagereference Cancel(){
    
        string[] arrSelectedIds;
        List<Entities__c> lstEntityNew = new List<Entities__c>();    
        if(strselectedid != null && strselectedid != ''){
            arrSelectedIds = strselectedid.split(';');
                             
            lstEntityNew = [select id,Name,Organizational_Date__c,Primary_Client__c,Entity_Type__c from Entities__c where id IN: arrSelectedIds];
        
        //List<Entities__c> lstEntityNew = [select id,Name,Organizational_Date__c,Primary_Client__c,Entity_Type__c from Entities__c where id IN: strselectedid];
            EntityInnerSelected objEntityInnerSelected;
            EntityInner objEntityInner;
            for(Entities__c en :lstEntityNew){                
                
                setRemoveEntity.add(en.id);
                objEntityInnerSelected = new EntityInnerSelected();
                objEntityInnerSelected.entityId = en.id;
                objEntityInnerSelected.strEntityName= en.Name;
                objEntityInnerSelected.Organizationdate = en.Organizational_Date__c;
                lstEntityInnerSelected.add(objEntityInnerSelected);                           
            }
        }
                
        Pagereference P = new Pagereference ('/apex/CreateSubscription?id='+oppid);
        //P.setRedirect(True);
        return P;        
    }
    
    Public string retURL;
    Public string EntityId;
    Public Pagereference Save(){
             
        if(objEntity != null){
            
            insert objEntity;        
            EntityId = objEntity.id;
            
            if(objEntity.id != null){
                strselectedid += objEntity.id + ';';
            }
            string[] arrSelectedIds;
            List<Entities__c> lstEntityNew = new List<Entities__c>();    
            if(strselectedid != null && strselectedid != ''){
                arrSelectedIds = strselectedid.split(';');                                     
                lstEntityNew = [select id,Name,Organizational_Date__c,Primary_Client__c,Entity_Type__c from Entities__c where id IN: arrSelectedIds];
            }
            
            List<Deals_Entities__c> lstEntityOpp;
            lstEntityOpp = [select id,name,Entity__r.Name,Entity__r.Organizational_Date__c from Deals_Entities__c where Deals__c=:oppid];        
            setContainDealsEntity = new set<id>();
            
            for(Deals_Entities__c cent : lstEntityOpp){
            
                setContainDealsEntity.add(cent.Entity__c);
            }
            
            
            //List<Entities__c> lstEntityNew = [select id,Name,Organizational_Date__c,Primary_Client__c,Entity_Type__c from Entities__c where id IN: strselectedid];
            EntityInnerSelected objEntityInnerSelected;
            EntityInner objEntityInner;
            for(Entities__c en :lstEntityNew){
                if(setContainDealsEntity.contains(en.id) == false){
            
                    objDeal = new Deals_Entities__c(Deals__c = oppid, Entity__c = EntityId);  
                    lstDeal.add(objDeal);
                }
                setRemoveEntity.add(en.id);
                objEntityInnerSelected = new EntityInnerSelected();
                objEntityInnerSelected.entityId = en.id;
                objEntityInnerSelected.strEntityName= en.Name;
                objEntityInnerSelected.Organizationdate = en.Organizational_Date__c;
                lstEntityInnerSelected.add(objEntityInnerSelected);                           
            }            
            insert lstDeal;
        } 
        
        
     
        
           
        Pagereference P = new Pagereference ('/apex/CreateSubscription?id='+oppid);
        //P.setRedirect(True);
        return P;
        
           
            
    
    }
    
    /*Public Pagereference SaveandNew(){        
        if(objEntity != null){
            insert objEntity;
            
            EntityId = objEntity.id;            
            List<Entities__c> lstEntity = [select id,Name,Primary_Client__c,Entity_Type__c from Entities__c where id =: EntityId];
            
            for(Entities__c e :lstEntity){
               objDeal = new Deals_Entities__c(Deals__c = oppid, Entity__c = EntityId);  
               lstDeal.add(objDeal);
            }
            
            insert lstDeal;
        }        
        Pagereference P = new Pagereference ('/apex/NewEntityPageSubStep1?id='+oppid);
        P.setRedirect(True);
        return P;
    }*/
  
    
    
}