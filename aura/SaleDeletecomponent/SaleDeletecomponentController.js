({
	doInit : function(component, event, helper) {
         var oppId = component.get("v.recordId");
		  var actionAttNamePicklist = component.get("c.getContenDocumentTitle");
   
        actionAttNamePicklist.setParams({
            "oppId":oppId
        });
     
        actionAttNamePicklist.setCallback(this, function(data) {
           
        var state = data.getState();
            if (state === "SUCCESS"){
                 var result = data.getReturnValue();
               
                var AttNameMap = [];
                for(var key in result){
                   
                    AttNameMap.push({key: key, value: result[key]});
                      
                }
                component.set("v.AttachmentNameList", AttNameMap);
            }
           
             
        });
          $A.enqueueAction(actionAttNamePicklist);
    }, 
    SubmitAttname:function(component, event, helper) {
        component.set("v.ShowSpinner", true);
                  var oppId = component.get("v.recordId");
       
        var selectedAttname = component.find("AttachmentNameListId").get("v.value");
      
           var actionSalesAttnameupdate = component.get( "c.updatedAttachmentNameOnSale" );  
        actionSalesAttnameupdate.setParams({  
            
            'oppId' : oppId,
            'AttachmentName':selectedAttname          
            
        });  
        actionSalesAttnameupdate.setCallback( this, function( response ) {  
            
            var state = response.getState();   
          
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                 
                    component.set("v.ShowSpinner", false);
                    component.set("v.ShowAttPicklist", false);
                     component.set("v.Showsubmitbutton", false);
                     component.set("v.ShowFinishMessage", true);
              
                
                } else {   
             
                      component.set("v.ShowSpinner", false); 
                     component.set("v.ShowAttPicklist", true);
                     component.set("v.Showsubmitbutton", true);
                     component.set("v.ShowErrorMessage", true);
                    
                }  
                
            } else {  
              
              component.set("v.ShowSpinner", False);
                  component.set("v.ShowAttPicklist", true);
                 component.set("v.Showsubmitbutton", true);
                     component.set("v.ShowErrorMessage", true);
            }  
            
        });  
        $A.enqueueAction( actionSalesAttnameupdate );  
        
    },
    closecmtName : function(component, event, helper) {
		$A.get("e.force:closeQuickAction").fire();
	},
    onSelectAttnameChange : function(component, event, helper){
      var ChkselectedAttname = component.find("AttachmentNameListId").get("v.value");
        if(ChkselectedAttname!='--None--'){
             component.set("v.Showsubmitbutton", true);
        }else{
             component.set("v.Showsubmitbutton", false);
        }
        
}
})