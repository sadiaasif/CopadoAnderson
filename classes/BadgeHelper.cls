/***********************************
* Author 	  : Umar Aziz
* Description : Update Client(Account) Badge from Sale(Opportunity) when serviceitemlist got updated.
* Class 	  : BadgeHelper
***********************************/

public with sharing class BadgeHelper {
    public static boolean alreadyProcessed = false;
    public static boolean alreadyProcessedDel = false;
    
    //Update
    public static void BadgeUpdate(List<Opportunity> oppForAsids, Set<String> metadataAsids) {
        if( alreadyProcessed == false ){
            alreadyProcessed = true;
            
            String finalAsids = null;
            List<Account> acc = new List<Account>();
            for( Opportunity opp : oppForAsids ) {
                if( opp.Account.BadgeServiceItems__c != null && opp.StageName == 'Closed Won' ) {
                    List<String> ExistingASID = opp.Account.BadgeServiceItems__c.split(';');
                    Set<String> ExistingASIDSet = new Set<String>(ExistingASID);
                    
                    if( opp.Service_Item_List__c != null ){
                        List<String> SaleServices = opp.Service_Item_List__c.split(';');
                        set<String> UniqueSaleServices = new Set<String> (SaleServices);
                    	System.debug('UniqueSaleServices: '+UniqueSaleServices);
                        for( String asid : UniqueSaleServices ){
                            if( metadataAsids.contains( asid ) && !( ExistingASIDSet.contains(asid) ) && finalAsids != null) {
                                finalAsids += asid+';';
                            }
                            else if( metadataAsids.contains( asid )  && !( ExistingASIDSet.contains(asid) ) && finalAsids == null ) {
                                finalAsids = asid+';';
                            }
                        }   
                    }
                    if( finalAsids != null ) {
                        Account ac = new Account();
                        ac.Id = opp.AccountId;
                        ac.BadgeServiceItems__c = opp.Account.BadgeServiceItems__c+finalAsids;
                        acc.add(ac);
                    }
                } 
                else{
                    if( opp.Service_Item_List__c != null && opp.StageName == 'Closed Won' ){
                        for( String asid : opp.Service_Item_List__c.split(';') ){
                            if( metadataAsids.contains( asid ) && finalAsids != null ) {
                                finalAsids += asid+';';
                            }
                            else if( metadataAsids.contains( asid )   && finalAsids == null ){
                                finalAsids = asid+';';
                            }
                        }
                    }
                    if( finalAsids != null ) {
                        Account ac = new Account();
                        ac.Id = opp.AccountId;
                        ac.BadgeServiceItems__c = finalAsids;
                        acc.add(ac);
                    }
                }
            }
            
            Try{
                update acc;
            }
            catch(DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
        }
    }
    // End Update
    
    
    //Delete
    public static void BadgeDelete (List<Opportunity> oppForAsids, Set<String> metadataAsids){
        if( alreadyProcessedDel == false ){
            alreadyProcessedDel = true;
            String finalAsids = null;
            String DeleteID = null;
            Set<Account> acc = new Set<Account>();
            List<String> DeletedASIDs = new List<String>();
            List<String> RetainASIDs = new List<String>();
            for( Opportunity opp : oppForAsids ) {
                if( opp.Account.BadgeServiceItems__c != null && opp.Service_Item_List__c != null) {
                    for( String asid : opp.Account.BadgeServiceItems__c.split(';') ){
                        if( opp.Service_Item_List__c.contains(asid) ) {
                            DeleteID += asid+';';
                        } 
                        else if(finalAsids != null){
                            finalAsids += asid+';';
                            RetainASIDs.add(finalAsids);
                        } 
                        else{
                            finalAsids = asid+';';
                        }
                    }
                }
                
                Account ac = new Account();
                ac.Id = opp.AccountId;
                ac.BadgeServiceItems__c = finalAsids;
                acc.add(ac);
                
            }
            if(acc != Null){
                Try{
                    List<Account> accList = new List<Account>(acc);
                	Update accList;
                }
                catch(dmlexception e){
                    system.debug('The following exception has occurred: '+ e.getMessage());
                }
            }
        }
    }
    
    //End Delete
}