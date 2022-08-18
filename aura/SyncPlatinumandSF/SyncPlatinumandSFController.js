({
    doInit  : function(component, event, helper) {
                component.set('v.spin', !component.get('v.spin'));
        
        var conId = component.get('v.recordId');
        var action = component.get('c.checkforDigitalservice');
    
        action.setParams({ 
           
             accountId: component.get("v.recordId"),
          
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               
                component.set('v.digitalproductswrapperList', response.getReturnValue()); 
               
                
                component.set('v.spin', !component.get('v.spin'));
                
            }
        });
        $A.enqueueAction(action);
         var getcondetailsforNewuser = component.get('c.getcreateuserdetailsfromcontact');
    
        getcondetailsforNewuser.setParams({ 
           
             accountId: component.get("v.recordId"),
          
        });
        getcondetailsforNewuser.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               
                component.set('v.accwrapperList', response.getReturnValue()); 
         var platinumwordpressid = component.get("v.accwrapperList.acccontactWPId");
           
                        if(platinumwordpressid=='' || platinumwordpressid==null ){
           component.set("v.Updateuser", false); 
            component.set("v.createuser", true); 
            
        }else{
              component.set("v.createuser", false); 
             component.set("v.Updateuser", true); 
           
        }
                
            }
        });
        $A.enqueueAction(getcondetailsforNewuser);
    },
	SyncUser : function(component, event, helper) {
        component.set('v.spin', !component.get('v.spin'));
      component.set("v.Checkforsync",true );    
         var a= component.get("v.recordId");
      var contactID='';
      console.log('***In helper'+a);
      //call apex class method
      var action = component.get('c.getSfplatimumdetails');
        action.setParams({
            accountId : component.get("v.recordId")
        });
      action.setCallback(this, function(response) {
        //store state of response
        var state = response.getState();
        if (state === "SUCCESS") {
          component.set('v.accwrapperList', response.getReturnValue()); 
        		 var action2 = component.get('c.getPlatinumUserdetailsfromwordpress');
         action2.setParams({
            wordpressidSF : component.get("v.accwrapperList.acccontactWPId"),
             SFaccountid: component.get("v.recordId"),
             SFSaleid: component.get("v.accwrapperList.accsaleId"),
             SFcontactid: component.get("v.accwrapperList.acccontactId"),
             SFPlatinumSale: component.get("v.accwrapperList.accPlatinumsaleStage")
        });
      action2.setCallback(this, function(response) {
        //store state of response
        var state = response.getState();
        if (state === "SUCCESS") {
          component.set('v.WordpressplatinumaccwrapperList', response.getReturnValue()); 
            component.set('v.spin', !component.get('v.spin'));
            
          //set response value in wrapperList attribute on component.
        
        }
           });
          $A.enqueueAction(action2);
        
        }
      });
      $A.enqueueAction(action);
        

	},
  
    SyncSFandwpUser : function(component, event, helper) {
        
        component.set('v.spin', !component.get('v.spin'));
        
        var conId = component.get('v.recordId');
        var action = component.get('c.syncPlatinumandsf');
        
        action.setParams({ 
            wordpressidSF : component.get("v.accwrapperList.acccontactWPId"),
             SFaccountid: component.get("v.recordId"),
             SFSaleid: component.get("v.accwrapperList.accsaleId"),
             SFcontactid: component.get("v.accwrapperList.acccontactId"),
             SFPlatinumSale: component.get("v.accwrapperList.accPlatinumsaleStage")
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                 component.set("v.NeedtoSync",false ); 
                component.set('v.WordpressplatinumaccwrapperList', response.getReturnValue()); 
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success",
                    "message": "successfully Synced Saleforce and platinum !",
                    "type":"success"
                });
                toastEvent.fire();
                
                component.set('v.spin', !component.get('v.spin'));
                
            }
        });
        $A.enqueueAction(action);
    },
    Digitalproductsupdate:function(component, event, helper) {
           component.set('v.spin', !component.get('v.spin'));
                var updateconaction = component.get( "c.updatedigitalproductsoncon" );  
        
        updateconaction.setParams({  
            
            
            'contactid':component.get("v.digitalproductswrapperList.Conid"),
            'digitalproduct':component.get("v.digitalproductswrapperList.hasDigitalproducts")
            
        });  
        updateconaction.setCallback( this, function( response ) {  
            
            var state = response.getState();   
                       if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                   
                    var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success",
                    "message": "Successfully updated the digital products!",
                    "type":"success"
                });
                toastEvent.fire();
                       component.set('v.spin', !component.get('v.spin'));
                  var action = component.get('c.doInit');
        $A.enqueueAction(action);   
                    
                } else {   
                    
                   var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error",
                    "message": "Sorry there was an issue.Please try again!",
                    "type":"error"
                });
                toastEvent.fire();
                    component.set('v.spin', !component.get('v.spin'));   
                }
            
            }
            
             else {  
                
           var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error",
                    "message": "Sorry there was an issue.Please try again!",
                    "type":"error"
                });
                toastEvent.fire();
                   component.set('v.spin', !component.get('v.spin'));
            }  
            
        });  
        $A.enqueueAction( updateconaction );  
    },
    genrateandsetpassword:function(component, event, helper) {
           component.set('v.spin', !component.get('v.spin'));
                var generateandResetPassword = component.get( "c.generaterandomPassword" );  
        
        generateandResetPassword.setParams({  
            
            accountId :  component.get('v.recordId')
           
            
        });  
        generateandResetPassword.setCallback( this, function( response ) {  
             component.set('v.generatenewpassword',false);  
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
              component.set('v.accwrapperList', response.getReturnValue()); 
             component.set('v.SendEmailtoclient',true); 
                   component.set('v.spin', !component.get('v.spin'));
            } else {  
                
           var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error",
                    "message": "Sorry there was an issue.Please try again!",
                    "type":"error"
                });
                toastEvent.fire();
                
              component.set('v.SendEmailtoclient',false);   
                   component.set('v.spin', !component.get('v.spin'));
            }  
            
        });  
        $A.enqueueAction( generateandResetPassword );  
    },
     SendEmail : function(component, event, helper)  {
component.set('v.spin', !component.get('v.spin'));
        var action=component.get("c.processEmail");
        action.setParams({
            email:component.get("v.accwrapperList.accPlatinumEmail"),
            password:component.get("v.accwrapperList.accPlatinumGeneratedPass"),
            accconId:component.get("v.accwrapperList.acccontactId")
        })
        action.setCallback(this,function(response){
            if(response.getState()=='SUCCESS'){
                var result=response.getReturnValue();
                if(result=='Success'){
                     var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success",
                    "message": "Email Sent Successfully!",
                    "type":"success"
                });
                toastEvent.fire();
  component.set('v.generatenewpassword',true);  
                       component.set('v.SendEmailtoclient',false); 
                    component.set('v.spin', !component.get('v.spin'));
                }
                else{
                                    toastEvent.setParams({
                    "title": "Error",
                    "message": result,
                    "type":"error"
                });
                toastEvent.fire();
                  component.set('v.generatenewpassword',true); 
                       component.set('v.SendEmailtoclient',false); 
                     component.set('v.spin', !component.get('v.spin'));
                }
            }
            else{
                alert(JSON.stringify(response.getError()));
            }
        });
        $A.enqueueAction(action);
 },
    createUser : function(component, event, helper) {
        
        component.set('v.spin', !component.get('v.spin'));
        
        var action = component.get('c.createPlatinumUser');
        action.setParams({ conIds : component.get("v.accwrapperList.acccontactId")  });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                 component.set('v.accwrapperList', response.getReturnValue()); 
               if(component.get('v.accwrapperList.showerror')==true  ){
                      var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops! The Client has no platinum subscription/Tax toolbox/Anderson Funding Community/Infinity subscription .",
                    "message": 'Please double-check if the client has a Platinum subscription sale type or the client has purchased Tax toolbox or Infinity subscription. If the error persist please submit a help desk case.',
                    "type":"error"
                });
                toastEvent.fire(); 
                  }else{
                   
                    var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success",
                    "message": "User Created!",
                    "type":"success"
                });
                toastEvent.fire();
             
                  }
                component.set('v.spin', !component.get('v.spin'));
                
            }
            
            if (state === "ERROR") {
                 
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops! That username is already in use.",
                    "message": 'Please double-check if a Platinum login already exists for this client and try resetting the password. If the error persist please submit a help desk case.',
                    "type":"error"
                });
                toastEvent.fire();
                component.set('v.spin', !component.get('v.spin'));
           
            }
            
             var actionrefresh = component.get('c.doInit');
        $A.enqueueAction(actionrefresh);   
        });
        $A.enqueueAction(action);
    },
    updateClick : function(component, event, helper) {
        
        component.set('v.spin', !component.get('v.spin'));
        
        var conId = component.get('v.recordId');
        var action = component.get('c.sendUpdate');
        action.setParams
        ({ 
            conId :  component.get("v.accwrapperList.acccontactId"),
            Email:   component.get("v.accwrapperList.accPlatinumEmail")          
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success",
                    "message": "User Updated!",
                    "type":"success"
                });
                toastEvent.fire();
                component.set('v.spin', !component.get('v.spin'));
            }
        });
        $A.enqueueAction(action);
    }
    
   
})