trigger AttachReceiptToBox on Attachment (after insert,after update) {
    
    Set<ID> attachmentParentidset=new Set<Id>();
    Set<ID> attachmentidset=new Set<Id>();
    List<Datetime>attcachmentCreatedDate=new List<Datetime>();
    if(LinkReceiptToBox.alreadyprocessing==false || AccountBlueprintcheck.blueprintCheckprocessing== false){
        
    
   if(trigger.isAfter && trigger.isInsert){
         String AttachementName;
       Id createdByID;
       Datetime FirstBuleprintcreatedDate;
      // system.debug('inside recursive 2');
      
           Map<id,Attachment> AttachmentParentids=new Map<id,Attachment> ([Select id, ParentId,Name,createdDate,CreatedById  from Attachment where id=:Trigger.newMap.keySet()]) ;
       for(Attachment Att:AttachmentParentids.values()){
           if(!LinkReceiptToBox.ProcessedoppId.contains(Att.Id)||!AccountBlueprintcheck.ProcessedoppRollupId.contains(Att.Id)){
                LinkReceiptToBox.ProcessedoppId.add(Att.Id);
           AccountBlueprintcheck.ProcessedoppRollupId.add(Att.Id);
           attachmentParentidset.add(Att.ParentId);
           attachmentidset.add(Att.id);
           AttachementName=att.Name;
          createdByID=att.CreatedById;
           }
         
       }
       //conga to box
       List<opportunity> oppList=[Select id,Name from opportunity where id In: attachmentParentidset limit 1];
       if(oppList.size()>0 && attachmentidset.size()>0){
           
           if(AttachementName.contains(oppList[0].Name) ){
               
             LinkReceiptToBox.callout(attachmentidset,attachmentParentidset);  
           }
             
       }
       // Entity Doc to box
         List<Entities__c> EnList=[Select id,Name from Entities__c where id In: attachmentParentidset limit 1];
       if(EnList.size()>0 && attachmentidset.size()>0){
          User u=[select id,name from user where name ='Linvio Installation'];
           if(u!=null){
             if(createdByID==u.id) {
               
             EntityDocattchmentTobox.calloutToBox(attachmentidset,attachmentParentidset);  
       } 
           }
         
             
       }
       List<Account> acclist=[select id,name from Account where id in:attachmentParentidset limit 1];
       if(acclist.size()>0 && attachmentidset.size()>0){
       if(AttachementName.contains('.json')){
           
	  AccountBlueprintcheck.UpdateAccountBlueprintcheck(attachmentParentidset,attachmentidset);
       }    
       }
       
       
        
  		
       
      
   }
        if(trigger.isAfter && trigger.isUpdate){
             String AttachementName;
       Datetime FirstBuleprintcreatedDate;
      // system.debug('inside recursive 2');
      
           Map<id,Attachment> AttachmentParentids=new Map<id,Attachment> ([Select id, ParentId,Name,createdDate  from Attachment where id=:Trigger.newMap.keySet()]) ;
       for(Attachment Att:AttachmentParentids.values()){
          
           attachmentParentidset.add(Att.ParentId);
           attachmentidset.add(Att.id);
           AttachementName=att.Name;
           if(AttachementName.contains('.json')){
               attcachmentCreatedDate.add(Att.createdDate);
           }
       }
               List<Account> acclist=[select id,name from Account where id in:attachmentParentidset limit 1];
       if(acclist.size()>0){
       if(AttachementName.contains('.json')){
           
           AccountBlueprintcheck.UpdateAccountBlueprintcheck(attachmentParentidset,attachmentidset);
       }    
       }
        }
   }
}