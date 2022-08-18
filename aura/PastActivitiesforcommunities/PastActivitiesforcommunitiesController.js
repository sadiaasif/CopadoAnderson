({
	doInit : function(component, event, helper) {
               component.set( 'v.ActivitySearchcolumns', [ 
            {label: 'Owner', fieldName: 'OwnerName', type: 'text'},
            {label: 'Subject', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Subject' }, target: '_self'}}, 
            {label: 'Status', fieldName: 'Status', type: 'text'},
                     {label: 'Due Date', fieldName: 'ActivityDate', type: 'Date'},
          /*  {label: 'Update Comments', fieldName: 'Update_Comments__c', type: 'text',editable:'true'},*/
            {label: 'Comments', fieldName: 'Description', type: 'text'}, 
            {label: 'Record Type', fieldName: 'RecordType', type: 'text'},
            {label: 'Related To', fieldName: 'RealtedName', type: 'text'}
           /* {label: 'Owner', fieldName: 'OwnerName', type: 'text'},*/   
        ]);
                    helper.fetchRecords(component);
		
	},
  onActivitySearchSave:function(component, event, helper) {
          var updatedActivitySearchRecords = component.find( "ActivitySearchTable" ).get( "v.draftValues" );  
                   var taskfields=component.get("v.ActivitySearchcolumns");
                   event.preventDefault();
        var action = component.get( "c.updateActivitySearchrecord" );  
        action.setParams({  
              
            'updatedActivitySearchRecordList' : updatedActivitySearchRecords  
              
        });  
        action.setCallback( this, function( response ) {  
              
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
  
                if ( response.getReturnValue() === true ) {  
                      
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                    helper.fetchRecords(component);
                    component.find( "ActivitySearchTable" ).set( "v.draftValues", null );  

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