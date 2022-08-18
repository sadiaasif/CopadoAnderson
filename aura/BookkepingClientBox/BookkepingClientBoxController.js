({
	doInit : function(component, event, helper) {
       
           var actiongetClientID = component.get("c.getClientId");
        var CaseID = component.get("v.recordId");
    
        actiongetClientID.setParams({
            "CaseID":CaseID
        });
		 actiongetClientID.setCallback(this, function(data) {
              var state = data.getState(); 
             if ( state === "SUCCESS" ) {
                 if(data.getReturnValue()!=null){
                    component.set("v.ClientId", data.getReturnValue()); 
                     var Cid=component.get("v.ClientId");
                    
                     component.set('v.BoxUrl',
      		'https://andersonadvisors--box.na132.visual.force.com/apex/AccountBoxSection?id='+
     		 component.get('v.ClientId'));
        var url=component.get('v.BoxUrl');
            
       
                      component.set("v.ClientIDPresent", true); 
                 }else{
                     component.set("v.ClientIDPresent", false);  
                 }
          
             }
           
        });
           $A.enqueueAction(actiongetClientID);
      	
}
	
})