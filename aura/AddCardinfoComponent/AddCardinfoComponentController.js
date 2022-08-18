({
    doInit : function(component, event, helper) {
        var oppId=component.get("v.oppId");
        
        helper.callAction( component, 'c.cardinformation', {
            'opperunityid' :oppId
            
            
        }, function( data ) {
            component.set('v.options', data);
        });
        
    },
    handleCompanyOnChange : function(component, event, helper) {
        var indutry = component.get("v.value");
        component.set("v.showError", false);
        component.set("v.Selectedid",indutry);
    },
    savecontact:function( component, event, helper ) {   
        
        var oppId=component.get("v.oppId");
        
        
        var SelectedId=component.get("v.Selectedid");
        
        event.preventDefault();
        var updateNoteFields=component.get("v.OpportunityFields");
        component.set("v.Spinner", true);
        helper.callAction( component, 'c.Updateinformationcard', {
            'opperunityid' :oppId,
            'SelectedId':SelectedId
            
        }, function( data ) {
            // alert(data)
            if(data=='Success'){
                component.set("v.showError", false);
                component.find('OpportunityTable').submit(updateNoteFields);
                component.set("v.Spinner", false);
            }else{
                component.set("v.showError", true);
                component.set("v.errorMessage", data);
                component.set("v.Spinner", false);
            }
            
            
            
        });
        
        
    }, showSpinner: function(component, event, helper) {
        // make Spinner attribute true for display loading spinner 
        component.set("v.Spinner", true); 
    },
    
    // this function automatic call by aura:doneWaiting event 
    hideSpinner : function(component,event,helper){
        // make Spinner attribute to false for hide loading spinner    
        component.set("v.Spinner", false);
    }
    
})