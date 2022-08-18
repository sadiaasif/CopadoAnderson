/**
* A controller class is used to recieve data from the external application through api's.
* 
* @author Dushyanth Betav
* @version 1.0 - October 03, 2019
*/
global with sharing class TaxReturnController {  
    public static integer dropdownvalue{get;set;}
    String chkType = '';
    String yeardate;
    Public String entId{get; set;} 
    Public static String lstEntName{get; set;}
    public static String TaxForm{get;set;}
    public Map<String, List<String>> txLstR{get;set;}
    public List<String> keys {get ; set;}
    public static String sCode;
    List<Entities__c> entList=new List<Entities__c>();
    Public LIST<String> EfileDate {get; set;}
    Public LIST<String> ExtensionDate {get; set;}
    //public Map<String, List<String>> taxMap {get;set;}
    Public Map<String, Map<String,  List<String>>> testMap  {get;set;}
    Public Map<String, Map<String, String>> testMap2  {get;set;}  //valid
    Public Map<String, List<Map<String, String>>> testMap3  {get;set;}
    Public List<Map<String, String>> txLst4 {get;set;}
    Public list<string> str{get;set;}
    Public String F{get; set;}
    public TaxReturnController(ApexPages.StandardController controller)
    {  
        str = new list<string>{'Efile'};
            entId = apexpages.currentpage().getparameters().get('id');
        System.debug('List of entites:'+entId);
        entList=[SELECT id,Name,Tax_Form__c FROM Entities__c where id=:entId];
        System.debug('entList===='+entList);
        for(Entities__c ent:entList)
        {
            lstEntName=ent.Name;
            TaxForm=ent.Tax_Form__c;
        }
        system.debug('testMap+++' + testMap);   
        String cd = '';
    }
    
    public List<SelectOption> getdynamiclist() {
        List<SelectOption> options = new List<SelectOption>();
        for (Integer i = System.Today().year(); i > System.Today().year()-3; i--)
        {   
            System.debug('i value is='+i);
            options.add(new SelectOption(String.valueOf(i), String.valueOf(i)));
            System.debug('options='+options);
        }
        return options;
    }
    public PageReference executeDML()
    {
        Integer taxYear;
        System.debug('dropdownvalue===='+dropdownvalue);
        if(dropdownvalue != null){
            taxYear = dropdownvalue;
        } else {
            taxYear = Integer.valueOf(Date.Today().Year() - 1);
        }
        getPerformcallout(taxYear); 
        
        return null;
    }
    
    /* This method is used to authenticate the external application and access the token.
* 
* @author  Dushyanth Betav
* @version 1.0 - October 03, 2019
*/
    
    public static String authenticate() {      
        String requestEndPoint='https://api.cchaxcess.com/api/AuthService/v1.0/Authenticate';
        Http http=new Http();
        String TokenId;
        Map<String,Object> results=new Map<String,Object>();
        HttpRequest request=new HttpRequest();
        request.setEndpoint(requestEndPoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('IntegratorKey','D69805F7-3C87-4524-92C2-D2043D40F385');
        request.setBody('{"UserName":"webmaster","UserSid":"webmaster","Password":"Anderson123!","Realm":"149078"}');
        HttpResponse response=http.send(request);
        if(response.getStatusCode()==200)
        {
            system.debug('response.getBody()=='+response.getBody());
            results=(Map<String,object>)JSON.deserializeUntyped(response.getBody());
            TokenId=String.valueOf(results.get('Token'));
        }
        return TokenId;
    }
    /**
* This method is used to access the GetReturns and returns the Return Id of particular Entity.
* 
* @author  Dushyanth Betav
* @version 1.0 - October 03, 2019
*/
    
    public static String fetchReturnId(Integer Year)
    {    
        String EntName='';
        String fCode='';
        String sCode = '';	
        String ReturnId = '';
        String entityName = '';
        String Rid = '';
        String etTaxForm ='';
        String etId = apexpages.currentpage().getparameters().get('id');
        List<Entities__c> entLst=[SELECT id,Name,Tax_Form__c FROM Entities__c where id=:etId];
        System.debug('entList===='+entLst);
        for(Entities__c ent:entLst)
        {
            EntName=ent.Name;
            etTaxForm = ent.Tax_Form__c;
        }
        Map<String, String> Codes= new Map<String, String>();
        {
            Codes.put('1040','I');
            Codes.put('1065','P');
            Codes.put('1041','F');
            Codes.put('1120','C');
            Codes.put('1120S','S');
            Codes.put('990','X');
            Codes.put('5500','K');
            Codes.put('4868','Q');
            Codes.put('7004P','V');
            Codes.put('7004F','W');
            Codes.put('7004C','T');
            Codes.put('7004S','U');
            Codes.put('8868','Y');
            
        }
        if(etTaxForm!=''){
            fCode=etTaxForm;
            sCode=Codes.get(fCode);
        }
        else{
            sCode='';
        }
        
        system.debug('etTaxForm = ' + etTaxForm);
        String tokenId;
        if(sCode != ''){
            if(!test.isRunningTest()){
                tokenId = authenticate();
            } else {
                tokenId = '<json:JSon xmlns:json="http://www.cch.com">{"A":["uuid-b1707563-48a9-4c9e-a685-c812e08a8ad2","2019-09-05T13:45:48.000Z","2019-09-05T13:45:48.000Z","2019-09-05T14:02:48.000Z","CchInternet","2019-09-05T13:45:48.000Z","BqEu5ypFWs/GvsFAS3TDpXPLdfs=","L/A59BvyWJ6x4cyMQKfW74sH4pCYVgehafNvyixwGgyg2Xom2BHHW617cK6zGibpGuLrMq3LRIs/Mcd4fpsuVEPDbRaRfe0SpqsS1fgdK0jmh6U1r9VxiXVO/xRFaDd7760Ufa8tldvg1kkT6hCy9SnT9Ky/dChewqU6YQkC6OgT56esa/E/Gg2u1nqzeevzwBb0NShXimLZFaLb1XpZSC4dm0zDOS7w1lqLHE3ADBjkt7f8UngA46ARNot5lZyycsr/agDLY8rd7faurG7nWzFfTjx1LniIQVfHisGhGVg8uNY5jdXyssr0TKbBzgjVMzd6oea3Q3EmnY8YvJUbLA==","rWwcAwif++kmBnx5Q+tvbxHxaWsaMj5SnSFSJlhzIXj05y6X+IE8EG7pNYeD0hBcPxRVAwZsagEdG5ZddfF3Glmz+8yMCRUGznWjDpOVY/Ogh0ZiKvWUA/eq0dsD8gbLR/ISE5s7m5EOmL2SsLtkspeGIez9ckNT0K9Nxwi16HTpXjH64Zk0u8CorQjcJwA6nI0P1Ucu1KsrHn4iULQto58A15EQhXuQRuXnc1wFzzLBzhe5fcvrS+RK4sLic227KmoFm/BlfDh8v+egyxLDnB9e2hB1jh7ybEoQ5+8nPgpzLQXFTwr9UH+GE5B/x4WWjry4BvU7UEy/P2vwsBqMHw==","AQAB"],"C":["http://www.cch.com","l","webmaster","a","149078","u","c981e363-e5b3-4c38-9424-512005aae6c3","f","d69805f7-3c87-4524-92c2-d2043d40f385","k","a02db1a7-45ba-4916-94af-23f9078ef4e5","i","T","s","19e21681-6046-4aa8-a0c0-07d778751523","m","CchInternet","cf","09/05/2019 08:45:48","ct","09/05/2019 09:02:48"]}</json:JSon>';
            }
            List<string> lst = new List<string>();
            List<Object> lstObject;
            Map<String,Object> clientMap=new Map<String,Object>();
            String requestEndPoint2='https://api.cchaxcess.com/api/TaxService/v1.0/GetReturns';
            System.debug('token id======='+tokenId);
            for (Integer i = 1; i <= 3; i++){
                String setBody='{"TaxYear":'+Year+',"TaxProduct":"'+sCode+'","PageSize":2500,"PageIndex":'+i+'}';
                //String setBody = '{"TaxYear":'+Year+',"TaxProduct":"X","PageSize":2500,"PageIndex":'+i+'}';
                system.debug('setBody == ' + setBody);
                Http http=new Http();
                HttpRequest request=new HttpRequest();
                request.setEndpoint(requestEndPoint2);
                request.setMethod('POST');
                request.setHeader('Content-Type', 'application/json;charset=UTF-8');
                request.setHeader('IntegratorKey','D69805F7-3C87-4524-92C2-D2043D40F385');
                request.setHeader('Security',tokenId);
                request.setBody(setBody);
                request.setTimeout(120000);
                HttpResponse response=http.send(request);
                system.debug('*** response = '+response.getBody());
                List<Object> myMapObjects = new List<Object>();
                if(response.getBody() != null && response.getBody() != '') {
                    Map<String,Object> jsonMap = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
                    //Map<String, String> myMaps = new Map<String, String>();
                    myMapObjects = (List<Object>) jsonMap.get('Returns');
                    System.debug('**** myMapObjects= '+myMapObjects);
                }
                
                for (Object obj : myMapObjects) {
                    clientMap = (Map<String,Object>)obj;
                    System.debug('**** clientMap = '+clientMap);
                    entityName = String.valueof(clientMap.get('Name'));
                    System.debug('**** entityName = '+entityName);
                    Rid = String.valueof(clientMap.get('ReturnId')); 
                    System.debug('**** Rid= '+Rid);
                    if(entityName == EntName){
                        System.debug('**** entityName = '+entityName);
                        ReturnId = Rid;
                    }
                }
                
                if(ReturnId != ''){
                    break;
                } else {
                    continue;
                }
            }
        }
        
        system.debug('ReturnId == ' + ReturnId);
        return ReturnId;  
    }
    /**
* This method is used to access the ElfStatus information based on the ReturnId.
* 
* @author  Dushyanth Betav
* @version 1.0 - October 03, 2019
*/
    public Map<String, Map<String,  List<String>>> getPerformcallout(Integer Year)    
    { 
        system.debug('Year ==== '+ Year);
        //system.debug('dropdownvalue '+dropdownvalue);
        List<SelectOption> accOptions= new List<SelectOption>();  
        System.debug('call select box on page'+accOptions);
        string BankInfo;
        string CalcVersion;
        string CategoryofReturn;
        string DueDate;
        string ESign;
        string EinSsn;
        string ElecDebitElecDeposit;
        string FiscalYearBeginDate;
        string FiscalYearEndDate;
        string RefundDue;
        string ReturnGuid;
        string ReturnId;
        string SignFormReceivedDate;
        string Status;
        string SubmissionID;
        string SummaryStatus;
        string Tin;
        string TypeOfReturn;
        string UnitType;
        string StatusDate;
        string Unit;
        String ClientID;
        string ClientSubordinateID;
        string ClientName;
        String tokenId;
        String ClientReturnId;
        string AccountNo;
        testMap2 = new Map<String, Map<String, String>> (); //valid
        testMap3 = new  Map<String, List<Map<String, String>>>();
        List<string> Elfdatalist = new List<string>();
        Map<String,Object> clientMap=new Map<String,Object>();
        list<string> clientData= new List<string>();
        txLstR = new Map<String, List<String>>();
        txLstR.put('ReturnId' , new List<String>());
        txLstR.put('ReturnGuid' , new List<String>());
        txLstR.put('Tin' , new List<String>());
        txLstR.put('CalcVersion' , new List<String>());
        System.debug('txLstR=='+txLstR);
        Map<String,Object> ElfList=new Map<String,Object>();
        Map<String, List<String>> txLst = new Map<String, List<String>>();
        txLst4 = new List<Map<String, String>>();
        txLst.put('FiscalYearBeginDate', new List<String>());
        txLst.put('FiscalYearEndDate', new List<String>());
        txLst.put('DueDate' , new List<String>());
        txLst.put('UnitType' , new List<String>());
        txLst.put('SummaryStatus' , new List<String>());
        Map<String, Map<String, List<String>>> testMapss = new Map<String, Map<String,  List<String>>>();
        if(!test.isRunningTest()){
            tokenId = authenticate();
        } else {
            tokenId = '<json:JSon xmlns:json="http://www.cch.com">{"A":["uuid-b1707563-48a9-4c9e-a685-c812e08a8ad2","2019-09-05T13:45:48.000Z","2019-09-05T13:45:48.000Z","2019-09-05T14:02:48.000Z","CchInternet","2019-09-05T13:45:48.000Z","BqEu5ypFWs/GvsFAS3TDpXPLdfs=","L/A59BvyWJ6x4cyMQKfW74sH4pCYVgehafNvyixwGgyg2Xom2BHHW617cK6zGibpGuLrMq3LRIs/Mcd4fpsuVEPDbRaRfe0SpqsS1fgdK0jmh6U1r9VxiXVO/xRFaDd7760Ufa8tldvg1kkT6hCy9SnT9Ky/dChewqU6YQkC6OgT56esa/E/Gg2u1nqzeevzwBb0NShXimLZFaLb1XpZSC4dm0zDOS7w1lqLHE3ADBjkt7f8UngA46ARNot5lZyycsr/agDLY8rd7faurG7nWzFfTjx1LniIQVfHisGhGVg8uNY5jdXyssr0TKbBzgjVMzd6oea3Q3EmnY8YvJUbLA==","rWwcAwif++kmBnx5Q+tvbxHxaWsaMj5SnSFSJlhzIXj05y6X+IE8EG7pNYeD0hBcPxRVAwZsagEdG5ZddfF3Glmz+8yMCRUGznWjDpOVY/Ogh0ZiKvWUA/eq0dsD8gbLR/ISE5s7m5EOmL2SsLtkspeGIez9ckNT0K9Nxwi16HTpXjH64Zk0u8CorQjcJwA6nI0P1Ucu1KsrHn4iULQto58A15EQhXuQRuXnc1wFzzLBzhe5fcvrS+RK4sLic227KmoFm/BlfDh8v+egyxLDnB9e2hB1jh7ybEoQ5+8nPgpzLQXFTwr9UH+GE5B/x4WWjry4BvU7UEy/P2vwsBqMHw==","AQAB"],"C":["http://www.cch.com","l","webmaster","a","149078","u","c981e363-e5b3-4c38-9424-512005aae6c3","f","d69805f7-3c87-4524-92c2-d2043d40f385","k","a02db1a7-45ba-4916-94af-23f9078ef4e5","i","T","s","19e21681-6046-4aa8-a0c0-07d778751523","m","CchInternet","cf","09/05/2019 08:45:48","ct","09/05/2019 09:02:48"]}</json:JSon>';
        }
        if(!test.isRunningTest())
        {
            ClientReturnId = fetchReturnId(Year);
        }
        else
        {
            ClientReturnId='2018X:Habitat for Vet.1120T:V1';
        }
        //ClientReturnId='2018X:Habitat for Vet.1120T:V1';
        if(ClientReturnId != null && ClientReturnId != '') {
            String encodededRI = EncodingUtil.urlEncode(ClientReturnId, 'UTF-8');
            system.debug('encodeded = ' + encodededRI);
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://api.cchaxcess.com/api/ElfStatusService/v1.0/ElfStatus/Return?id='+encodededRI);
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setHeader('IntegratorKey','D69805F7-3C87-4524-92C2-D2043D40F385');
            request.setHeader('Security',tokenId);
            HttpResponse response = http.send(request);
            System.debug('respose'+response);
            // If the request is successful, parse the JSON response.
            if (response.getStatusCode() == 200 && response.getBody()!=null) {
                System.debug('Elf Response'+response.getBody());
                Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(response.getBody()); //re is response body string
                List<Object> lstObject = (List<Object>)m.get('ElfStatusList');
                System.debug('ElfStatusList=='+lstObject);
                Elfdatalist=new list<string>();
                Integer chkRandomeNo = 0;
                List<TaxReturn__c> taxReturnList = new  List<TaxReturn__c>();
                //TaxReturn__c taxObj = new TaxReturn__c();
                for(Object result :lstObject) {
                    TaxReturn__c taxObj = new TaxReturn__c();
                    chkType = '';
                    ElfList = (Map<String,Object>)result;
                    system.debug('ElfList = ' + ElfList);
                    CategoryofReturn = string.valueof(ElfList.get('CategoryofReturn'));
                    TypeOfReturn = String.valueof(ElfList.get('TypeOfReturn'));
                    if(CategoryofReturn == '1'){
                        system.debug('Inside COR');
                        if(TypeOfReturn == '1'){
                            system.debug('Inside TOR1');
                            chkType = 'Efile';
                        }
                        if(TypeOfReturn == '4'){
                            system.debug('Inside TOR2');
                            chkType = 'Extension';
                        }
                        //*******FiscalYearBeginDate**********************//;
                        string fb= String.valueof(ElfList.get('FiscalYearBeginDate'));
                        system.debug('fb1=='+fb);
                        fb = fb.replaceAll('[^0-9\\s+]', '');
                        system.debug('fb2=='+fb);
                        fb=fb.substring(0,fb.length()-4);
                        system.debug('fb3=='+fb);
                        fb=String.valueof(datetime.newinstance(long.valueOf(fb)));
                        system.debug('fb4=='+fb);
                        fb=String.valueOf((fb).removeEnd('22:00:00'));
                        String FiscalYearBeginDateWithTime = fb+' 00:00:00'; 
                        //*******FiscalYearEndDate******************************//;
                        string fe= String.valueof(ElfList.get('FiscalYearEndDate'));
                        fe = fe.replaceAll('[^0-9\\s+]', '');
                        fe=fe.substring(0,fe.length()-4);
                        fe=String.valueof(datetime.newinstance(long.valueOf(fe)));
                        fe=String.valueOf((fe).removeEnd('22:00:00'));
                        String FiscalYearEndDateWithTime = fe+' 00:00:00';
                        string td= String.valueof(ElfList.get('DueDate'));
                        td = td.replaceAll('[^0-9\\s+]', '');
                        td=td.substring(0,td.length()-4);
                        td=String.valueof(datetime.newinstance(long.valueOf(td)));
                        td=String.valueOf((td).removeEnd('22:00:00'));
                        //*******Due Date************//;                        
                        string fd= String.valueof(ElfList.get('DueDate'));
                        system.debug('fd1=='+fd);
                        fd = fd.replaceAll('[^0-9\\s+]', '');
                        system.debug('fd2=='+fd);
                        fd=fd.substring(0,fd.length()-4);
                        system.debug('fd3=='+fd);
                        fd=String.valueof(datetime.newinstance(long.valueOf(fd)));
                        system.debug('fb4=='+fd);
                        fd=String.valueOf((fd).removeEnd('22:00:00'));
                        String DueDateDateWithTime = fd+' 00:00:00';
                        txLst.get('FiscalYearBeginDate').add(fb);
                        txLst.get('FiscalYearEndDate').add(fe);
                        txLst.get('DueDate').add(fd);
                        txLst.get('DueDate').add(td);
                        txLst.get('UnitType').add(String.valueof(ElfList.get('UnitType')));
                        txLst.get('SummaryStatus').add(String.valueof(ElfList.get('SummaryStatus')));
                        Map<String, String> txLst2  = new Map<String, String>();//valid
                        txLst2.put('FiscalYearBeginDate', fb);
                        txLst2.put('FiscalYearEndDate', fe);
                        txLst2.put('DueDate', td);
                        txLst2.put('UnitType', String.valueof(ElfList.get('UnitType')));
                        txLst2.put('SummaryStatus', String.valueof(ElfList.get('SummaryStatus')));
                        keys=new list<string>{'ReturnId','ReturnGuid','Tin', 'CalcVersion'};
                            System.debug('keys'+keys);
                        txLstR.get('ReturnId').add(String.valueof(ElfList.get('ReturnId')));
                        txLstR.get('ReturnGuid').add(String.valueof(ElfList.get('ReturnGuid')));
                        txLstR.get('Tin').add(String.valueof(ElfList.get('Tin')));
                        txLstR.get('CalcVersion').add(String.valueof(ElfList.get('CalcVersion')));
                        System.debug('txLstR=='+txLstR);
                        /*********************@Deepeshk Code************************/
                        taxObj.FiscalYearBeginDate__c =  datetime.valueof(FiscalYearBeginDateWithTime);
                        taxObj.FiscalYearEndDate__c =  datetime.valueof(FiscalYearEndDateWithTime);
                        taxObj.DueDate__c= datetime.valueOf(DueDateDateWithTime);
                        taxObj.AccountNo__c = Double.valueOf(ElfList.get('AccountNo'));
                        taxObj.ReturnId__c= String.valueof(ElfList.get('ReturnId'));
                        taxObj.SummaryStatus__c = String.valueof(ElfList.get('SummaryStatus'));
                        taxObj.CalcVersion__c  =  String.valueof(ElfList.get('CalcVersion'));
                        taxObj.Unit__c = String.valueof(ElfList.get('UnitType'));
                        taxObj.ReturnGuid__c = String.valueof(ElfList.get('ReturnGuid'));
                        taxObj.Tin__c = string.valueOf(ElfList.get('Tin'));
                        taxObj.CategoryofReturn__c = string.valueOf(ElfList.get('CategoryofReturn'));
                        taxObj.TypeOfReturn__c = Double.valueOf(ElfList.get('TypeOfReturn'));
                        taxObj.Unit__c= String.valueOf(ElfList.get('Unit'));
                        taxObj.UnitType__c= String.valueOf(ElfList.get('UnitType'));
                        taxObj.BankInfo__c= string.valueOf(ElfList.get('BankInfo'));
                        taxObj.ESign__c = string.valueOf(ElfList.get('ESign'));
                        taxObj.ElecDebitElecDeposit__c = string.valueOf(ElfList.get('ElecDebitElecDeposit'));
                        taxObj.ElecDebitElecDepositAmount__c = Double.valueOf(ElfList.get('ElecDebitElecDepositAmount'));
                        taxObj.FBarBsaID__c = string.valueOf(ElfList.get('FBarBsaID'));
                        taxObj.RefundDue__c =Double.valueOf(ElfList.get('RefundDue'));
                        taxObj.Status__c = Double.valueOf(ElfList.get('Status'));
                        taxObj.SubmissionID__c =String.valueof(ElfList.get('SubmissionID'));
                        taxObj.Primarykey__c=String.valueof(ElfList.get('ReturnId'))+String.valueOf(ElfList.get('Unit'))+String.valueof(ElfList.get('SubmissionID'));
                        taxReturnList.add(taxObj);
                        List<Map<String, String>> txLst3 = new List<Map<String, String>>();//ignore
                        testMapss.put(chkType, txLst);
                        testMap3.put(chkType, txLst3); // ignore
                        System.debug('*** txLst3 = '+txLst3);
                        System.debug('*** testMap3 = '+testMap3);  
                        
                        /***************@Deepeshk functinality implemented for show the data on Vf Page.*/
                        
                        if(testMap2.containsKey(chkType)) {
                            testMap2.put(chkType + String.valueOf(chkRandomeNo), txLst2);
                            System.debug('testMap2 = '+testMap2);  
                            chkRandomeNo = chkRandomeNo +1;
                        }
                        else {
                            testMap2.put(chkType, txLst2);
                        }
                        System.debug('*** testMap2 = '+testMap2);  
                    }
                }
                /*@DeepeshK Code...*/
                System.debug('**** to insert taxReturnList = '+taxReturnList);
                Database.UpsertResult[] results = Database.upsert(taxReturnList, TaxReturn__c.Primarykey__c);
                for(Integer index = 0, size = results.size(); index < size; index++) {
                    if(results[index].isSuccess()) {
                        if(results[index].isCreated()) {
                            system.debug('********results'+results);
                            System.debug(taxReturnList[index].Primarykey__c +' was created');
                        } else {
                            System.debug(taxReturnList[index].Primarykey__c +' was updated');
                        }
                    }
                } 
            }    
        }
        return testMapss;  
    }
}