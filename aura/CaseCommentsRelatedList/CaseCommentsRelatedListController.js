({
   init: function (cmp, event, helper) {
         var actions = [
            { label: 'Edit', name: 'edit' }
            
        ];
        cmp.set('v.RLcolumns', [
            {label: 'Comment', fieldName: 'CommentBody', type: 'text'},
            {label: 'Created Date', fieldName: 'CreatedDate', type: 'date',
             typeAttributes: {year:'numeric', month:'numeric', day:'numeric', hour:'2-digit', minute:'2-digit'}, initialWidth:'200'},
            {label: 'Created By', fieldName: 'createByName', type: 'text', initialWidth:'200'},
            {label: "Public", fieldName: "IsPublished", type: "boolean", cellAttributes: {
    iconName: { fieldName: 'IsPublished_chk' },
                'iconPosition': 'left'
            }},
            { type: 'action', typeAttributes: { rowActions: actions }}
        ]);
        helper.getData(cmp);
    },
     handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        switch (action.name) {
            case 'edit':
               
                 component.set('v.rowid', row.Id);
                  var RowId= component.get("v.rowid");
                
                component.set("v.isModalOpen", true);
                 var editCommentAction = component.get("c.EditCaseComment");
        editCommentAction.setParams({
           
            "caseCommentId": RowId
        });
        
        // Configure the response handler for the action
        editCommentAction.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
               var commentslist = response.getReturnValue();
              
                  component.set("v.editComment", commentslist);
            }
            else if (state === "ERROR") {
                console.log('Problem saving contact, response state: ' + state);
            }
            else {
                console.log('Unknown problem, response state: ' + state);
            }
        });
        $A.enqueueAction(editCommentAction);
        // Send the request to create the new comment
      
                break;
            case 'delete':
               
        }
    },
    
   displayAddComment: function (cmp, event, helper) { 
       var displayPopup = cmp.find("displayPopup");
       var backGroundSectionId = displayPopup.find("backGroundSectionId"); 
       
       $A.util.addClass(displayPopup, "slds-fade-in-open");
       $A.util.removeClass(displayPopup, "slds-fade-in-hide");
       
       $A.util.addClass(backGroundSectionId, "slds-backdrop--open");
       $A.util.removeClass(backGroundSectionId, "slds-backdrop--close");
   },
    
   hidePopup: function(component,event){
       var displayPopup = component.find("displayPopup");
       var backGroundSectionId = displayPopup.find("backGroundSectionId");
       
       $A.util.removeClass(displayPopup, "slds-fade-in-open");
       $A.util.addClass(displayPopup, "slds-fade-in-hide");
       
       $A.util.removeClass(backGroundSectionId, "slds-backdrop--open");
       $A.util.addClass(backGroundSectionId, "slds-backdrop--close");       
    }, 
    hideEditPopup: function(component,event){
           component.set("v.isModalOpen", false);   
    },
    handleEditComment: function(component, event, helper) {
        console.log('handleAddComment  ' + component.get("v.recordId"));
        
        // Prepare the action to create new case comment
        var addCommentAction = component.get("c.updateCaseComment");
        addCommentAction.setParams({
            "updatecaseComment": component.get("v.editComment"),
            "caseCommentId": component.get("v.rowid")
        });
        
        // Configure the response handler for the action
        addCommentAction.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
              if (response.getReturnValue() === true ) {  
                    
                    helper.toastMsg( 'success', 'Records Saved Successfully.' );  
                      component.set("v.isModalOpen", false);
                       $A.get("e.force:refreshView").fire();
                    helper.getData(cmp);
                   
                } else {   
                    
                    helper.toastMsg( 'error', 'Something went wrong. Contact your system administrator.' );  
                    
                }  
                       
               
            }
            else if (state === "ERROR") {
                console.log('Problem saving contact, response state: ' + state);
            }
            else {
                console.log('Unknown problem, response state: ' + state);
            }
        });
        
        // Send the request to create the new comment
        $A.enqueueAction(addCommentAction);        
    }
})