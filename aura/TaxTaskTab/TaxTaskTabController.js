({
	doInit : function(component, event, helper) {
               component.set( 'v.TaxTaskcolumns', [    
            {label: 'Subject', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Subject' }, target: '_self'}},    
            {label: 'Client Name', fieldName: 'ClientName', type: 'text'},    
            {label: 'Related To', fieldName: 'RealtedName', type: 'text'},    
            {label: 'Assigned To', fieldName: 'OwnerName', type: 'text'}, 
            {label: 'Comments', fieldName: 'Description', type: 'text'}, 
            {label: 'Tax Stage', fieldName: 'Tax_Stage__c', type: 'text'},
            {label: 'Update Comments', fieldName: 'Update_Comments__c', type: 'text',editable:'true'}
                   
          
        ]);
                    helper.fetchRecords(component);
		
	},
  onTaxRecordSave:function(component, event, helper) {
          var updatedTaxtaskRecords = component.find( "TaxTaskTable" ).get( "v.draftValues" );  
                   var taskfields=component.get("v.TaxTaskcolumns");
                   event.preventDefault();
        var action = component.get( "c.updateTaxtaskrecord" );  
        action.setParams({  
              
            'updatedtaxtaskRecordList' : updatedTaxtaskRecords  
              
        });  
        action.setCallback( this, function( response ) {  
              
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
  
                if ( response.getReturnValue() === true ) {  
                      
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                    helper.fetchRecords(component);
                    component.find( "TaxTaskTable" ).set( "v.draftValues", null );  
                    

                } else {   
                      
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                      
                }  
               
            } else {  
                  
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                  
            }  

        });  
        $A.enqueueAction( action );  
                   },
        Search: function(component, event, helper) {
         var searchField = component.find('searchField');
       
            helper.SearchHelper(component, event);
        
              
    }
                  
})