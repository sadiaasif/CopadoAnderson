({
    fetchRecords: function( component ) { 
        var actiongetActivitySearchrecord = component.get("c.getActivitySearch");
        var ClientId = component.get("v.recordId");
        
        actiongetActivitySearchrecord.setParams({
            "ClientId" :ClientId
        });
        
        actiongetActivitySearchrecord.setCallback(this, function(data) {
            
            var state = data.getState()
            if (component.isValid() && state === 'SUCCESS') {
                var rowvalues=   data.getReturnValue();
                
                for (var i = 0; i < rowvalues.length; i++) {
                    var rowvalue = rowvalues[i];
                    if(rowvalue.Client__c!=null && rowvalue.Client__c!=''  ){
                        rowvalue.ClientName = rowvalue.Client__r.Name;  
                    }
                    if(rowvalue.WhatId!=null && rowvalue.WhatId!=''  ){
                        rowvalue.RealtedName = rowvalue.What.Name;
                    } 
                    if(rowvalue.OwnerId!=null && rowvalue.OwnerId!=''  ){
                        rowvalue.OwnerName = rowvalue.Owner.Name;
                    }
                    if(rowvalue.RecordType!=null && rowvalue.RecordType!=''  ){
                        rowvalue.RecordType = rowvalue.RecordType.Name;
                    }  
                    rowvalue.linkName = '/'+rowvalue.Id;
                    
                }
                component.set("v.ActivitySearchRecords",rowvalues );
            }
            
        });
        $A.enqueueAction(actiongetActivitySearchrecord);
    },
    toastMsg : function( strType, strMessage ) {  
        
        var showToast = $A.get( "e.force:showToast" );   
        showToast.setParams({   
            
            message : strMessage,  
            type : strType,  
            mode : 'sticky'  
            
        });   
        showToast.fire();   
        
    },
    SearchHelper: function(component,event) {  
        var searchKey = component.get("v.searchKeyword");
        component.find("Id_spinner").set("v.class" , 'slds-show');
        var ClientId = component.get("v.recordId");
        var taskList = component.get("v.ActivitySearchRecords");
        var action = component.get("c.findByName");
        action.setParams({
            "searchKey": searchKey,
            
            "ClientId":ClientId
        }); 
        action.setCallback(this, function(data) {
            component.find("Id_spinner").set("v.class" , 'slds-hide');
            var state = data.getState()
            if (component.isValid() && state === 'SUCCESS') {
                var rowvalues=   data.getReturnValue();
                
                for (var i = 0; i < rowvalues.length; i++) {
                    var rowvalue = rowvalues[i];
                    
                    if(rowvalue.Client__c!=null && rowvalue.Client__c!=''  ){
                        rowvalue.ClientName = rowvalue.Client__r.Name;  
                    }
                    if(rowvalue.WhatId!=null && rowvalue.WhatId!=''  ){
                        rowvalue.RealtedName = rowvalue.What.Name;
                    } 
                    if(rowvalue.OwnerId!=null && rowvalue.OwnerId!=''  ){
                        rowvalue.OwnerName = rowvalue.Owner.Name;
                    }
                    if(rowvalue.RecordType!=null && rowvalue.RecordType!=''  ){
                        rowvalue.RecordType = rowvalue.RecordType.Name;
                    }  
                    rowvalue.linkName = '/'+rowvalue.Id;
                }
                component.set("v.ActivitySearchRecords",rowvalues );
            }
        });
        $A.enqueueAction(action);  
    }
})