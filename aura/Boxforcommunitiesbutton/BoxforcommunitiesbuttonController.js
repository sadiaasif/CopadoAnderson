({
    doInit : function(component, event, helper) {
        
        var Cid= component.get("v.recordId");
      
        
        var actiongetboxLink = component.get("c.doinit");
        var accId = component.get("v.recordId");
    
        actiongetboxLink.setParams({
            "recordId":accId
        });
        actiongetboxLink.setCallback(this, function(data) {
              var state = data.getState()
    if (component.isValid() && state === 'SUCCESS') {
                      var rowvalues=   data.getReturnValue();
       
                 component.set("v.BoxLink",rowvalues );  
    }            var BoxLink=component.get('v.BoxLink');
            if(BoxLink=='Issue'){
                alert('The Client has more than one box account.Please Check!');
            }else{
                 	var eUrl= $A.get("e.force:navigateToURL");
    eUrl.setParams({
      "url": BoxLink
    });
    eUrl.fire();
            }
      
              $A.get("e.force:closeQuickAction").fire();
        });
         
       
     
          $A.enqueueAction(actiongetboxLink);

     
        /*	var eUrl= $A.get("e.force:navigateToURL");
    eUrl.setParams({
      "url": ReportLink
    });
    eUrl.fire();*/
    }
})