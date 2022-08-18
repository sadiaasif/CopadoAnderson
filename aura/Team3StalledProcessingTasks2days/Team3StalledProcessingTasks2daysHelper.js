({
	fetchAccounts : function( component ) { 
        var clientPrent=false;
		          var actiongetAdvisorCallTask = component.get("c.getAlltasks");
      
        actiongetAdvisorCallTask.setCallback(this, function(data) {
              var state = data.getState();
    if (state === 'SUCCESS') {
       
                      var rowvalues=   data.getReturnValue();
          
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.Client__c){
                                  clientPrent=true;
                                  var Baseurl =rowvalue.Client__r.Base_Url__c;
                                 rowvalue.linkName =Baseurl+ 's/detail/'+rowvalue.Id;
                                  if(rowvalue.Related_Entity__c){
                                      rowvalue.EntityName=rowvalue.Related_Entity__r.Name;
                                  }
                                   rowvalue.ClientName=rowvalue.Client__r.Name;
                               if(rowvalue.OwnerId){
                               rowvalue.owner = rowvalue.Owner.Name;   
                              }  
                              }
                              
                   
            			}
        if(clientPrent){
               component.set("v.TaskRecords",rowvalues );  
        }
              
    }        
        });
          $A.enqueueAction(actiongetAdvisorCallTask);  
        
              var actionTaskCount = component.get("c.getCounttasks");
      
        actionTaskCount.setCallback(this, function(data) {
              var state = data.getState();
    if (state === 'SUCCESS') {
       
                      var rowvalues=   data.getReturnValue();
          
                   
                 component.set("v.TaskRecordcount",rowvalues );  
    }        
        });
          $A.enqueueAction(actionTaskCount);  
	},
    SearchHelper: function(component,event) {  
      
     
        var Startdate = component.find("Startdate").get("v.value");
        
          var Enddate = component.find("Enddate").get("v.value");
           
        component.find("Id_spinner").set("v.class" , 'slds-show');
        
   
    var action = component.get("c.findByName");
    action.setParams({
      "startDate": Startdate,
   "endDate": Enddate
     
    }); 
        
    action.setCallback(this, function(data) {
         component.find("Id_spinner").set("v.class" , 'slds-hide');
       
                        var state = data.getState()
if (state === 'SUCCESS') {
        
                      var rowvalues=   data.getReturnValue();
          
                          for (var i = 0; i < rowvalues.length; i++) {
                			var rowvalue = rowvalues[i];
                             
                              if(rowvalue.Client__c){
                                
                                  var Baseurl =rowvalue.Client__r.Base_Url__c;
                                 rowvalue.linkName =Baseurl+ 's/detail/'+rowvalue.Id;
                                  if(rowvalue.Related_Entity__c){
                                      rowvalue.EntityName=rowvalue.Related_Entity__r.Name;
                                  }
                                  rowvalue.ClientName=rowvalue.Client__r.Name;
                               if(rowvalue.OwnerId){
                               rowvalue.owner = rowvalue.Owner.Name;   
                              }  
                              }
                              
                   
            			}
      
            
               component.set("v.TaskRecords",rowvalues );  
       
              
    }
    
    });
    $A.enqueueAction(action);  
              var actionTaskCount = component.get("c.getCounttasksFilter");
       actionTaskCount.setParams({
      "startDate": Startdate,
   "endDate": Enddate
     
    }); 
        actionTaskCount.setCallback(this, function(data) {
              var state = data.getState();
    if (state === 'SUCCESS') {
       
                      var rowvalues=   data.getReturnValue();
          
                   
                 component.set("v.TaskRecordcount",rowvalues );  
    }        
        });
          $A.enqueueAction(actionTaskCount);  
    }
})