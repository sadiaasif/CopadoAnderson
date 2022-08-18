public with sharing class copyNumberToAccountClass {
    
    public static void copyNumberToAccount(List<Contact> newRecordsList, List<Contact> oldRecordsList, Map<Id, Contact> newMap, Map<Id, Contact> oldMap){
        
        Integer count=0;
        set<ID> accID=new set<ID>();
        list<contact> conListPrimary=new list<contact>();
        list<contact> conList=new list<contact>();
        map<id,account>  accIDMap=new map<id,account>();
        map<id,list<Contact>>  accContactMap=new map<id,list<Contact>>();
        
        map<Account,list<Contact>>  accountPrimaryContactMap=new map<Account,list<Contact>>();
        map<Account,list<Contact>>  accountContactMap=new map<Account,list<Contact>>();
        
        map<id,integer>  contactMap=new map<id,integer>();
        list<Account> listOfAccountToUpdate=new list<Account>();
        
        
        set<ID> conID=new  set<ID>();
        
        for(Contact con : newRecordsList){
            
            system.debug('account id is'+con.AccountID);
            
            if(con.accountID!=null){
                
                accID.add(con.accountID);
                
            }
        }
        
        if(!accID.isEmpty()){
            
            for( Account acc : [select id,name,Phone_1__c,Phone_2__c,Phone_3__c,Phone_4__c,(select id,name,phone,MobilePhone,Account_Roles__c from contacts where  (Account_Roles__c='Primary Contact' OR phone!=null or MobilePhone!=null ) Order by CreatedDate Desc) from account where id=:accID] ){
                
                accountPrimaryContactMap.put(acc,acc.Contacts);
                
            }
            
            
        }
        
        System.debug('account contact map is'+accountPrimaryContactMap);
        System.debug('account contact map is'+accountPrimaryContactMap.keyset());
        System.debug('account contact map is'+accountPrimaryContactMap.values());
        
        if(!accountPrimaryContactMap.isEmpty()){
            
            for(Account acc : accountPrimaryContactMap.keyset()){
                
                conList=accountPrimaryContactMap.get(acc);
                
                if(!conList.isEmpty()){
                    integer i=0;
                    for(Contact con : conList){
                        If(con.Account_Roles__c=='Primary Contact'){
                            acc.Phone_1__c=con.Phone;
                            acc.Phone_2__c=con.MobilePhone;
                            count=1;
                            System.debug('acc---'+conList);
                            conList.remove(i);
                            break ;
                        }   
                        i++;   
                        
                    }
                }
                
                if(!conList.isEmpty()){
                    
                    for(Contact con : conList){
                        
                        
                        
                        acc.Phone_3__c=con.Phone;
                        
                        acc.Phone_4__c=con.MobilePhone;
                        System.debug('Reached1---'+ con.Account_Roles__c+'   '+acc.Phone_4__c);
                        count++;
                        conList.remove(0);
                        
                        
                        break;
                        
                        
                    }
                }
                
                
                if(!conList.isEmpty()){
                    
                    for(Contact con : conList){
                        
                        
                        acc.Phone_5__c=con.Phone;
                        
                        acc.Phone_6__c=con.MobilePhone;  
                        System.debug('Reached5---'+con.Phone+''+con.MobilePhone );
                        conList.remove(0);
                        break;  
                        
                        
                    }
                }
                
                
                listOfAccountToUpdate.add(acc);
            }
            
        }
        
        
        
        if(!listOfAccountToUpdate.isempty()){
            
            system.debug('account list is'+listOfAccountToUpdate);
            update listOfAccountToUpdate;
        }
        
    }
    

}