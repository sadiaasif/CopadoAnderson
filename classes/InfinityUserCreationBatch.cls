global class InfinityUserCreationBatch implements 
    Database.Batchable<sObject>,Database.AllowsCallouts, Database.Stateful {
      private String query; 
           List<Opportunity> OppUpdate=new List<Opportunity>();
        public Integer recordsProcessed = 0;
      
       global   DebugInfo__c Dinfo=new DebugInfo__c();

        List<task> taskList=new List<task>();
        global InfinityUserCreationBatch(string query){
            this.query = query;
            
        }
        global Database.QueryLocator start(Database.BatchableContext bc) {
                   
         return Database.getQueryLocator(this.query);
        }
      global void execute(Database.BatchableContext bc, List<opportunity> saledatalist){
          List<contact> conList=new List<contact>();
          List<Id> accountIDs= new List<Id>();
       contact con=new contact(); 
          for(opportunity opp : saledatalist){
              accountIDs.add(opp.AccountId);
         
          DigitalProductsSaleWPusercreationBatch.wrapConatct wcreturned=DigitalProductsSaleWPusercreationBatch.getPrimaryOrOldestContact(opp.AccountId);
              if(wcreturned.ContactID!=null){
                   conList=[Select id,Service_Item_List__c from contact where id=: wcreturned.ContactID limit 1];
              if(conList.size()>0){
                  if(string.isBlank(conList[0].Service_Item_List__c) && conList[0].Service_Item_List__c==null ){
                      conList[0].Service_Item_List__c=opp.Infinity_Memebership__c+',';
                 
                  }else if( ((!string.isBlank(conList[0].Service_Item_List__c)&&conList[0].Service_Item_List__c!=null) ?!conList[0].Service_Item_List__c.contains(opp.Infinity_Memebership__c):false)){
                  conList[0].Service_Item_List__c=conList[0].Service_Item_List__c+opp.Infinity_Memebership__c+',';
                  
              }
              conList.add(con);
              } 
              }
            
            
             
             OppUpdate.add(opp);
          }
DigitalProductsSaleWPusercreationBatch.prepareCallout(accountIDs);
           try{ 
               update conList;
        		
            } catch (Exception e) {
            debugInfo.createDebugLog(e);
            }
        
         
   
        }
        global void finish(Database.BatchableContext bc){
            List<Opportunity> oppList=new  List<Opportunity>();
            Contact Updatecon=new contact();
            for(opportunity oppu:OppUpdate ){
                 DigitalProductsSaleWPusercreationBatch.wrapConatct wcreturned=DigitalProductsSaleWPusercreationBatch.getPrimaryOrOldestContact(oppu.AccountId);
                if(wcreturned.ContactID!=null){
                   Updatecon=[Select id,Service_Item_List__c,Platinum_Wordpress_Id__c from contact where id=: wcreturned.ContactID limit 1];
                    if(Updatecon!=null){
                        if(Updatecon.Platinum_Wordpress_Id__c!='' && Updatecon.Platinum_Wordpress_Id__c!=null){
                            oppu.Service_User_Created__c=true;
                        }
                    }
                    }
                
                oppList.add(oppu);
            }
                       try{ 
               update oppList;
        		
            } catch (Exception e) {
            debugInfo.createDebugLog(e);
            }
          
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
         integer cpuTime = Limits.getCpuTime();
            integer Queries = Limits.getQueries();
         
            Dinfo.DebugData__c='Job Name:SFFBuploadBatchClass; Records deleted:'+recordsProcessed;
            insert Dinfo;
        }
    
}