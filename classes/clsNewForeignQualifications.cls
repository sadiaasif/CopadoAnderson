Public class clsNewForeignQualifications{

    Public Foreign_Qualifications__c objForeignQua {get;set;}
    Public String EntityId;
    Public string retURL;
    Public List<Entities__c> lstEntity;
    Public clsNewForeignQualifications(ApexPages.StandardController controller){
        objForeignQua = new Foreign_Qualifications__c();
        lstEntity = new List<Entities__c> ();
        EntityId = apexPages.CurrentPage().getParameters().get('EntityId');
    }
    
    Public Pagereference Save(){
        if(EntityId != '' && EntityId != null){
            lstEntity = [select id, name from Entities__c where id =: EntityId limit 1];
            
            if(objForeignQua != null){
                objForeignQua.Name =  lstEntity[0].Name +' - ' +objForeignQua.State__c;  
                objForeignQua.Entity__c = lstEntity[0].id;
                insert objForeignQua;
            }
        }
        retURL = '/'+ EntityId;          
        Pagereference P = new Pagereference (retURL);
        P.setRedirect(True);
        return P;
    }
    
    Public Pagereference SaveandNew(){
        if(EntityId != '' && EntityId != null){
            lstEntity = [select id, name from Entities__c where id =: EntityId limit 1];
            
            if(objForeignQua != null){
                objForeignQua.Name =  lstEntity[0].Name +' - ' +objForeignQua.State__c;  
                objForeignQua.Entity__c = lstEntity[0].id;
                insert objForeignQua;
            }
        }
        Pagereference P = new Pagereference ('/apex/CreateNewForeignQualifications?Id='+EntityId);
        P.setRedirect(True);
        return P;
    }
    
    Public Pagereference Cancel(){
    
        retURL = '/'+ EntityId;          
        Pagereference P = new Pagereference (retURL);
        P.setRedirect(True);
        return P;
    
    }
    
    /////////////// Test Method /////////////////
    static testMethod void testPageMethods() {
    
         Entities__c en = new Entities__c();
             en.Name = 'Test';
             insert en;
             
         Foreign_Qualifications__c fq = new Foreign_Qualifications__c();
             fq.Name =  en.Name; 
             fq.State__c = 'Test';
             fq.Entity__c = en.id;
         insert fq ;
         
         apexPages.CurrentPage().getParameters().put('EntityId',en.id); 
         
         ApexPages.StandardController con = new ApexPages.StandardController(fq);
         clsNewForeignQualifications cls = new clsNewForeignQualifications(con);
         cls.Save();
         cls.Cancel();   
         
         Entities__c en1 = new Entities__c();
             en1.Name = 'Test';
             insert en1;
             
         Foreign_Qualifications__c fq1 = new Foreign_Qualifications__c();
             fq1.Name =  en1.Name; 
             fq1.State__c = 'Test';
             fq1.Entity__c = en1.id;
         insert fq1 ;
         
         apexPages.CurrentPage().getParameters().put('EntityId',en1.id); 
         
         ApexPages.StandardController con1 = new ApexPages.StandardController(fq1);
         clsNewForeignQualifications cls1 = new clsNewForeignQualifications(con1);
         cls1.SaveandNew();
        
    
    }
}