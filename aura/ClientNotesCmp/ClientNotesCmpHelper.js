({
    getTypePicklistValues : function(component, event, helper) {
        var actionNoteTypePicklist = component.get("c.getNotesTypepicklist");
        actionNoteTypePicklist.setCallback(this, function(data) {
            var state = data.getState();
            if (state === "SUCCESS"){
                var result = data.getReturnValue();
                var NotesTypeMap = [];
                for(var key in result){
                    NotesTypeMap.push({key: key, value: result[key]});
                    
                }
                component.set("v.NotesTypeList", NotesTypeMap);
            }
        });
        $A.enqueueAction(actionNoteTypePicklist); 
    },
    getClientNotes : function(component, event, helper){
        var actiongetNotes = component.get("c.getNotes");
        var accId = component.get("v.recordId");
        console.log(accId);
        actiongetNotes.setParams({
            "accId":accId
        });
        actiongetNotes.setCallback(this, function(data) {
            var state = data.getState()
            if (component.isValid() && state === 'SUCCESS') {
                var rowvalues=   data.getReturnValue();
                
                for (var i = 0; i < rowvalues.length; i++) {
                    var rowvalue = rowvalues[i];
                    if(rowvalue.Notes__c){
                        var regex = /(<([^>]+)>)/ig;
                        var quotesdouble=/(&quot\;)/g;
                        var anpop=/(&amp\;)/g;
                        var quotesingle=/(&#39\;)/g;
                        var enteredNotes=rowvalue.Notes__c;
                        
                        var ModifiedNote=enteredNotes.replace(regex, ' ');
                        
                        var Notesquotes=ModifiedNote.replace(quotesdouble,'"');
                        var Notesandd=Notesquotes.replace(anpop,'&');
                        var Notessingle=Notesquotes.replace(quotesingle,'\'');
                        
                        rowvalue.Notes__c=Notessingle;
                    }
                    if(rowvalue.CreatedDate){
                        var cDate=rowvalue.CreatedDate;
                        rowvalue.Created=$A.localizationService.formatDate(cDate, "MMMM dd yyyy, hh:mm:ss a")
                    }
                    if(rowvalue.CreatedBy.Name){
                        rowvalue.CreatedBy=rowvalue.CreatedBy.Name;
                    }
                    
                }
                component.set("v.NotesRecords",rowvalues );  
            }        
        });
        $A.enqueueAction(actiongetNotes);  
    },
    UpdateNotes: function(component, event, helper) {
        debugger;
        component.set("v.HideSpinner", true);
        var userId = $A.get("$SObjectType.CurrentUser.Id");
        var accId = component.get("v.recordId");
        var selectedType = component.find("NotestypeList").get("v.value");
        var enteredNotes=component.get("v.NotestexArea");
        var actionNotesupdate = component.get( "c.updatedNotesRecords" );  
        actionNotesupdate.setParams({  
            
            'accId' : accId,
            'Notes':enteredNotes,
            'noteType':selectedType,
            'userId':userId
            
        });  
        actionNotesupdate.setCallback( this, function( response ) {  
            debugger;
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                    component.set("v.NotesTypeSelected", false);
                    
                    component.find("NotestypeList").set("v.value","--None--");
                    component.set("v.NotestexArea", " ");
                    
                    helper.getClientNotes(component, event, helper); 
                    component.set("v.HideSpinner", false);
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }  
                
            } else {  
                
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                
            }  
            
        });  
        $A.enqueueAction( actionNotesupdate );  
        
    },
    toastMsg : function( strType, strMessage ) {  
        
        var showToast = $A.get( "e.force:showToast" );   
        showToast.setParams({   
            
            message : strMessage,  
            type : strType,  
            mode : 'sticky'  
            
        });   
        showToast.fire();   
        
    } 
})