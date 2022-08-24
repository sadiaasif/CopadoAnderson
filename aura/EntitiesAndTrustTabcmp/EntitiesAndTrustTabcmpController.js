({
    doInit : function(component, event, helper) {
        
        var actions = [
            { label: 'Edit', name: 'edit' }
            
        ];
        component.set( 'v.Entitycolumns', [    
            {label: 'Entity Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'Type', fieldName: 'RecordTypeEn', type: 'text'},
            {label: 'Organization  State', fieldName: 'Organization_State__c', type: 'text'},
            {label: 'Entity Origin', fieldName: 'Origin__c', type: 'text'}, 
            {label: 'Status', fieldName: 'Status__c', type: 'text', sortable: 'true'},
            {label: 'Organization Date', fieldName: 'Organizational_Date__c', type: 'Date'},
            {label: 'Structure', fieldName: 'Structure__c', type: 'text'},
            {label: 'Tax Status', fieldName: 'Tax_Status__c', type: 'text', sortable: 'true'},
            {label: 'Disregarded To Entity', fieldName: 'Disregarded', type: 'text', sortable: 'true'},
            {label: 'Federal Return Due Date', fieldName: '	Federal_Return__c', type: 'text'},
            
            
            
            
            { type: 'action', typeAttributes: { rowActions: actions }}
        ]);
        component.set( 'v.trustcolumns', [    
            {label: 'Entity Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
            {label: 'Type', fieldName: 'RecordType', type: 'text'}, 
            {label: 'Case', fieldName: 'CaseNumber', type: 'text'},    
            {label: 'Consult Scheduled', fieldName: 'Consult_Scheduled__c', type: 'Date'},
            {label: '	Assigned Paralegal', fieldName: 'AssignedP', type: 'text'},
            {label: 'LivingTrustAttorney', fieldName: 'LivingTrustAttorney', type: 'text'},
            {label: 'Documents Complete', fieldName: 'Documents_Complete__c', type: 'Date'},
            {label: 'Date Shipped', fieldName: 'Date_Shipped__c', type: 'Date'},
            { type: 'action', typeAttributes: { rowActions: actions }}
        ]);
        
        helper.fetchRecords(component);
    },
    
    handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        switch (action.name) {
            case 'edit':
                var editRecordEvent = $A.get("e.force:editRecord");
                editRecordEvent.fire({
                    "recordId":  row.Id
                });
                break;
                
        }},
    SearchEntity: function(component, event, helper) {
        var searchField = component.find('searchEntityField');
        
        helper.SearchEntityHelper(component, event);
        
    },
    SearchTrust: function(component, event, helper) {
        var searchField = component.find('searchTrustField');
        
        helper.SearchTrustHelper(component, event);
        
    }
})