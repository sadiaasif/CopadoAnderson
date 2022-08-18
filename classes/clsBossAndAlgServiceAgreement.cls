Public class clsBossAndAlgServiceAgreement{

    public clsBossAndAlgServiceAgreement(ApexPages.StandardController controller) {
        System.debug('*************'+apexPages.CurrentPage().geturl());
        OppID = apexPages.CurrentPage().getParameters().get('OppID');
        System.debug('*************'+OppID);   
        visaCard = false;
        AmexCard = false;
        MasterCard = false;
        DiscoverCard = false;
        PaymentMethodCard = false;
        PaymentMethodCheck = false;
        LoadData();
    }


    Public List<Opportunity> lstopp;
    Public String OppID{get;set;}
    Public decimal AlgTotalPrice{get;set;}
    Public decimal BossTotalPrice{get;set;}    
    Public Opportunity objOpp ;
    Public boolean visaCard{get;set;}
    Public boolean AmexCard{get;set;}
    Public boolean MasterCard{get;set;}
    Public boolean DiscoverCard{get;set;}
    
    Public boolean PaymentMethodCard{get;set;}
    Public boolean PaymentMethodCheck{get;set;}    
    
   
    Public Opportunity getobjOpp() {
        lstopp = new List<Opportunity> ();
        if( objOpp == null) {
            objOpp = new Opportunity();
            LoadData();
        }
        return objOpp;
    }

    Public void LoadData(){       
        lstopp = new List<Opportunity> ();
        if(NVL(OppID) != ''){
           lstopp = [select id, Name,AccountId,Account.Name,CloseDate, ChargentSFA__Billing_Address__c, ChargentSFA__Billing_City__c, ChargentSFA__Billing_Company__c,ChargentSFA__Billing_Country__c, ChargentSFA__Billing_Email__c,ChargentSFA__Billing_Fax__c,ChargentSFA__Billing_First__c,ChargentSFA__Billing_Last__c,ChargentSFA__Billing_Phone__c,ChargentSFA__Billing_Postcode__c,ChargentSFA__Billing_State__c,ChargentSFA__Billing_Zip__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Name__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Type__c,ChargentSFA__Charge_Amount__c,ChargentSFA__OrderNumber__c,ChargentSFA__Balance_Due__c,ChargentSFA__Bank_Account_Name__c,ChargentSFA__Bank_Account_Number__c,ChargentSFA__Bank_Account_Type__c,ChargentSFA__Bank_Name__c,ChargentSFA__Bank_Routing_Number__c,ChargentSFA__Payment_End_Date__c,ChargentSFA__Payment_Count__c,ChargentSFA__Payment_Frequency__c,ChargentSFA__Payment_Method__c,ChargentSFA__Payment_Received__c,ChargentSFA__Payment_Start_Date__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_Stop__c,ChargentSFA__PO_Number__c,(Select id,ServiceDate,ListPrice,Quantity,UnitPrice,TotalPrice,Product_Entity_Type__c,Product_Family__c,priceBookEntry.Product2.Name from OpportunityLineitems order by TotalPrice desc) From Opportunity where Id =: OppID];
           
           decimal Count = 0.00;
           AlgTotalPrice = 0.00;
           BossTotalPrice = 0.00;
                  
           if(lstopp != null && lstopp.size()>0){
               for(Opportunity op : lstopp){   
                   for(OpportunityLineitem opl : op.OpportunityLineitems){
                       count += opl.TotalPrice;
                       AlgTotalPrice = count;
                       BossTotalPrice = count; 
                   }
                   
               }
                objopp= lstopp[0];
                
                if(objopp.ChargentSFA__Payment_Method__c == 'Credit Card')
                    PaymentMethodCard = true;   
                if(objopp.ChargentSFA__Payment_Method__c == 'Check')
                    PaymentMethodCheck = true;
                    
                    
                if(objopp.ChargentSFA__Payment_Method__c == 'Credit Card' && objopp.ChargentSFA__Card_Type__c == 'Visa')
                    visaCard = true;
                if(objopp.ChargentSFA__Payment_Method__c == 'Credit Card' && objopp.ChargentSFA__Card_Type__c == 'Mastercard')
                    MasterCard = true;
                if(objopp.ChargentSFA__Payment_Method__c == 'Credit Card' && objopp.ChargentSFA__Card_Type__c == 'Discover')
                    DiscoverCard = true;
                if(objopp.ChargentSFA__Payment_Method__c == 'Credit Card' && objopp.ChargentSFA__Card_Type__c == 'AMEX')
                    AMEXCard = true;
                
                system.debug('########### Found Opportunity: ' + objopp);
            }  
        }
    }

    
    String NVL(String val){
        if(val == null)
            return '';
        else
            return val.trim();
    } 
    
    Public Pagereference SendEmailAlgAgreement(){
        lstopp = new List<Opportunity> ();
        OppID = apexPages.CurrentPage().getParameters().get('OppID');
        System.debug('**********OppID'+OppID);
        lstopp = [select id, Name,AccountId,Account.Name,CloseDate, ChargentSFA__Billing_Address__c, ChargentSFA__Billing_City__c, ChargentSFA__Billing_Company__c,ChargentSFA__Billing_Country__c, ChargentSFA__Billing_Email__c,ChargentSFA__Billing_Fax__c,ChargentSFA__Billing_First__c,ChargentSFA__Billing_Last__c,ChargentSFA__Billing_Phone__c,ChargentSFA__Billing_Postcode__c,ChargentSFA__Billing_State__c,ChargentSFA__Billing_Zip__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Name__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Type__c,ChargentSFA__Charge_Amount__c,ChargentSFA__OrderNumber__c,ChargentSFA__Balance_Due__c,ChargentSFA__Bank_Account_Name__c,ChargentSFA__Bank_Account_Number__c,ChargentSFA__Bank_Account_Type__c,ChargentSFA__Bank_Name__c,ChargentSFA__Bank_Routing_Number__c,ChargentSFA__Payment_End_Date__c,ChargentSFA__Payment_Count__c,ChargentSFA__Payment_Frequency__c,ChargentSFA__Payment_Method__c,ChargentSFA__Payment_Received__c,ChargentSFA__Payment_Start_Date__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_Stop__c,ChargentSFA__PO_Number__c From Opportunity where Id =: OppID];
        System.debug('####lstopp1'+lstopp[0].ChargentSFA__Billing_Email__c);
        string oppEmail = lstopp[0].ChargentSFA__Billing_Email__c;
        if(oppEmail != '' && oppEmail != null){
            Pagereference p = new pagereference('/apex/AlgServiceAgreement?oppId='+OppID);
                    Blob pdf = Blob.Valueof('Test');
                    if(!Test.isRunningTest())
                        pdf = p.getContentAsPDF();
            
            
                
            String[] toAddresses = new string[]{oppEmail};
                
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            
            Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
                efa.setFileName('AlgServiceAgreement.Pdf');
                efa.setBody(pdf);
            
            email.setSubject('Anderson Agreement');
            email.setPlainTextBody('');
            email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
            email.setToAddresses(toAddresses);
            if(!(Test.isRunningTest())){
                Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
            }   
            
        }
        String strbackurl = '/' + OppID;
        Pagereference page = new Pagereference(strbackurl); 
        page.setredirect(true);
        return page;
    }
    
    Public Pagereference SendEmailBossAgreement(){
        lstopp = new List<Opportunity> ();
        OppID = apexPages.CurrentPage().getParameters().get('OppID');
        System.debug('**********OppID'+OppID);
        lstopp = [select id, Name,AccountId,Account.Name,CloseDate, ChargentSFA__Billing_Address__c, ChargentSFA__Billing_City__c, ChargentSFA__Billing_Company__c,ChargentSFA__Billing_Country__c, ChargentSFA__Billing_Email__c,ChargentSFA__Billing_Fax__c,ChargentSFA__Billing_First__c,ChargentSFA__Billing_Last__c,ChargentSFA__Billing_Phone__c,ChargentSFA__Billing_Postcode__c,ChargentSFA__Billing_State__c,ChargentSFA__Billing_Zip__c,ChargentSFA__Card_Month__c,ChargentSFA__Card_Year__c,ChargentSFA__Card_Name__c,ChargentSFA__Card_Number__c,ChargentSFA__Card_Type__c,ChargentSFA__Charge_Amount__c,ChargentSFA__OrderNumber__c,ChargentSFA__Balance_Due__c,ChargentSFA__Bank_Account_Name__c,ChargentSFA__Bank_Account_Number__c,ChargentSFA__Bank_Account_Type__c,ChargentSFA__Bank_Name__c,ChargentSFA__Bank_Routing_Number__c,ChargentSFA__Payment_End_Date__c,ChargentSFA__Payment_Count__c,ChargentSFA__Payment_Frequency__c,ChargentSFA__Payment_Method__c,ChargentSFA__Payment_Received__c,ChargentSFA__Payment_Start_Date__c,ChargentSFA__Payment_Status__c,ChargentSFA__Payment_Stop__c,ChargentSFA__PO_Number__c From Opportunity where Id =: OppID];
        System.debug('####lstopp2'+lstopp[0].ChargentSFA__Billing_Email__c);
        string oppEmail = lstopp[0].ChargentSFA__Billing_Email__c;
        if(oppEmail != '' && oppEmail != null){
            Pagereference p = new pagereference('/apex/BossServiceAgreement?oppId='+OppID);
                    Blob pdf = Blob.Valueof('Test');
                    if(!Test.isRunningTest())
                        pdf = p.getContentAsPDF();
                        
            String[] toAddresses = new string[]{oppEmail};
                
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            
            Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
                efa.setFileName('BossServiceAgreement.Pdf');
                efa.setBody(pdf);
            
            email.setSubject('Boss Agreement');
            email.setPlainTextBody('');
            email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
            email.setToAddresses(toAddresses);
            if(!(Test.isRunningTest())){
             	Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});   
            }   
            
        }
        String strbackurl = '/' + OppID;
        
        Pagereference page = new Pagereference(strbackurl); 
        page.setredirect(true);
        return page;
    }
    
    static testMethod void testPageMethods() {
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

         Opportunity opp1 = new Opportunity();
             opp1.Name = 'test';
             opp1.AccountId = acc.id;
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
             opp1.ChargentSFA__Payment_Method__c = 'Check';
             opp1.ChargentSFA__Billing_Email__c = 'test@test.com';
             opp1.ChargentSFA__Payment_Count__c = 2;             
             opp1.ChargentSFA__Card_Month__c = '12';
             opp1.ChargentSFA__Card_Year__c = '2015';
             opp1.ChargentSFA__Card_Name__c = acc.Name;
             opp1.ChargentSFA__Card_Number__c = '4111111111111111';
             opp1.ChargentSFA__Payment_Start_Date__c = system.today();
             opp1.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
             opp1.ChargentSFA__Payment_Stop__c = 'Count';
             opp1.ChargentSFA__Payment_Status__c = 'Partial';
             opp1.ChargentSFA__Payment_Frequency__c = 'Daily';
             opp1.ChargentSFA__Payment_Status__c = 'Recurring';
             insert opp1;
             
         Opportunity opp2 = new Opportunity();
             opp2.Name = 'test';
             opp2.AccountId = acc.id;
             opp2.CloseDate = System.today();
             opp2.StageName = 'Prospecting';
             opp2.Amount = 1079.90;             
             opp2.Entity_Type__c = 'S-Corporation';
             opp2.Entrity_Name__c = 'Test';
             opp2.ChargentSFA__Billing_Address__c = 'Test';
             opp2.ChargentSFA__Billing_City__c = 'Test';
             opp2.ChargentSFA__Billing_Company__c = 'Test';
             opp2.ChargentSFA__Billing_Country__c = 'Test';
             opp2.ChargentSFA__Billing_State__c = 'test';
             opp2.ChargentSFA__Billing_Fax__c = '123456';
             opp2.ChargentSFA__Billing_First__c = 'test';
             opp2.ChargentSFA__Billing_Last__c = 'test';
             opp2.ChargentSFA__Billing_Phone__c = '1234567890';
             opp2.ChargentSFA__Billing_Postcode__c = '123456';           
             opp2.ChargentSFA__Billing_Email__c = 'test@test.com';
             opp2.ChargentSFA__Payment_Method__c = 'Credit Card';
             opp2.ChargentSFA__Card_Type__c = 'Mastercard';             
             opp2.ChargentSFA__Payment_Count__c = 2;             
             opp2.ChargentSFA__Card_Month__c = '12';
             opp2.ChargentSFA__Card_Year__c = '2015';
             opp2.ChargentSFA__Card_Name__c = acc.Name;
             opp2.ChargentSFA__Card_Number__c = '4111111111111111';
             opp2.ChargentSFA__Payment_Start_Date__c = system.today();
             opp2.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
             opp2.ChargentSFA__Payment_Stop__c = 'Count';
             opp2.ChargentSFA__Payment_Status__c = 'Partial';
             opp2.ChargentSFA__Payment_Frequency__c = 'Daily';
             opp2.ChargentSFA__Payment_Status__c = 'Recurring';
             
             
             
             insert opp2;
         
         Opportunity opp3 = new Opportunity();
             opp3.Name = 'test';
             opp3.AccountId = acc.id;
             opp3.CloseDate = System.today();
             opp3.StageName = 'Prospecting';          
             opp3.Amount = 1079.90;             
             opp3.Entity_Type__c = 'S-Corporation';
             opp3.Entrity_Name__c = 'Test';
             opp3.ChargentSFA__Billing_Address__c = 'Test';
             opp3.ChargentSFA__Billing_City__c = 'Test';
             opp3.ChargentSFA__Billing_Company__c = 'Test';
             opp3.ChargentSFA__Billing_Country__c = 'Test';
             opp3.ChargentSFA__Billing_State__c = 'test';
             opp3.ChargentSFA__Billing_Fax__c = '123456';
             opp3.ChargentSFA__Billing_First__c = 'test';
             opp3.ChargentSFA__Billing_Last__c = 'test';
             opp3.ChargentSFA__Billing_Phone__c = '1234567890';
             opp3.ChargentSFA__Billing_Postcode__c = '123456';
             opp3.ChargentSFA__Billing_Email__c = 'test@test.com';
             opp3.ChargentSFA__Payment_Method__c = 'Credit Card';
             opp3.ChargentSFA__Card_Type__c = 'Discover';
             opp3.ChargentSFA__Payment_Count__c = 2;             
             opp3.ChargentSFA__Card_Month__c = '12';
             opp3.ChargentSFA__Card_Year__c = '2015';
             opp3.ChargentSFA__Card_Name__c = acc.Name;
             opp3.ChargentSFA__Card_Number__c = '4111111111111111';
             opp3.ChargentSFA__Payment_Start_Date__c = system.today();
             opp3.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
             opp3.ChargentSFA__Payment_Stop__c = 'Count';
             opp3.ChargentSFA__Payment_Status__c = 'Partial';
             opp3.ChargentSFA__Payment_Frequency__c = 'Daily';
             opp3.ChargentSFA__Payment_Status__c = 'Recurring';
             
             insert opp3;
         
         Opportunity opp4 = new Opportunity();
             opp4.Name = acc.Name;
             opp4.AccountId = acc.id;
             opp4.CloseDate = System.today().addmonths(1);             
             opp4.Amount = 1079.90;
             opp4.StageName = 'Prospecting';
             opp4.Entity_Type__c = 'S-Corporation';
             opp4.Entrity_Name__c = 'Test';
             opp4.ChargentSFA__Billing_Address__c = 'Test';
             opp4.ChargentSFA__Billing_City__c = 'Test';
             opp4.ChargentSFA__Billing_Company__c = 'Test';
             opp4.ChargentSFA__Billing_Country__c = 'Test';
             opp4.ChargentSFA__Billing_State__c = 'test';
             opp4.ChargentSFA__Billing_Fax__c = '123456';
             opp4.ChargentSFA__Billing_First__c = 'test';
             opp4.ChargentSFA__Billing_Last__c = 'test';
             opp4.ChargentSFA__Billing_Phone__c = '1234567890';
             opp4.ChargentSFA__Billing_Postcode__c = '123456';
             opp4.ChargentSFA__Billing_Email__c = 'test@test.com';
             opp4.ChargentSFA__Payment_Method__c = 'Credit Card';
             opp4.ChargentSFA__Card_Type__c = 'AMEX';
             opp4.ChargentSFA__Payment_Count__c = 2;             
             opp4.ChargentSFA__Card_Month__c = '12';
             opp4.ChargentSFA__Card_Year__c = '2015';
             opp4.ChargentSFA__Card_Name__c = acc.Name;
             opp4.ChargentSFA__Card_Number__c = '4111111111111111';
             opp4.ChargentSFA__Payment_Start_Date__c = system.today();
             opp4.ChargentSFA__Payment_End_Date__c = system.today().adddays(2);
             opp4.ChargentSFA__Payment_Stop__c = 'Count';
             opp4.ChargentSFA__Payment_Status__c = 'Partial';
             opp4.ChargentSFA__Payment_Frequency__c = 'Daily';
             opp4.ChargentSFA__Payment_Status__c = 'Recurring';
             insert opp4;
        
       
         Product2 P = new Product2();
            P.Name = 'test';
            P.Family = 'BOSS';
            P.Name = 'test';
            P.Entity_Type__c = 'C-Corp';
        	P.Type__c = 'Amendment';
        	P.Service_Fulfillment_Weight__c = '1';
            insert p;
         
         //PricebookEntry pbe = [select id, Product2Id  from PricebookEntry where Product2Id = :System.Label.ProductId limit 1];
        
        PricebookEntry pbe = new PricebookEntry();
        pbe.Pricebook2Id=Test.getStandardPricebookId();
        pbe.Product2Id=p.id;
        pbe.UnitPrice=3000;
        pbe.UseStandardPrice=false;
        pbe.isActive=true;//Add this line
        insert pbe;
        
         System.debug('**********'+pbe);
         
         OpportunityLineitem opl = new OpportunityLineitem();
             opl.OpportunityId = opp.id; 
             opl.Product_Entity_Type__c = P.Entity_Type__c;
             opl.Product_Family__c = P.Family ;   
             opl.priceBookEntryId = pbe.Id;    
             opl.Quantity = 1;
             opl.UnitPrice = 25;
             //insert opl;
         
                  
         ApexPages.StandardController con = new ApexPages.StandardController(opp);
         clsBossAndAlgServiceAgreement cls = new clsBossAndAlgServiceAgreement(con);
           
           cls.getobjOpp();
           apexPages.CurrentPage().getParameters().put('OppID', opp.Id);
           cls.OppID = opp.id;
           cls.LoadData();
           cls.OppID = opp1.id;
           cls.LoadData();
           cls.OppID = opp2.id;
           cls.LoadData();
           cls.OppID = opp3.id;
           cls.LoadData();
           cls.OppID = opp4.id;
           cls.LoadData();
           
           //cls.getobjOpp();
           
            String opportunityId = opp4.id; 
            System.debug('####opp4###'+opp4.ChargentSFA__Billing_Email__c);
            System.debug('####opportunityId###'+opportunityId);
        
            Opportunity lstopp = [select id, Name,ChargentSFA__Billing_Email__c From Opportunity where Id =: opportunityId limit 1];
            System.debug('####lstopp1###'+lstopp);
            string oppEmail = lstopp.ChargentSFA__Billing_Email__c; 
            System.debug('####oppEmail###'+oppEmail);
            apexPages.CurrentPage().getParameters().put('OppID', opportunityId);
            cls.SendEmailAlgAgreement();          
           apexPages.CurrentPage().getParameters().put('OppID', opportunityId);
           cls.SendEmailBossAgreement();          
           
          
        
    }
}