({
	doInit : function(component, event, helper) {
         var accId = component.get("v.recordId");
		  var actionContactPicklist = component.get("c.getContactListPicklict");
      
         actionContactPicklist.setParams({
            "accId":accId
        });
        actionContactPicklist.setCallback(this, function(data) {
           
        var state = data.getState();
            if (state === "SUCCESS"){
                component.set("v.contactList", data.getReturnValue());
            }
           
             
        });
         $A.enqueueAction(actionContactPicklist); 
	},
    Logacall : function(component, event, helper) {
       
         var inputCmp = component.find("ContactListT");
       
        var selectedConval=inputCmp.get("v.value");
       
        if(selectedConval==" "){
              helper.toastMsg( 'error', 'Please select the contact!' ); 
        } else {
          
            inputCmp.set("v.errors", null);
              component.set("v.showSpinner", true);  
         var accId = component.get("v.recordId");
         var Comments = component.get("v.Comments");
        var Subject = component.get("v.Subject");
      
		
      
          var userId = $A.get("$SObjectType.CurrentUser.Id");
         var actionLogaCall = component.get("c.CreateTask");
        
         actionLogaCall.setParams({
             
            "accId":accId,
             "contactName":selectedConval,
             "Comments":Comments,
             "subject":Subject,
             "userId":userId
             
        });
         
        actionLogaCall.setCallback(this, function(data) {
         
      
              var state = data.getState(); 
           
            if ( state === "SUCCESS" ) {  
                
                if ( data.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Logged the call.' );  
                      component.set("v.Subject", " ");  
                      component.set("v.Comments", " ");  
                    component.find("ContactListT").set("v.value"," ");
                   component.set("v.showSpinner", false);  
                  
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                     component.set("v.showSpinner", false);
                } 
                
            } else {  
                
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
               component.set("v.showSpinner", false);
            }  
         
             
        });
         
           $A.enqueueAction(actionLogaCall); 
        }
     
	}, createEventRecord : function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Event"
        });
        createRecordEvent.fire();
         
    }
})