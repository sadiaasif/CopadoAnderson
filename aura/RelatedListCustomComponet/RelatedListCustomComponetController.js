({
    doInit: function(component, event, helper) {
        var actions = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'delete'}
            
        ];
        var actions1 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteCredit'}
            
        ];
        var actions2 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteSale'}
            
        ];
        var actions3 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteCase'}
            
        ];
        var actions4 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteRefund'}
            
        ];
        var actions5 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteTrust'}
            
        ];
        var actions6 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteActivity'}
            
        ];
        var actions7 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteAssign'}
            
        ];
        var actions8 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteMeeting'}
            
        ];
        var actions9 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteSetOfBooks'}
            
        ];
        var actions10 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteOrder'}
            
        ];
        var actions11 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteProject'}
            
        ];
        var actions12 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteSSQ'}
            
        ];
        var actions13 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteContact'}
            
        ];  
        
        var actions14 = [
            { label: 'Edit', name: 'edit' },
            { label: 'Delete', name: 'deleteFeedback'}
            
        ];  
        
        component.set('v.Contactcolumns', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'Account Roles', fieldName: 'Account_Roles__c', type: 'text', sortable: 'true'},
            {label: 'Email', fieldName: 'Email', type: 'text', sortable: 'true'},
            {label: 'Phone', fieldName: 'Phone', type: 'text', sortable: 'true'},
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            
            { type: 'action', typeAttributes: { rowActions: actions13  }}
        ]);
        
        component.set('v.Entitiescolumns', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'Status', fieldName: 'Status__c', type: 'text', sortable: 'true'},
            {label: 'EIN', fieldName: 'EIN__c', type: 'text', sortable: 'true'},
            {label: 'Tax Status', fieldName: 'Tax_Status__c', type: 'text', sortable: 'true'},
            {label: 'Disregarded To Entity', fieldName: 'Disregarded_To__c', type: 'text', sortable: 'true'},
            {label: 'Federal Return Due Date', fieldName: '	Federal_Return__c', type: 'text'},
            {label: 'Organization  State', fieldName: 'Organization_State__c', type: 'text'},
            
            
            { type: 'action', typeAttributes: { rowActions: actions }}
        ]);
        
        component.set('v.Salescolumns', [
            {label: 'Sale Record Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}}, 
            {label: 'Sale Type', fieldName: 'RecordType', type: 'text'},    
            
            {label: 'Stage', fieldName: 'StageName', type: 'text'},  
            {label: 'Close Date', fieldName: 'CloseDate', type: 'Date'},  
            
            {label: 'Amount', fieldName: 'Amount', type: 'currency', cellAttributes: { alignment: 'left' }},
            {label: 'Balance', fieldName: 'ChargentSFA__Balance_Due__c', type: 'currency', cellAttributes: { alignment: 'left' }},
            {label: 'Close Date', fieldName: 'CloseDate', type: 'date'},
            {label: 'Entity', fieldName: 'Entity', type: 'text'},    
            {label: 'Sales Rep', fieldName: 'SalesRep', type: 'text'},   
            {label: 'Owner Full Name', fieldName: 'Owner', type: 'text'}, 
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            
            { type: 'action', typeAttributes: { rowActions: actions2  }}
        ]);
        component.set('v.Casecolumns', [
            {label: 'Case', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'CaseNumber' }, target: '_blank'}}, 
            {label: 'Case RecordType', fieldName: 'CaseType', type: 'text'},    
            
            {label: 'Subject', fieldName: 'Subject', type: 'text'},  
            {label: 'Status', fieldName: 'Status', type: 'text'},  
            
            
            {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
            {label: 'Date Opened', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            {label: 'Last Modified', fieldName: 'ClosedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            { type: 'action', typeAttributes: { rowActions: actions3 }}
        ]);
        component.set('v.REfundscolumns', [
            {label: 'Refund Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}}, 
            {label: 'Status', fieldName: 'Status__c', type: 'text'}, 
            {label: 'Sale', fieldName: 'Sale__c', type: 'text'},  
            {label: 'Amount  to be refunded', fieldName: 'Amount_to_be_refunded__c', type: 'currency', cellAttributes: { alignment: 'left' }},
            
            
            {label: 'Owner', fieldName: 'OwnerId', type: 'text'},
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            {label: 'Last Modified', fieldName: 'ClosedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            { type: 'action', typeAttributes: { rowActions: actions4 }}
        ]);
        component.set('v.Bookkeepingcolumns', [
            {label: 'Subject',  fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Subject' }, target: '_blank'}},    
            {label: 'Summary', fieldName: 'Summary__c', type: 'text'},           
            {label: 'Assigned To', fieldName: 'WhoID', type: 'Date'},
            {label: 'Due Date', fieldName: 'ActivityDate', type: 'Date'},   
            {label: 'Last Modified', fieldName: 'LastModifiedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            { type: 'action', typeAttributes: { rowActions: actions6 }}
        ]);
        component.set('v.ccDetailcolumns', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'Card Number', fieldName: 'Card_Number__c', type: 'text'},
            {label: 'Card Type', fieldName: 'Card_Type__c', type: 'text'},  
            
            {label: 'Card Month', fieldName: 'Card_Month__c', type: 'text'}, 
            {label: 'Card Year', fieldName: 'Card_Year__c', type: 'text'}, 
            {label: 'Billing Zip/Postal Code', fieldName: 'Billing_Zip_Postal__c', type: 'text'}, 
            {label: 'Platinum Subscription', fieldName: 'Platinum_Subscription_Card__c', type: 'text'}, 
            
            
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            
            { type: 'action', typeAttributes: { rowActions: actions1 }}
        ]);
        component.set('v.Trustcolumns', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            
            {label: 'Created Dated', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            {label: 'Last Modified', fieldName: 'ClosedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            { type: 'action', typeAttributes: { rowActions: actions5 }}
        ]);
        
        component.set('v.AssIntrestcolumns', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            
            {label: 'Created Dated', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            
            { type: 'action', typeAttributes: { rowActions: actions7 }}
        ]);
        component.set('v.MeetingMincolumns', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}}, 
            
            {label: 'Created Dated', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            
            { type: 'action', typeAttributes: { rowActions: actions8 }}
        ]);
        component.set('v.SetofBookscolumns', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},
            {label: 'BookkeepingReviewer', fieldName: 'Bookkeeper__c', type: 'text'},
            {label: 'Client Name', fieldName: 'Client_Name__c', type: 'text'},            
            {label: 'Created Dated', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            
            { type: 'action', typeAttributes: { rowActions: actions9 }}
        ]);
        component.set('v.Projectscolumns', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_self'}},
            {label: 'Project Name', fieldName: 'Name', type: 'text'},
            {label: 'Client Last Name', fieldName: 'Client_Last_Name__c', type: 'text'},
            {label: 'Created Dated', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            
            { type: 'action', typeAttributes: { rowActions: actions11 }}
        ]);
        
        component.set('v.StrategySessionQuestionnairescolumns', [
            {label: 'Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'StrategySessionQuestionnaires Name', fieldName: 'Name', type: 'text'},
            {label: 'Networth', fieldName: 'Networth__c', type: 'text'},
            {label: 'Created Dated', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
            
            { type: 'action', typeAttributes: { rowActions: actions12 }}
        ]);
    			// feedback actions
      component.set('v.Feedbackcolumns', [
            {label: 'Feedback Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
           {label: 'Contact', fieldName: 'contactname', type: 'text', sortable: 'true'},
           {label: 'Created By', fieldName: 'createdbyname', type: 'text', sortable: 'true'},         
            {label: 'Created Dated', fieldName: 'CreatedDate', type: 'date', sortable: 'true', typeAttributes: {
                year: 'numeric',
                month: 'short',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            }},
           {label: 'NPS Rating', fieldName: 'NPS_Rating__c', type: 'text', sortable: 'true'},
          {label: 'Status', fieldName: 'Status__c', type: 'text', sortable: 'true'},
          {label: 'Survey Comments', fieldName: 'Survey_Comments__c', type: 'text', sortable: 'true'},

            
            { type: 'action', typeAttributes: { rowActions: actions14 }}
        ]);      
        
        component.set('v.Ordercolumns', [
            {label: 'Order Number', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'OrderNumber' }, target: '_blank'}}, 
            {label: 'Opportunity Name', fieldName: 'Opportunity_Name', type: 'text'},
            {label: 'Order Stage', fieldName: 'Stage__c', type: 'text'},
            //{label: 'Status', fieldName: 'Status', type: 'text'},
            {label: 'Completed Order Items', fieldName: 'Completed_Order_Items__c', type: 'text'},
            {label: 'Total Order Items', fieldName: 'Total_Order_Items__c', type: 'text'},
           // {label: 'Effective Date', fieldName: 'EffectiveDate', type: 'Date'}, 
            {label: 'Order Age', fieldName: 'Order_Age__c', type: 'text'},
            { type: 'action', typeAttributes: { rowActions: actions10 }}
        ]);

        helper.getSalesData(component, helper);
        helper.getContactData(component, helper);
        
        helper.getEntityData(component, helper);
        helper.getCaseData(component, helper);
        helper.getTrustData(component, helper);
        helper.getRefundsData(component, helper);
        
        helper.getccDetailData(component, helper);
    helper.getBookRData(component, helper);
      helper.getassignmentInnData(component, helper);
        
        
        
        helper.getMeetingMinData(component, helper);
        helper.getSetofBooksData(component, helper);
        helper.getProjectsData(component, helper);
        helper.getStrategySessionQuestionnairesData(component, helper);
        helper.getFeedbackData(component, helper);
        helper.getOrderData(component, helper);
        // Calling feedback
       
        
     /*jQuery("document").ready(function(){
             alert('jquery alert');
         console.log('jquery srk');
            /*$('.trigger-one').gpopover({
                width: 1200,
                preventHide: true,
                onShow: function() {
                    if (console && console.log) console.log("Popover shown.");
                },
                onHide: function() {
                    if (console && console.log) console.log("Popover hidden.");
                }
            });
        });*/
        
        
    },
    
    handleNextcontact : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumbercontact");
        component.set("v.pageNumbercontact", pageNumber+1);
        helper.getContactData(component, helper);
    },
    
    handlePrevcontact : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumbercontact");
        component.set("v.pageNumbercontact", pageNumber-1);
        helper.getContactData(component, helper);
    },
    handleNextSale : function(component, event, helper) { 
        var pageNumbersale = component.get("v.pageNumberSale");
        
        component.set("v.pageNumberSale", pageNumbersale+1);
        helper.getSalesData(component, helper);
    },
    
    handlePrevSale : function(component, event, helper) {        
        var pageNumbersale = component.get("v.pageNumberSale");
        component.set("v.pageNumberSale", pageNumbersale-1);
        helper.getSalesData(component, helper);
    },
    
    handleNextEn : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberEntity");
        component.set("v.pageNumberEntity", pageNumber+1);
        helper.getEntityData(component, helper);
    },
    
    handlePrevEn : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberEntity");
        component.set("v.pageNumberEntity", pageNumber-1);
        helper.getEntityData(component, helper);
    },
    handleNextCase : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumbercase");
        component.set("v.pageNumbercase", pageNumber+1);
        helper.getCaseData(component, helper);
    },
    
    handlePrevcase : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumbercase");
        component.set("v.pageNumbercase", pageNumber-1);
        helper.getCaseData(component, helper);
    },
    
    handleNextCase : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumbercase");
        component.set("v.pageNumbercase", pageNumber+1);
        helper.getCaseData(component, helper);
    },
    
    handlePrevTrust : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberTrust");
        component.set("v.pageNumberTrust", pageNumber-1);
        helper.getTrustData(component, helper);
    },
    
    handleNextTrust : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberTrust");
        component.set("v.pageNumberTrust", pageNumber+1);
        helper.getTrustData(component, helper);
    },
    
    handlePrevREfunds : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberREfunds");
        component.set("v.pageNumberREfunds", pageNumber-1);
        helper.getRefundsData(component, helper);
    },
    
    handleNextREfunds : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberREfunds");
        component.set("v.pageNumbercase", pageNumber+1);
        helper.getRefundsData(component, helper);
    },
    
    handlePrevBookkeeping : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberBookkeeping");
        component.set("v.pageNumberBookkeeping", pageNumber-1);
        helper.getBookRData(component, helper);
    },
    
    handleNextBookkeeping : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberBookkeeping");
        component.set("v.pageNumberBookkeeping", pageNumber+1);
        helper.getBookRData(component, helper);
    },
    
    handlePrevccDetail : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberccDetail");
        component.set("v.pageNumberccDetail", pageNumber-1);
        helper.getccDetailData(component, helper);
    },
    
    handleNextccDetail : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberccDetail");
        component.set("v.pageNumberccDetail", pageNumber+1);
        helper.getccDetailData(component, helper);
    },
    handlePrevAssIntrest : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberAssIntrest");
        component.set("v.pageNumberAssIntrest", pageNumber-1); 
        helper.getassignmentInnData(component, helper);
    },
    
    handleNextAssIntrest : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberAssIntrest");
        component.set("v.pageNumberAssIntrest", pageNumber+1);
        helper.getassignmentInnData(component, helper);
    },
    handlePrevMeetingMin : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberMeetingMin");
        component.set("v.pageNumberMeetingMin", pageNumber-1); 
        helper.getMeetingMinData(component, helper);
    },
    
    handleNextMeetingMin : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberMeetingMin");
        component.set("v.pageNumberMeetingMin", pageNumber+1);
        helper.getMeetingMinData(component, helper);
    },
    handlePrevSetofBooks : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberSetofBooks");
        component.set("v.pageNumberSetofBooks", pageNumber-1); 
        helper.getSetofBooksdata(component, helper);
    },
    
    handleNextSetofBooks : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberSetofBooks");
        component.set("v.pageNumberSetofBooks", pageNumber+1);
        helper.getSetofBooksdata(component, helper);
    },
    handlePrevProjects : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberProjects");
        component.set("v.pageNumberProjects", pageNumber-1); 
        helper.getProjectsdata(component, helper);
    },
    
    handleNextProjects : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberProjects");
        component.set("v.pageNumberProjects", pageNumber+1);
        helper.getProjectsdata(component, helper);
    },
    handlePrevStrategySessionQuestionnaires : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberStrategySessionQuestionnaires");
        component.set("v.pageNumberStrategySessionQuestionnaires", pageNumber-1); 
        helper.getStrategySessionQuestionnaires(component, helper);
    },
    
    handleNextStrategySessionQuestionnaires : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberStrategySessionQuestionnaires");
        component.set("v.pageNumberStrategySessionQuestionnaires", pageNumber+1);
        helper.getStrategySessionQuestionnaires(component, helper);
    },
    
    
    // Feedback prev and next 
    
     handlePrevFeedback : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberFeedback");
        component.set("v.pageNumberFeedback", pageNumber-1); 
        helper.getFeedbackData(component, helper);
    },
    
    handleNextFeedback : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberFeedback");
        component.set("v.pageNumberFeedback", pageNumber+1);
        helper.getFeedbackData(component, helper);
    },
    
    
    handlePrevOrder : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumberOrder");
        component.set("v.pageNumberOrder", pageNumber-1); 
        helper.getOrderData(component, helper);
    },
    
    handleNextOrder : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumberOrder");
        component.set("v.pageNumberOrder", pageNumber+1);
        helper.getOrderData(component, helper);
    },
    onSelectChange: function(component, event, helper) {
        var page = 1;
        helper.getContactData(component, helper);
        helper.getSalesData(component, helper);
        helper.getEntityData(component, helper);
        helper.getCaseData(component, helper);
        helper.getFeedbackData(component, page);
      
    },
    
    handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        console.log('action name=='+action.name);
        console.log('row test srk='+row);
        for (var key in row) {
            console.log('key='+key);
            console.log('key[0]=='+row[key]);
        }
        
        switch (action.name) {
            case 'edit':
                var editRecordEvent = $A.get("e.force:editRecord");
                editRecordEvent.fire({
                    "recordId":  row.Id
                });
                break;
            case 'delete':
                helper.deleteEntity(component, event, row.Id,helper);
                //helper.deleteEntity(component, event, row.Id,helper);
                break;
            case 'deleteCredit':
                helper.deletecreditCard(component, event, row.Id,helper);
                break;
            case 'deleteSale':
                helper.deleteSale(component, event, row.Id,helper);
                break;
            case 'deleteCase':
                helper.deleteCase(component, event, row.Id,helper);
                break;
            case 'deleteRefund':
                helper.deleteRefunds(component, event, row.Id,helper);
                break;
            case 'deleteTrust':
                helper.deleteTrusts(component, event, row.Id,helper);
                break;
            case 'deleteActivity':
                helper.deleteActivities(component, event, row.Id,helper);
                break;
            case 'deleteAssign':
                helper.deleteAssignment(component, event, row.Id,helper);
                break;
            case 'deleteMeeting':
                helper.deleteMeetingMin(component, event, row.Id,helper);
                break;
            case 'deleteSetOfBooks':
                helper.deleteSetofBooks(component, event, row.Id,helper);
                break;
            case 'deleteOrder':
                helper.deleteOrders(component, event, row.Id,helper);
                break;
            case 'deleteProject':
                helper.deleteProjects(component, event, row.Id,helper);
                break;
            case 'deleteSSQ':
                helper.deleteSSQs(component, event, row.Id,helper);
                break;
            case 'deleteContact':
                helper.deleteContacts(component, event, row.Id,helper);
                break;
                //Feedback delete
            case 'deleteFeedback':
                helper.deleteFeedback(component, event, row.Id,helper);
                break;
                
        }
    },
    
    createRecord : function (component) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var objectType = component.get("v.objectType");
        
        createRecordEvent.fire({
            "entityApiName": objectType
        });
    },
    
    handleApplicationEvent: function (component, event, helper) {
        var page = component.get("v.page") || 1;
        helper.getContactData(component, page);
        helper.getSalesData(component, page);
        helper.getEntityData(component, page);
        helper.getFeedbackData(component, page);
    },
    
    updateColumnSorting: function (component, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        component.set("v.sortedBy", fieldName);
        component.set("v.sortedDirection", sortDirection);
        helper.sortData(component, fieldName, sortDirection);
    },
    
    customcontactpopup: function (component, event, helper) {
        var cmpTarget = component.find('srktest');
        jQuery("document").ready(function(){
            
            $(".cmpTarget").hide();
        });
        
        
    },
    ContactopenPop : function(component, event, helper) {
        var cmpTarget = component.find('Contactpop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
           
            cssClass: "popoverclass2,slds-show"
        });*/
        $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    SalesopenPop : function(component, event, helper) {
        
        
        var cmpTarget = component.find('Salespop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
           
            cssClass: "popoverclass2,slds-show"
        });*/
        $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    ContactclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Contactpop');
        $A.util.removeClass(cmpTarget, 'slds-show');
        $A.util.addClass(cmpTarget, 'slds-hide');
        
        
    },
    SalesclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Salespop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    EntitiesopenPop : function(component, event, helper) {
        var cmpTarget = component.find('Entitiespop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    EntitiesclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Entitiespop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    
    caseopenPop : function(component, event, helper) {
        var cmpTarget = component.find('Casepop');
        $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    CaseclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Casepop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    EntitiesopenPop : function(component, event, helper) {
        var cmpTarget = component.find('Entitiespop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    EntitiesclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Entitiespop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    TrustopenPop : function(component, event, helper) {
        var cmpTarget = component.find('Trustpop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    TrustclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Trustpop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    REfundsopenPop : function(component, event, helper) {
        var cmpTarget = component.find('REfundspop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    REfundsclosePop : function(component, event, helper) {
        var cmpTarget = component.find('REfundspop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    BookkeepingrecordsopenPop : function(component, event, helper) {
        var cmpTarget = component.find('Bookkeepingpop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    BookkeepingclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Bookkeepingpop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    ccDetailopenPop : function(component, event, helper) {
        var cmpTarget = component.find('ccDetailpop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    ccDetailclosePop : function(component, event, helper) {
        var cmpTarget = component.find('ccDetailpop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    AssIntrestopenPop : function(component, event, helper) {
        var cmpTarget = component.find('AssIntrestpop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    AssIntrestclosePop : function(component, event, helper) {
        var cmpTarget = component.find('AssIntrestpop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    MeetingMinopenPop : function(component, event, helper) {
        var cmpTarget = component.find('MeetingMinpop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    MeetingMinclosePop : function(component, event, helper) {
        var cmpTarget = component.find('MeetingMinpop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    SetofBooksopenPop : function(component, event, helper) {
        var cmpTarget = component.find('SetofBookspop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    SetofBooksclosePop : function(component, event, helper) {
        var cmpTarget = component.find('SetofBookspop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    ProjectsopenPop : function(component, event, helper) {
        var cmpTarget = component.find('Projectspop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    ProjectsclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Projectspop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    
    StrategySessionQuestionnairesopenPop : function(component, event, helper) {
        var cmpTarget = component.find('StrategySessionQuestionnairespop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    StrategySessionQuestionnairesclosePop : function(component, event, helper) {
        var cmpTarget = component.find('StrategySessionQuestionnairespop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    
    // Feedback open close pop 
     FeedbackopenPop : function(component, event, helper) {
        var cmpTarget = component.find('Feedbackpop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */ 
         $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    FeedbackclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Feedbackpop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
        
    
    OrderopenPop : function(component, event, helper) {
        var cmpTarget = component.find('Orderpop');
        /*  $A.util.removeClass(cmpTarget, 'slds-hide');
   component.find('overlayLib').showCustomPopover({
            body: cmpTarget,
         
            cssClass: "popoverclass3,slds-show"
        });
   */    $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
        
    },
    
    OrderclosePop : function(component, event, helper) {
        var cmpTarget = component.find('Orderpop');
        
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
        
    },
    createSaleRecord : function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Opportunity",
            'defaultFieldValues': {
                
                'AccountId':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createContactRecord : function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Contact",
            'defaultFieldValues': {
                
                'AccountId':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createEntitiesRecord : function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Entities__c",
            'defaultFieldValues': {
                
                'Primary_Client__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createcaseRecord : function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Case",
            'defaultFieldValues': {
                
                'AccountId':parentRecordId,
            }
            
        });
        createRecordEvent.fire();
        
    },
    createCCRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Credit_Card_Detail__c",
            'defaultFieldValues': {
                
                'Account__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createTrustRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Trust__c",
            'defaultFieldValues': {
                
                'Primary_Client__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createRefundRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Refund__c",
            'defaultFieldValues': {
                
                'Client__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createActivityRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Task",
            'defaultFieldValues': {
                
                'Client__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createAssIntrestRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Assignment_of_Interest__c",
            'defaultFieldValues': {
                
                'Account__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createMeetingMinRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Meeting_Minutes__c",
            'defaultFieldValues': {
                
                'Client__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createSetofBooksRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Set_of_Books__c",
            'defaultFieldValues': {
                
                'Client__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    createProjectsRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "H2S__HarvestProject__c",
            'defaultFieldValues': {
                
                'H2S__Account__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    
    createStrategySessionQuestionnairesRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Strategy_Session_Questionnaire__c",
            'defaultFieldValues': {
                
                'Account__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    
    // Feedback Create Record 
    
     createFeedbackRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Feedback__c",
            'defaultFieldValues': {
                
                'Feedback__c':parentRecordId,
            }
        });
        createRecordEvent.fire();
        
    },
    
    
    createOrderRecord: function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        var parentRecordId = component.get("v.recordId");
        createRecordEvent.setParams({
            "entityApiName": "Order",
            'defaultFieldValues': {
                
                'AccountId':parentRecordId,
            }
            
        });
        createRecordEvent.fire();
        
    },
    gotoContactRelatedList : function (component, event, helper) {
        var relatedListEvent = $A.get("e.force:navigateToRelatedList");
        relatedListEvent.setParams({
            "relatedListId": "Contacts",
            "parentRecordId": component.get("v.recordId")
        });
        relatedListEvent.fire();
    },
    
    navigateToRelatedList: function(component,event,helper){
        var rlEvent = $A.get("e.force:navigateToRelatedList");
        var objName = event.currentTarget.getAttribute("data-attriVal");
        console.log('objName ='+ objName);
        rlEvent.setParams({
            "relatedListId": objName,
            "parentRecordId": component.get("v.recordId")
        });
        rlEvent.fire();
    },
    openModal: function(component, event, helper) {
        // set "isOpen" attribute to true to show model box
        component.set("v.isOpen", true);
        
    },
    closeModal: function(component, event, helper) {
        // set "isOpen" attribute to false for hide/close model box 
        component.set("v.isOpen", false);
    },
    
    doinit:function(component,event,helper){
        helper.fetchListOfRecordTypes(component,event);
        helper.fetchListOfCaseRecordTypes(component,event);
        helper.fetchListOfSalesRecordTypes(component,event);
        helper.fetchListOfTrustRecordTypes(component,event);
        helper.fetchListOfFeedbackRecordTypes(component,event);
        
    },
    
    /* In this "createRecord" function, first we have call apex class method 
    * and pass the selected RecordType values[label] and this "getRecTypeId"
    * apex method return the selected recordType ID.
    * When RecordType ID comes, we have call  "e.force:createRecord"
    * event and pass object API Name and 
    * set the record type ID in recordTypeId parameter. and fire this event
    * if response state is not equal = "SUCCESS" then display message on various situations.
    */
    createEntRecord: function(component, event, helper) {
        component.set("v.isOpen", true);
        var parentRecordId = component.get("v.recordId");
        var action = component.get("c.getRecTypeId");
        var recordTypeLabel = component.find("selectid").get("v.value");
        action.setParams({
            "recordTypeLabel": recordTypeLabel
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var createRecordEvent = $A.get("e.force:createRecord");
                var RecTypeID  = response.getReturnValue();
                createRecordEvent.setParams({
                    "entityApiName": 'Entities__c',
                    "recordTypeId": RecTypeID,
                    'defaultFieldValues': {
                        
                        'Primary_Client__c':parentRecordId,
                    }
                });
                createRecordEvent.fire();
                
            } else if (state == "INCOMPLETE") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops!",
                    "message": "No Internet Connection"
                });
                toastEvent.fire();
                
            } else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
    },
    
    
    // For Trsut 
    createTrustRecord: function(component, event, helper) {
        component.set("v.isOpen", true);
        var parentRecordId = component.get("v.recordId");
        var action = component.get("c.trustRecTypeId");
        var recordTypeLabel = component.find("selecttrustid").get("v.value");
        action.setParams({
            "recordTypeLabel": recordTypeLabel
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var createRecordEvent = $A.get("e.force:createRecord");
                var RecTypeID  = response.getReturnValue();
                createRecordEvent.setParams({
                    "entityApiName": 'Trust__c',
                    "recordTypeId": RecTypeID,
                    'defaultFieldValues': {
                        
                        'Primary_Client__c':parentRecordId,
                    }
                });
                createRecordEvent.fire();
                
            } else if (state == "INCOMPLETE") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops!",
                    "message": "No Internet Connection"
                });
                toastEvent.fire();
                
            } else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
    },
    
    
    
    
    
    createCasesRecord: function(component, event, helper) {
        component.set("v.isOpencase", true);
        var parentRecordId = component.get("v.recordId");
        var action = component.get("c.caseRecTypeId");
        
        var recordTypeLabel = component.find("selectcaseid").get("v.value");
        action.setParams({
            "recordTypeLabel": recordTypeLabel
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var createRecordEvent = $A.get("e.force:createRecord");
                var RecTypeID  = response.getReturnValue();
                createRecordEvent.setParams({
                    "entityApiName": 'Case',
                    "recordTypeId": RecTypeID,           
                    'defaultFieldValues': {
                        'AccountId':parentRecordId,
                    }
                    
                });
                createRecordEvent.fire();
                
            } else if (state == "INCOMPLETE") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops!",
                    "message": "No Internet Connection"
                });
                toastEvent.fire();
                
            } else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
    },
    deleteTableRow : function(component, event, helper) {
        
        var selectedPosters = component.get("v.selectedRows");
        var IDs = [];
        for (var i = 0; i < selectedPosters.length; i++){
            IDs[i] = selectedPosters[i].ID__c;
        }
        
        var action = component.get("c.deletePosterListByID");
        action.setParams({
            "idList": IDs
        });
        
        $A.enqueueAction(action);
        component.refreshDataTable();
    },
    openCaseModal: function(component, event, helper) {
        // set "isOpen" attribute to true to show model box
        component.set("v.isOpencase", true);
        
    },
    closeCaseModal: function(component, event, helper) {
        // set "isOpen" attribute to false for hide/close model box 
        component.set("v.isOpencase", false);
    },
    fetchListOfCaseRecordTypes: function(component, event, helper) {
        var action = component.get("c.fetchCaseRecordTypeValues");
        console.log('action=='+action);
        action.setCallback(this, function(response) {
            component.set("v.caselstOfRecordType", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    
    createSalesRecord: function(component, event, helper) {
        component.set("v.isOpensales", true);
        
        var action = component.get("c.salesRecTypeId");
        var recordTypeLabel = component.find("selectsaleid").get("v.value");
        action.setParams({
            "recordTypeLabel": recordTypeLabel
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var createRecordEvent = $A.get("e.force:createRecord");
                var RecTypeID  = response.getReturnValue();
                createRecordEvent.setParams({
                    "entityApiName": 'Opportunity',
                    "recordTypeId": RecTypeID
                });
                createRecordEvent.fire();
                
            } else if (state == "INCOMPLETE") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops!",
                    "message": "No Internet Connection"
                });
                toastEvent.fire();
                
            } else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
    },
    openSalesModal: function(component, event, helper) {
        // set "isOpen" attribute to true to show model box
        component.set("v.isOpensales", true);
        
    },
    closeSalesModal: function(component, event, helper) {
        // set "isOpen" attribute to false for hide/close model box 
        component.set("v.isOpensales", false);
    },
    
    openTrustModal: function(component, event, helper) {
        // set "isOpen" attribute to true to show model box
        component.set("v.isOpentrust", true);
        
    },
    closeTrustModal: function(component, event, helper) {
        // set "isOpen" attribute to false for hide/close model box 
        component.set("v.isOpentrust", false);
    },
    
     createFeedbackRecord: function(component, event, helper) {
        component.set("v.isOpenfeedback", true);
         var parentRecordId = component.get("v.recordId");
        var action = component.get("c.feedbackRecTypeId");
        var recordTypeLabel = component.find("selecfeedbackid").get("v.value");
        action.setParams({
            "recordTypeLabel": recordTypeLabel
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var createRecordEvent = $A.get("e.force:createRecord");
                var RecTypeID  = response.getReturnValue();
                createRecordEvent.setParams({
                    "entityApiName": 'Feedback__c',
                    "recordTypeId": RecTypeID,
                     'defaultFieldValues': {
                        'Client__c':parentRecordId,
                    }
                });
                createRecordEvent.fire();
                
            } else if (state == "INCOMPLETE") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops!",
                    "message": "No Internet Connection"
                });
                toastEvent.fire();
                
            } else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
    },
    
     OpenFeedbackModal: function(component, event, helper) {
        // set "isOpen" attribute to true to show model box
        component.set("v.isOpenfeedback", true);
        
    },
    closeFeedbackModal: function(component, event, helper) {
        // set "isOpen" attribute to false for hide/close model box 
        component.set("v.isOpenfeedback", false);
    },
    
    
    fetchListOfSalesRecordTypes: function(component, event, helper) {
        var action = component.get("c.fetchSalesRecordTypeValues");
        console.log('action=='+action);
        action.setCallback(this, function(response) {
            component.set("v.saleslstOfRecordType", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    getFruits : function(component, event, helper) {
       /* var fruits = _map.getFruits(); // Get the list of fruits from external Java Script Library 
        console.log(fruits);
        component.set("v.externalList", fruits); */
    },
    hideContact:function(component,event,helper){
        var elements = document.getElementsByClassName("contact-hide");
        elements[0].style.display = 'none';
    },
    hideSales:function(component,event,helper){
        var elements = document.getElementsByClassName("sales-hide");
        elements[0].style.display = 'none';
    },
    hideEntities:function(component,event,helper){
        var elements = document.getElementsByClassName("entities-hide");
        elements[0].style.display = 'none';
    },
    hideCases:function(component,event,helper){
        var elements = document.getElementsByClassName("cases-hide");
        elements[0].style.display = 'none';
    },
    hideTrusts:function(component,event,helper){
        var elements = document.getElementsByClassName("trust-hide");
        elements[0].style.display = 'none';
    },
    hideRefunds:function(component,event,helper){
        var elements = document.getElementsByClassName("refund-hide");
        elements[0].style.display = 'none';
    },
    hideActivities:function(component,event,helper){
        var elements = document.getElementsByClassName("activities-hide");
        elements[0].style.display = 'none';
    },
    hideCreditCard:function(component,event,helper){
        var elements = document.getElementsByClassName("credit-hide");
        elements[0].style.display = 'none';
    },
    hideAssign:function(component,event,helper){
        var elements = document.getElementsByClassName("assign-hide");
        elements[0].style.display = 'none';
    },
    hideMeetingMin:function(component,event,helper){
        var elements = document.getElementsByClassName("meetinmin-hide");
        elements[0].style.display = 'none';
    },
    hideSetOfBooks:function(component,event,helper){
        var elements = document.getElementsByClassName("setOfBook-hide");
        elements[0].style.display = 'none';
    },
    hideOrders:function(component,event,helper){
        var elements = document.getElementsByClassName("order-hide");
        elements[0].style.display = 'none';
    },
    hideProjects:function(component,event,helper){
        var elements = document.getElementsByClassName("project-hide");
        elements[0].style.display = 'none';
    },
    hideStrategySession:function(component,event,helper){
        var elements = document.getElementsByClassName("strategy-hide");
        elements[0].style.display = 'none';
    },
    
     // Feedback Hide 
    
     hideFeedback:function(component,event,helper){
        var elements = document.getElementsByClassName("feedback-hide");
        elements[0].style.display = 'none';
    },
    
    ExpJs : function(component, event, helper){
        //alert ('Hi I am Java Scripy')
        //myFunction();
    },
    DemoTest:function(component, event, helper){
        //alert ('Hi I am jquery testing Example');
        
        
        jQuery("document").ready(function(){
            console.log('loaded'); 
            /*
 * jquery-gpopover
 * http://github.com/markembling/jquery-gpopover
 *
 * A simple jQuery plugin for creating popover elements similar to Google's 
 * new 'apps' launcher/switcher.
 *
 * Copyright (c) 2013 Mark Embling (markembling.info)
 * Licensed under the BSD (3 clause) license.
 */
$(function(){
        // Use custom options for the right button
       $('.trigger-one').gpopover({
            //width: 1200,
            preventHide: true,
            onShow: function() {
                if (console && console.log) console.log("Popover shown.");
            },
            onHide: function() {
                if (console && console.log) console.log("Popover hidden.");
            }
        });
    });
            
(function($){
    
    var GPopover = function(element, options) {
        this.options = null;
        this.$trigger = null;
        this.$popover = null;
        
        this.init(element, options);
    }
    
    GPopover.prototype.init = function(element, options) {
        var that = this;
        
        this.options = $.extend({}, $.fn.gpopover.defaults, options);
        
        this.$trigger = $(element);
        this.$popover = $('#' + this.$trigger.data('popover'));
        
        this._addArrowElements();
        
        if (this.options.preventHide) {
            this._preventHideClickPropagation();
        }
        
        this.$trigger.mouseover(function(e){
            if (! that.$popover.is(":visible")) {
                // Trigger a click on the parent element (that can bubble up)
                $(this).parent().click();
                
                that.show();
                
                e.stopPropagation();
            }
            
            e.preventDefault();
        });
    }
    
    GPopover.prototype.show = function() {
        var that = this;
        
        // Set width before showing
        this.$popover.width(this.options.width);
        
        // Show the popover
        this.$popover.fadeIn(this.options.fadeInDuration);
        
        // Set up hiding
        $(document).one('click.popoverHide', function() {
            // _hidePopover($popover, settings);
            that.hide();
        });
    
        // Sort out the position (must be done after showing)
        var triggerPos = this.$trigger.offset();
        this.$popover.offset({
            left: (triggerPos.left + (this.$trigger.outerWidth() / 2)) - (this.$popover.outerWidth() / 2),
            top: triggerPos.top + this.$trigger.outerHeight() + 10  
            // the final 10 above allows room for the arrow above it
        });
    
        // Check and reposition if out of the viewport
        var positionXCorrection = this._repositionForViewportSides();
    
        // Set the position of the arrow elements
        this._setArrowPosition(positionXCorrection);
        
        // Call the callback
        this.options.onShow.call(this.$trigger, this.$popover);
    }
    
    GPopover.prototype.hide = function() {
        // Hide the popover
        this.$popover.fadeOut(this.options.fadeOutDuration);
        
        // Call the callback
        this.options.onHide.call(this.$trigger, this.$popover);
    }
    
    GPopover.prototype._addArrowElements = function() {
        this.$arrow = $('<div class="gpopover-arrow"></div>');
        this.$arrowShadow = $('<div class="gpopover-arrow-shadow"></div>');
        
        this.$popover.append(this.$arrow);
        this.$popover.append(this.$arrowShadow);
    }
    
    GPopover.prototype._preventHideClickPropagation = function() {
        /* Prevent clicks within the popover from being propagated 
           to the document (and thus stop the popover from being 
           hidden) */
        this.$popover.click(function(e) { e.stopPropagation(); });
    }
    
    GPopover.prototype._repositionForViewportSides = function() {
        var popoverOffsetLeft = this.$popover.offset().left,
            positionXCorrection = 0,
            $window = $(window);
        
        // Right edge
        if (popoverOffsetLeft + this.$popover.outerWidth() + this.options.viewportSideMargin > $window.width()) {
            var rightEdgeCorrection = -((popoverOffsetLeft + this.$popover.outerWidth() + this.options.viewportSideMargin) - $window.width());
            popoverOffsetLeft = popoverOffsetLeft + rightEdgeCorrection
        
            positionXCorrection = rightEdgeCorrection;
        }
        
        // Left edge
        if (popoverOffsetLeft < this.options.viewportSideMargin) {
            var leftEdgeCorrection = this.options.viewportSideMargin - popoverOffsetLeft;
            popoverOffsetLeft = popoverOffsetLeft + leftEdgeCorrection
            
            positionXCorrection += leftEdgeCorrection;
        }
        
        // Reposition the popover element if necessary
        if (positionXCorrection !== 0) {
            this.$popover.offset({ left: popoverOffsetLeft });
        }
        
        return positionXCorrection;
    }
    
    GPopover.prototype._setArrowPosition = function(positionXCorrection) {
        var leftPosition = (this.$popover.outerWidth() / 2) - (this.$arrow.outerWidth() / 2) - positionXCorrection;
        
        this.$arrow.css({ top: -7, left: leftPosition });
        this.$arrowShadow.css({ top: -8, left: leftPosition });
    }
    
    $.fn.gpopover = function(option) {
        return this.each(function(){
            var $this = $(this),
                data = $this.data('gpopover'),
                options = (typeof option == 'object' && option);
                
            // Initialise if not already done
            if (!data) {
                data = new GPopover(this, options);
                $this.data('gpopover', data);
            }
            
            // If the option parameter was a string, trigger the named function
            if (typeof option == 'string') data[option]();
        });
        
    };
    
    // Default settings
    $.fn.gpopover.defaults = {
        //width: 1000,             // Width of the popover
        fadeInDuration: 65,     // Duration of popover fade-in animation
        fadeOutDuration: 65,    // Duration of popover fade-out animation
        viewportSideMargin: 10, // Space to leave the side if out the viewport
        preventHide: false,     // Prevent hide when clicking within popover
        
        onShow: function() {},  // Called upon showing the popover
        onHide: function() {}   // Called upon hiding the popover
    };
    
})(jQuery);

            
        });
    }
    
    
})