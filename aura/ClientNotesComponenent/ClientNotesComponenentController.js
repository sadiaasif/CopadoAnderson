({
	doInit : function(component, event, helper) {
		    component.set( 'v.StructureNotescolumns', [    
                  {type: "button", typeAttributes: {
               
                label: 'View',
                name: 'View',
                title: 'View',
                disabled: false,
                value: 'Send Email',
                iconPosition: 'Right',
              alternativeText:"View More"
                      
            }},      
            {label: 'Notes', fieldName: 'Notes__c', type: 'text', initialWidth: 350,   editable: 'true'},    
            
             
           
            
        ]); 
                   component.set( 'v.TaxNotescolumns', [    
                        {type: "button", typeAttributes: {
               
                label: 'View',
                name: 'View',
                title: 'View',
                disabled: false,
                value: 'Send Email',
                iconPosition: 'Right',
              alternativeText:"View More"
                      
            }},     
            {label: 'Notes', fieldName: 'Notes__c', type: 'text',  initialWidth: 350,editable: 'true'},    
            
           
            
        ]); 
        helper.fetchNotes(component);
	},
     onStructureNotesRecordSave : function( component, event, helper ) {   
        
        var updatedNoteRecordList =component.find( "StructureNotesTable" ).get( "v.draftValues" ); 
        
        var actionAllnotessave = component.get( "c.updatedAllNotesRecords" );  
        actionAllnotessave.setParams({  
            
            'updatedNoteRecordList' : updatedNoteRecordList  
            
        });  
        actionAllnotessave.setCallback( this, function( response ) {  
            
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                   component.find( "StructureNotesTable" ).set( "v.draftValues", null );
                    helper.fetchNotes(component); 
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }  
                
            } else {  
                
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                
            }  
            
        });  
        $A.enqueueAction( actionAllnotessave );  
        
    },
    
     onTaxNotesRecordSave : function( component, event, helper ) {   
        
        var updatedNoteRecordList =component.find( "TaxNotesTable" ).get( "v.draftValues" ); 
        
        var actionAllnotessave = component.get( "c.updatedAllNotesRecords" );  
        actionAllnotessave.setParams({  
            
            'updatedNoteRecordList' : updatedNoteRecordList  
            
        });  
        actionAllnotessave.setCallback( this, function( response ) {  
            
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                   component.find( "TaxNotesTable" ).set( "v.draftValues", null );
                    helper.fetchNotes(component); 
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }  
                
            } else {  
                
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                
            }  
            
        });  
        $A.enqueueAction( actionAllnotessave );  
        
    },
 
    onSelectNoteTypeChange:function(component, event, helper) {
       
        var selectedType = component.find("NotestypeList").get("v.value");
      
        if(selectedType!='None'){
             component.set("v.NotesTypeSelected", true);
        }else{
            component.set("v.NotesTypeSelected", false);
        }
        
        
    },
    UpateNotes:function(component, event, helper) {
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
            
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                       component.set("v.NotesTypeSelected", false);
                    component.set("v.HideSpinner", false);
                    component.find("NotestypeList").set("v.value","--None--");

                    
                    helper.fetchNotes(component); 
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }  
                
            } else {  
                
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                
            }  
            
        });  
        $A.enqueueAction( actionNotesupdate );  
        
    },
     openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);
   },
  
   closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   },
  
   submitDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isModalOpen", false);
   },
    OpenstructureDetail:function(component, event, helper) {
        
         var rowId = event.getParam('row').Id;
         component.set("v.structureNotesID", rowId);
        component.set("v.isModalOpen", true);
     /*  var viewRecordEvent = $A.get("e.force:navigateToURL");
    viewRecordEvent.setParams({
                "url": "/" + rowId
            });
            viewRecordEvent.fire();*/
    },
    OpenTaxDetail:function(component, event, helper) {
        
         var rowId = event.getParam('row').Id;
         component.set("v.TaxNotesID", rowId);
        component.set("v.isModalOpen", true);
     /*  var viewRecordEvent = $A.get("e.force:navigateToURL");
    viewRecordEvent.setParams({
                "url": "/" + rowId
            });
            viewRecordEvent.fire();*/
    }


    
})