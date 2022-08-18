public with sharing class ClientEntityTaxReturnsController {
    @AuraEnabled
    public static List<TaxReturnWrapper> getTaxReturns(String clientOrEntityId){
        try {
            List<TaxReturnWrapper> lstTaxReturnWrappers = new List<TaxReturnWrapper>();
            Map<String,List<Tax_Return__c>> mTaxReturnsByYear = new Map<String,List<Tax_Return__c>>();
            List<Tax_Return__c> lstTaxReturns;

            for(Tax_Return__c taxReturn:[Select Id,Tax_Return_Name__c,Tax_Year__c from Tax_Return__c where 
                                        (Client__c = :clientOrEntityId OR Entity__c =:clientOrEntityId) Order by Tax_Year__c DESC
                                        LIMIT 5000])
            {
                lstTaxReturns = new List<Tax_Return__c>();
                if(mTaxReturnsByYear.containsKey(taxReturn.Tax_Year__c)){
                    lstTaxReturns= mTaxReturnsByYear.get(taxReturn.Tax_Year__c);
                }  
                lstTaxReturns.add(taxReturn);
                mTaxReturnsByYear.put(taxReturn.Tax_Year__c,lstTaxReturns);
            }
            for(String taxYear:mTaxReturnsByYear.keyset()){
                lstTaxReturnWrappers.add(new TaxReturnWrapper(taxYear,mTaxReturnsByYear.get(taxYear)));
            }
            return lstTaxReturnWrappers;
             
        } catch (Exception e) {
            System.debug('Error occurred at '+e.getLineNumber()+': '+e.getMessage());
            return null;
        }
    }

    public static void updateComments(List<Tax_Return__c> lstNewReturns, Map<Id,Tax_Return__c> mOldReturns){
        String comment ='';
        DateTime dt = DateTime.now();
        String dateTimeStr = dt.format('yyyy-MM-dd');

        for(Tax_Return__c taxReturn:lstNewReturns){
            if(taxReturn.Update_Comment__c !=null && (mOldReturns == null || taxReturn.Update_Comment__c !=mOldReturns.get(taxReturn.Id).Update_Comment__c)){
                comment =  dateTimeStr+' - '+UserInfo.getName()+' - '+taxReturn.Update_Comment__c;
                taxReturn.Comments__c =  (taxReturn.Comments__c!=null?(taxReturn.Comments__c+'\n'+comment):comment);
            }
        }
    }
    public class TaxReturnWrapper{
        @AuraEnabled
        public String taxYear{get;set;}
        @AuraEnabled
        public List<Tax_Return__c> taxReturns{get;set;}
        public TaxReturnWrapper(String taxYear,List<Tax_Return__c> taxReturns){
            this.taxReturns = taxReturns;
            this.taxYear = taxYear;
        }
    }
}