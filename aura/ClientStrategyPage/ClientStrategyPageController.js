({
    doInit  : function(component, event, helper) {
       
        component.set( 'v.PlatinumSaleColumns', [    
              
             {label: 'Sale Record Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            {label: 'Sale Type', fieldName: 'SaleType', type: 'text'},    
            
             {label: 'Stage', fieldName: 'StageName', type: 'text'},  
             {label: 'Close Date', fieldName: 'CloseDate', type: 'Date'},  
               
             {label: 'Total Amount', fieldName: 'pymt__Total_Amount__c', type: 'currency', cellAttributes: { alignment: 'left' }},
            {label: 'Balance', fieldName: 'pymt__Balance__c', type: 'currency', cellAttributes: { alignment: 'left' }},
             {label: 'Entity', fieldName: 'EntiyName',  type: 'text'},  
             {label: 'Sales Rep', fieldName: 'SalesRep',  type: 'text'},    
            {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
            
        ]);
                    component.set( 'v.SalesDueNext30DaysColumns', [    
              
             {label: 'Sale Record Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            {label: 'Sale Type', fieldName: 'SaleType', type: 'text'},    
            
             {label: 'Stage', fieldName: 'StageName', type: 'text'},  
             {label: 'Close Date', fieldName: 'CloseDate', type: 'Date'},  
             
             {label: 'Total Amount', fieldName: 'pymt__Total_Amount__c', type: 'currency', cellAttributes: { alignment: 'left' }},
            {label: 'Balance', fieldName: 'pymt__Balance__c', type: 'currency', cellAttributes: { alignment: 'left' }},
            {label: 'Entity', fieldName: 'EntiyName',  type: 'text'},  
             {label: 'Sales Rep', fieldName: 'SalesRep',  type: 'text'},  
            {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
            
        ]);
             component.set( 'v.FillingFeesColumns', [    
              
             {label: 'Sale Record Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            {label: 'Sale Type', fieldName: 'SaleType', type: 'text'},    
            
             {label: 'Stage', fieldName: 'StageName', type: 'text'},  
             {label: 'Close Date', fieldName: 'CloseDate', type: 'Date'},  
             
             {label: 'Total Amount', fieldName: 'pymt__Total_Amount__c', type: 'currency', cellAttributes: { alignment: 'left' }},
            {label: 'Balance', fieldName: 'pymt__Balance__c', type: 'currency', cellAttributes: { alignment: 'left' }},
                 {label: 'Entity', fieldName: 'EntiyName',  type: 'text'},  
             {label: 'Sales Rep', fieldName: 'SalesRep',  type: 'text'},  
                {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
            
        ]);
        //Bookeeping 
     component.set( 'v.BKOpenCasesColumns', [    
            {label: 'Case Name',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'CaseNumber' }, target: '_self'}},    
            {label: 'Case Recordtype', fieldName: 'RecordType', type: 'text'},    
            
         	{label: 'Subject', fieldName: 'Subject', type: 'text'}, 
         	{label: 'Status', fieldName: 'Status', type: 'text'}, 
     {label: 'Tax Preparer Assigned	', fieldName: 'Tax_Preparer_Assigned__c', type: 'text'}, 
                    {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
         {label: 'Last Modified Date', fieldName: 'LastModifiedDate', type: 'Date'}, 
         {label: 'Date/Time Closed', fieldName: 'ClosedDate', type: 'Date'}, 
            
        ]);    
         component.set( 'v.BKClosedCasescolumns', [    
          {label: 'Sale Record Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            {label: 'Sale Type', fieldName: 'SaleType', type: 'text'},    
            
             {label: 'Stage', fieldName: 'StageName', type: 'text'},  
             {label: 'Close Date', fieldName: 'CloseDate', type: 'Date'},  
             
             {label: 'Total Amount', fieldName: 'pymt__Total_Amount__c', type: 'currency', cellAttributes: { alignment: 'left' }},
            {label: 'Balance', fieldName: 'pymt__Balance__c', type: 'currency', cellAttributes: { alignment: 'left' }},
             {label: 'Entity', fieldName: 'EntiyName',  type: 'text'},  
             {label: 'Sales Rep', fieldName: 'SalesRep',  type: 'text'},  
              {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
            
        ]);   
          component.set( 'v.TaxProjectsColumns', [    
            {label: 'Project Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},  
            {label: 'Harvest Project ID', fieldName: 'H2S__HarvestProjectID__c', type: 'text'},    
          {label: 'Package Burn', fieldName: 'Package_Burn__c', type: 'text'},
              {label: 'Project Code', fieldName: 'H2S__ProjectCode__c', type: 'text'},
         	{label: 'Total Project Fees', fieldName: 'H2S__TotalProjectFees__c', type: 'text'}, 
       
         {label: 'Package Hours Used', fieldName: 'Package_Hours_Used__c', type: 'currency', cellAttributes: { alignment: 'left' }}, 
         {label: 'Remaining Project Amount	', fieldName: 'Remaining_Project_Amount__c', type: 'currency', cellAttributes: { alignment: 'left' }}, 
               {label: 'Days Since Time Last Logged	', fieldName: 'H2S__DaysSinceTimeLastLogged__c', type: 'Date'}, 
              
            
        ]); 
                component.set( 'v.TaxSalescolumns', [    
                        {label: 'Sale Record Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            {label: 'Sale Type', fieldName: 'SaleType', type: 'text'},    
            
             {label: 'Stage', fieldName: 'StageName', type: 'text'},  
             {label: 'Close Date', fieldName: 'CloseDate', type: 'Date'},  
             
             {label: 'Total Amount', fieldName: 'pymt__Total_Amount__c', type: 'currency', cellAttributes: { alignment: 'left' }},
            {label: 'Balance', fieldName: 'pymt__Balance__c', type: 'currency', cellAttributes: { alignment: 'left' }},
                    {label: 'Entity', fieldName: 'EntiyName',  type: 'text'},  
             {label: 'Sales Rep', fieldName: 'SalesRep',  type: 'text'},  
                    {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
            
        ]); 
                        component.set( 'v.EntityFormationSaleColumns', [    
                        {label: 'Sale Record Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            {label: 'Sale Type', fieldName: 'SaleType', type: 'text'},    
            
             {label: 'Stage', fieldName: 'StageName', type: 'text'},  
             {label: 'Close Date', fieldName: 'CloseDate', type: 'Date'},  
             
             {label: 'Total Amount', fieldName: 'pymt__Total_Amount__c', type: 'currency', cellAttributes: { alignment: 'left' }},
            {label: 'Balance', fieldName: 'pymt__Balance__c', type: 'currency', cellAttributes: { alignment: 'left' }},
                    {label: 'Entity', fieldName: 'EntiyName',  type: 'text'},  
             {label: 'Sales Rep', fieldName: 'SalesRep',  type: 'text'}, 
                     {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
            
        ]); 
            component.set( 'v.RefundsColumns', [    
                        {label: 'Name', fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            {label: 'Status', fieldName: 'Status__c', type: 'text'},    
            
             {label: 'Sale', fieldName: 'Sale', type: 'text'},  
          
             
             {label: 'Amount to be refunded?', fieldName: 'Amount_to_be_refunded__c', type: 'currency', cellAttributes: { alignment: 'left' }},
                   {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
                  {label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            {label: 'Last Modified Date', fieldName: 'LastModifiedDate',  type: 'Date'},
            
        ]); 
         component.set( 'v.openASandEFCasesColumns', [    
            {label: 'Case Name',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'CaseNumber' }, target: '_self'}},    
            {label: 'Case Recordtype', fieldName: 'RecordType', type: 'text'},    
            
         	{label: 'Subject', fieldName: 'Subject', type: 'text'}, 
         	{label: 'Status', fieldName: 'Status', type: 'text'}, 
     {label: 'Tax Preparer Assigned	', fieldName: 'Tax_Preparer_Assigned__c', type: 'text'}, 
                    {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
         {label: 'Last Modified Date', fieldName: 'LastModifiedDate', type: 'Date'}, 
         {label: 'Date/Time Closed', fieldName: 'ClosedDate', type: 'Date'}, 
            
        ]);   
               component.set( 'v.CallTaskColumns', [    
            {label: 'Subject',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Subject' }, target: '_self'}},    
            {label: 'Summary', fieldName: 'Summary__c', type: 'text'},    
            
         	{label: 'Assigned To', fieldName: 'WhoID', type: 'Date'},
         	{label: 'Due Date', fieldName: 'ActivityDate', type: 'Date'}, 
     
         {label: 'Name', fieldName: 'LastModifiedDate', type: 'Date'}, 
       
              
        ]);   
                     component.set( 'v.AdvisorscallTaskcolumns', [    
            {label: 'Subject',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Subject' }, target: '_self'}},    
            {label: 'Summary', fieldName: 'Summary__c', type: 'text'},    
            
         	{label: 'Assigned To', fieldName: 'owner', type: 'text'},
         	{label: 'Due Date', fieldName: 'ActivityDate', type: 'Date'}, 
     
         {label: 'Last Modified Date', fieldName: 'LastModifiedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
              
        ]);   
        
        
                     component.set( 'v.ServicecallTaskcolumns', [    
            {label: 'Subject',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Subject' }, target: '_self'}},    
            {label: 'Summary', fieldName: 'Summary__c', type: 'text'},    
            
         	{label: 'Assigned To', fieldName: 'owner', type: 'text'},
         	{label: 'Due Date', fieldName: 'ActivityDate', type: 'Date'}, 
     
         {label: 'Last Modified Date', fieldName: 'LastModifiedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }}, 
       
              
        ]);   
                         
                     component.set( 'v.EntityTaxcolumns', [    
            {label: 'Name',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},    
          
           
        
          
                           {label: 'Tax Form', fieldName: 'Tax_Form__c', type: 'text'},
                      {label: 'Year End Selected', fieldName: 'Year_End_Selected__c', type: 'text'},
        
                         {label: 'Federal Return Due Date', fieldName: 'Federal_Return__c', type: 'text'},
                          {label: 'Organization State', fieldName: 'Organization_State__c', type: 'text'},
                          {label: 'Organizational Date', fieldName: 'Organizational_Date__c', type: 'Date'},
             
           
                        
         	
                         
                        
         	
     

       
              
        ]);   
          component.set( 'v.SetofBookscolumns', [    
            {label: 'Name',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},    
            {label: 'YTD Earnings', fieldName: 'YTD_Earnings__c',  type: 'currency', cellAttributes: { alignment: 'left' }},
               {label: 'Extension Filed', fieldName: 'Extension_Filed__c', type: 'Date'}, 
                {label: 'Sent To Tax', fieldName: 'Sent_To_Tax__c', type: 'Date'},  
                 {label: 'Return Filed', fieldName: 'Return_Filed__c', type: 'Date'},  
              
            {label: 'Bookkeeper', fieldName: 'Bookkeeper__c', type: 'text'},
            {label: 'Bookkeeping Reviewer', fieldName: 'Bookkeeping_Reviewer__c', type: 'text'},
                 
              
            
           
       
              
        ]);   
                component.set( 'v.SSQTablecolumns', [  
               {type: "button", typeAttributes: {
               
                label: 'View',
                name: 'View',
                title: 'View',
                disabled: false,
                value: 'Send Email',
                iconPosition: 'Right',
              alternativeText:"View More"
            }},
            {label: 'Name',  fieldName: 'Name'},    
       
              
        ]);   
           component.set( 'v.EventsAttenededcolumns', [    
            {label: 'Name',  fieldName: 'Name'},    
         	{label: 'Event', fieldName: 'EventName', type: 'text'},
            {label: 'First name', fieldName: 'contactFirstname', type: 'text'},
            {label: 'Last name', fieldName: 'contactLasName', type: 'text'},
            {label: 'Status', fieldName: 'status', type: 'text'},
              
        ]);   
                component.set( 'v.Feedbackcolumns', [    
              {label: 'Name',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},    
         	{label: 'NPS Rating', fieldName: 'NPSRating', type: 'text'},
               {label: 'Status', fieldName: 'Status', type: 'text'},
               {label: 'Survey Comments', fieldName: 'Survey_Comments__c', type: 'text'},
             
                 {label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }}
              
        ]);   
             component.set( 'v.Notescolumns', [  
                    {type: "button", typeAttributes: {
               
                label: 'View',
                name: 'View',
                title: 'View',
                disabled: false,
                value: 'View',
                iconPosition: 'Right',
              alternativeText:"View More"
                      
            }},
                       
            {label: 'Notes', fieldName: 'Notes__c', type: 'text',  initialWidth: 800, editable: 'true'},    
            
           
            
        ]); 
                   component.set( 'v.ContactwithEventcolumns', [    
            {label: 'Name',  fieldName: 'linkName', type: 'url', 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},    
            
            {label: 'Events Attended Info', fieldName: 'Events_Attended_Info__c', type: 'text'},
          
           
       
              
        ]);   
             /*  component.set( 'v.Taxcolumns', [    
            {label: 'Tax Record Name', fieldName: 'Name', type: 'text' },    
            {label: 'Advisor Internal Notes', fieldName: 'Updated_Internal_Notes__c', type: 'text'},    
            {label: 'Advisor Notes(Company Wide)', fieldName: 'Updated_Advisor_Notes_Company_Wide__c', type: 'text'},    
            {label: 'Preparer Company Wide Notes', fieldName: 'Updated_Preparer_Company_Wide_Notes__c', type: 'text'},    
            {label: '	Preparer Internal Notes', fieldName: 'Updated_Preparer_Internal_Notes__c', type: 'text'},    
            
        ]);
        component.set( 'v.OnlineQColumns', [
            {type: "button", typeAttributes: {
                iconName: 'utility:email',
                label: 'Send Email',
                name: 'Send Email',
                title: 'Send Email',
                disabled: false,
                value: 'Send Email',
                iconPosition: 'left'
            }},
            {label: 'Online Q Name', fieldName: 'Name', type: 'text' },    
            {label: 'Status', fieldName: 'Status__c', type: 'text'},    
            {label: '	Queue Run', fieldName: 'Queue_Run__c', type: 'Date/Time'},    
            {label: 'Client Email', fieldName: 'Client_Email__c', type: 'text',editable:'true'},    
            {label: '	Date Created', fieldName: 'CreatedDate', type: 'Date/Time'},    
            
        ]);*/
            
            
            helper.fetchAccounts(component);
            
            
            
            
            },
            navigateTocontactRecord : function(component, event, helper) {
            var Contactid = event.target.getAttribute('data-index');
            var cons = component.get("v.contacts")[Contactid];
                      var navEvent = $A.get("e.force:navigateToSObject");
        if(navEvent){
            navEvent.setParams({
                "recordId": cons.Id,
                "slideDevName": "detail"
            });
            navEvent.fire();  
        }
        
    },
    navigateToEntityRecord : function(component, event, helper) {
        var Entityid = event.target.getAttribute('data-index');
        
        var EntityRecord = component.get("v.EntitiesTaxReturnPagiList")[Entityid];
        
        var navEntityEvent = $A.get("e.force:navigateToSObject");
        if(navEntityEvent){
            navEntityEvent.setParams({
                "recordId": EntityRecord.Id,
                "slideDevName": "detail"
            });
            navEntityEvent.fire();  
        }
        
    },
    navigateToOnlineQ : function(component, event, helper) {
        var OnlineQid = event.target.getAttribute('data-index');
        var OnlineqRecord = component.get("v.OnlineQRecords")[OnlineQid];
        var navOnlineEvent = $A.get("e.force:navigateToSObject");
        if(navOnlineEvent){
            navOnlineEvent.setParams({
                "recordId": OnlineqRecord.Id,
                "slideDevName": "detail"
            });
            navOnlineEvent.fire();  
        }
        
    },
    
    
    onBookepingRecordSave : function( component, event, helper ) {   
        
        var updatedBookeepingRecords = component.find( "BookkeepingTable" ).get( "v.draftValues" );  
        var action = component.get( "c.updatedBookeepingRecords" );  
        action.setParams({  
            
            'updatedBookeepingRecordList' : updatedBookeepingRecords  
            
        });  
        action.setCallback( this, function( response ) {  
            
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                    component.find( "BookkeepingTable" ).set( "v.draftValues", null );  
                    helper.fetchAccounts(component); 
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }  
                
            } else {  
                
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                
            }  
            
        });  
        $A.enqueueAction( action );  
        
    },
    onTaxRecordSave : function( component, event, helper ) {   
        
        var updatedTaxRecords = component.find( "TaxTable" ).get( "v.draftValues" );  
        
        var Taxaction = component.get( "c.updatedTaxRecords" );  
        Taxaction.setParams({  
            
            'updatedTaxRecordList' : updatedTaxRecords  
            
        });  
        Taxaction.setCallback( this, function( response ) {  
            
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                    component.find( "TaxTable" ).set( "v.draftValues", null );  
                    helper.fetchAccounts(component); 
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }  
                
            } else {  
                
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                
            }  
            
        });  
        $A.enqueueAction( Taxaction );  
        
    } , 
    contactSave:function( component, event, helper ) {   
        var userId = $A.get("$SObjectType.CurrentUser.Id");
        event.preventDefault();
        var accId = component.get("v.recordId");
        var eventFields = event.getParam("fields");
        var updateNoteFields=component.get("v.AccountNotesUpdatedFields");
          var updateBookeepingNoteFields=component.get("v.BookkeepingNotesUpdatedFields");
        var updateServiceNoteFields=component.get("v.ServiceNotesUpdatedFields");
        var updateTaxNoteFields=component.get("v.TaxNotesUpdatedFields");
        var updateRenewalNoteFields=component.get("v.RenewalsNotesUpdatedFields");
         var updateAdvisorNotes = component.get( "v.AdvisorNotesUpdatedFields" );  
        var accaction = component.get( "c.updatedAccRecords" );  
        
        
        accaction.setParams({  
            
            'NoteFiedlsVals':eventFields,
            'accId':accId,
            'userId':userId
            
        });  
        accaction.setCallback( this, function( response ) {  
            
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                 helper.fetchAccounts(component);
                    
                    
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }
                
                component.find('AccountNoteTable').submit(updateNoteFields);
           
                 component.find('TaxNoteTable').submit(updateTaxNoteFields);
                 
                 component.find('RenewalsNoteTable').submit(updateRenewalNoteFields);
                  component.find('AdvisorNoteTable').submit(updateAdvisorNotes);
                
            } else {  
                
            helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                
            }  
            
        });  
        $A.enqueueAction( accaction );  
        
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
                    
                    component.find("NotestypeList").set("v.value","--None--");
					 component.set("v.NotestexArea", " ");
                    
                    helper.fetchAccounts(component); 
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
    onFilterNoteTypeChange:function(component, event, helper) {
       var selectedType = component.find("NotesFilterList").get("v.value");
        
      var accId = component.get("v.recordId");
        
     var actionNoteTypeFilter = component.get("c.getFilterdNotes");
      
        console.log(accId);
        actionNoteTypeFilter.setParams({
            "accId":accId,
            "NoteType":selectedType
        });
        actionNoteTypeFilter.setCallback(this, function(data) {
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
                             
                              if(rowvalue.CreatedBy.Name){
                                    rowvalue.CreatedBy=rowvalue.CreatedBy.Name;
                              }
                                
                                  
                              
                            
                               rowvalue.linkName = '/'+rowvalue.Id;
                   
            			}
                 component.set("v.NotesRecords",rowvalues );  
    }        
        });
	 $A.enqueueAction( actionNoteTypeFilter ); 
    
},
 
    onSelectNoteTypeChange:function(component, event, helper) {
       
        var selectedType = component.find("NotestypeList").get("v.value");
       
        if(selectedType!='None'){
             component.set("v.NotesTypeSelected", true);
        }else{
            component.set("v.NotesTypeSelected", false);
        }
        
        
    },
    onSelectChange : function(component, event, helper) {
         var accId = component.get("v.recordId");
 var pageSize = component.get("v.pageSize");
       
	var selected = component.find("EntityList").get("v.value");
        if(selected=='All'){
            component.set("v.Pageination", true);
        }else{
             component.set("v.Pageination", false);
        }
       var paginationList = [];
	var oppList = component.get("v.EntitiesTaxReturnList");
  var actionselectEn = component.get( "c.getslectedEntitieswithTaxreturn" );  
      
        actionselectEn.setParams({  
           
            'accId':accId,
            'selected':selected
            
        }); 
        
        actionselectEn.setCallback(this, function(data) {
              var state = data.getState()
              
    if (component.isValid() && state === 'SUCCESS') {
                    var rowvalues=   data.getReturnValue();
        if(rowvalues!=null){
            
      
       for (var i = 0; i < rowvalues.length; i++) {
            if(rowvalues[i]!=null){
            component.set("v.EntitiesTaxReturnList", rowvalues);        
            }
        	
        }
component.set("v.totalSize", component.get("v.EntitiesTaxReturnList").length);

component.set("v.start",0);

component.set("v.end",pageSize-1);

var paginationList = [];

for(var i=0; i< pageSize; i++)

{
 if(rowvalues[i]!=null){
paginationList.push(rowvalues[i]);
 }

}
       

               component.set("v.EntitiesTaxReturnPagiList",paginationList ); 
              }
    }        
         
            
        });  
        $A.enqueueAction( actionselectEn );  

},
    sendMail : function(component, event, helper){
        //   var rowId = event.getSource().get("v.tabindex");
        var rowId = event.getParam('row').Id;
        
        
        var action = component.get("c.sendOnlineQEmail");
        
        action.setParams({
            'accId': rowId 
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                if(rowId != ''  && response.getReturnValue() === true  ){
                    
                    helper.toastMsg( 'success', 'Email Sent Successfully.' );  
                    
                }
                else{
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );
                }
                
            }
        });
        $A.enqueueAction(action);
    },
  /*  first : function(component, event, helper)

	{

		var oppList = component.get("v.EntitiesTaxReturnList");

		var pageSize = component.get("v.pageSize");

		var paginationList = [];

		for(var i=0; i< pageSize; i++)

		{

			paginationList.push(oppList[i]);

		}

		component.set('v.EntitiesTaxReturnPagiList', paginationList);

},
    last : function(component, event, helper)

		{

			var oppList = component.get("v.EntitiesTaxReturnList");

			var pageSize = component.get("v.pageSize");

			var totalSize = component.get("v.totalSize");

			var paginationList = [];

			for(var i=totalSize-pageSize+1; i< totalSize; i++)

				{

					paginationList.push(oppList[i]);

				}

			component.set('v.EntitiesTaxReturnPagiList', paginationList);

},*/

    next : function(component, event, helper)

	{

		var oppList = component.get("v.EntitiesTaxReturnList");
       

		var end = component.get("v.end");

		var start = component.get("v.start");

		var pageSize = component.get("v.pageSize");

		var paginationList = [];

		var counter = 0;

		for(var i=end+1; i<end+pageSize+1; i++)

		{

		if(oppList.length > end)

		{
            if(oppList[i]!=null)
            {
            paginationList.push(oppList[i]);    
           
            }
     counter ++ ;
			

			

		}

		}

		start = start + counter;

		end = end + counter;

		component.set("v.start",start);

		component.set("v.end",end);
       var End=component.get("v.end");
        
      

		component.set('v.EntitiesTaxReturnPagiList', paginationList);

},

		previous : function(component, event, helper)

		{

			var oppList = component.get("v.EntitiesTaxReturnList");

			var end = component.get("v.end");

			var start = component.get("v.start");

			var pageSize = component.get("v.pageSize");

			var paginationList = [];

			var counter = 0;

	for(var i= start-pageSize; i < start; i++)

	{

		if(i > -1)

		{
            if(oppList[i]!=null){
                paginationList.push(oppList[i]);
            }
		

		counter ++;

		}

	else {

	start++;

		}

	}

	start = start - counter;

	end = end - counter;

	component.set("v.start",start);

	component.set("v.end",end);

	component.set('v.EntitiesTaxReturnPagiList', paginationList);

},
    onQRecordSave:function(component, event, helper){
        var updatedQRecords = component.find( "onlineQTable" ).get( "v.draftValues" );  
        var Qaction = component.get( "c.updatedQRecords" );  
        Qaction.setParams({  
            
            'updatedQRecordList' : updatedQRecords  
            
        });  
        Qaction.setCallback( this, function( response ) {  
            
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                    component.find( "onlineQTable" ).set( "v.draftValues", null );  
                    helper.fetchAccounts(component); 
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }  
                
            } else {  
                
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                
            }  
            
        });  
        $A.enqueueAction( Qaction );  
    },
    ShowEvents : function(component, event, helper){
       component.set("v.ShowEventsSection",true ); 
           var userlisencecheck= component.get("v.UserhasEventsLisence"); 
      
        if(userlisencecheck){
          
             var actionAttendee = component.get("c.getAttendee");
         var accId = component.get("v.recordId");
       var userId = $A.get("$SObjectType.CurrentUser.Id");
        actionAttendee.setParams({
            "accId":accId,
            "currentUserId":userId
        });
        actionAttendee.setCallback(this, function(data) {
              var state = data.getState()
               
    if (component.isValid() && state === 'SUCCESS') {
       
                        var EventsMap = data.getReturnValue();
        if(EventsMap!=null){
          
var Events = [];
             
                for(var key in EventsMap){
                     
                    Events.push({value:EventsMap[key], key:key}); 
                }
                component.set("v.EventsAttenededRecords",Events); 
                          
               
              component.set("v.showEvents",true ); 
          
        }else{
             component.set("v.showEvents",false );  
         
        }  
    }
         
        });
        
             $A.enqueueAction(actionAttendee); 
       
        }
    },
    createSSQRecord : function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Strategy_Session_Questionnaire__c"
        });
        createRecordEvent.fire();
         
    },
     RefreshSSQRecord : function (component, event, helper) {
         helper.fetchAccounts(component); 
         
    },   
    onNotesRecordSave : function( component, event, helper ) {   
        
        var updatedNoteRecordList =component.find( "NotesTable" ).get( "v.draftValues" ); 
        
        var actionAllnotessave = component.get( "c.updatedAllNotesRecords" );  
        actionAllnotessave.setParams({  
            
            'updatedNoteRecordList' : updatedNoteRecordList  
            
        });  
        actionAllnotessave.setCallback( this, function( response ) {  
            
            var state = response.getState();   
            if ( state === "SUCCESS" ) {  
                
                if ( response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                   component.find( "NotesTable" ).set( "v.draftValues", null );
                    helper.fetchAccounts(component); 
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }  
                
            } else {  
                
                helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                
            }  
            
        });  
        $A.enqueueAction( actionAllnotessave );  
        
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
    OpenDetail:function(component, event, helper) {
        
         var rowId = event.getParam('row').Id;
         component.set("v.SSQID", rowId);
        component.set("v.isModalOpen", true);
     /*  var viewRecordEvent = $A.get("e.force:navigateToURL");
    viewRecordEvent.setParams({
                "url": "/" + rowId
            });
            viewRecordEvent.fire();*/
    },  openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);
   },
  
   closeNotesModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isNotesModalOpen", false);
   },
  
   submitNotesDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isNotesModalOpen", false);
        helper.fetchAccounts(component);
   },
    OpenNotesDetail:function(component, event, helper) {
        
         var rowId = event.getParam('row').Id;
         component.set("v.NotesID", rowId);
        component.set("v.isNotesModalOpen", true);
      
    },
    

    
    
    
    
    
    
})