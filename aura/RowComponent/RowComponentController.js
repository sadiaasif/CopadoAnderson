({
    
    doInit: function(component, event, helper) {   
        helper.fetchPickListVal(component, 'Processor__c', 'processorPicklistOpts');
        var action = component.get("c.insideCommunity");
        action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var res = response.getReturnValue();
                  console.log(JSON.stringify(res));
                  component.set("v.isCommunity", res);
            }
        });
        $A.enqueueAction(action);
    },
    
    inlineEditComment : function(component,event,helper){    
        component.set("v.commentEditMode", true);    
        setTimeout(function(){ 
            component.find("inputId").focus();
        }, 100);
    },
    
    inlineEditComments : function(component,event,helper){    
        component.set("v.commentsEditMode", true);    
        setTimeout(function(){ 
            component.find("inputId2").focus();
        }, 100);
    },
    
    inlineEditEntity : function(component,event,helper){    
        component.set("v.entityEditMode", true);
        component.set("v.showSaveCancelBtn",true);
    },
    
    inlineEditDate : function(component,event,helper){    
        component.set("v.dateEditMode", true);
        setTimeout(function(){ 
            component.find("expdate").focus();
        }, 100);
    },
    inlineEditDate2 : function(component,event,helper){    
        component.set("v.dateEditMode2", true);
        setTimeout(function(){ 
            component.find("expdate2").focus();
        }, 100);
    },
    
    dateChange : function(component,event,helper){    
        component.set("v.showSaveCancelBtn",true);
        component.set("v.dateEditMode", false);
    },
    dateChange2 : function(component,event,helper){    
        component.set("v.showSaveCancelBtn",true);
        component.set("v.dateEditMode2", false);
    },
    
    inlineEditStage : function(component,event,helper){
        component.set("v.Spinner", true);
        var typeName = component.get("v.singleRec.Type__c");
        helper.fetchDepPickListVal(component, 'stagePicklistOpts', typeName);
    },
    
    inlineEditProcessor : function(component,event,helper){   
        component.set("v.processorEditMode", true); 
        component.find("processorId").set("v.options" , component.get("v.processorPicklistOpts"));   
        setTimeout(function(){ 
            component.find("processorId").focus();
        }, 100);
    },
    
    onCommentChange : function(component,event,helper){ 
        if(event.getSource().get("v.value").trim() != ''){ 
            component.set("v.showSaveCancelBtn",true);
        }
    },
    
    
    onStageChange : function(component,event,helper){ 
        component.set("v.showSaveCancelBtn",true);
    },
    
    onProcessorChange : function(component,event,helper){ 
        component.set("v.showSaveCancelBtn",true);
    },
    
    closeCommentBox : function (component, event, helper) {
        component.set("v.commentEditMode", false);    
        if(event.getSource().get("v.value").trim() == ''){
            component.set("v.showErrorClass",true);
        }else{
            component.set("v.showErrorClass",false);
        }
    },
    
    closeCommentsBox : function (component, event, helper) {   
        component.set("v.commentsEditMode", false);    
        if(event.getSource().get("v.value").trim() == ''){
            component.set("v.showErrorClass",true);
        }else{
            component.set("v.showErrorClass",false);
        }
    },
    
    closeStageBox : function (component, event, helper) {
        component.set("v.stageEditMode", false); 
    },
    
    closeProcessorBox : function (component, event, helper) {
        component.set("v.processorEditMode", false); 
    },
    
    redirectToService : function (component, event, helper) {
        var rId = component.get("v.singleRec.Id");
        var inCommunity = component.get("v.isCommunity");
        if(inCommunity){
        	window.open('/aba/' + rId);
        }
        else{
            window.open('/' + rId);
        }
    },
    
    redirectToEntity : function (component, event, helper) {
        var rId = component.get("v.singleRec.Entity__c");
        var inCommunity = component.get("v.isCommunity");
        if(inCommunity){
        	window.open('/aba/' + rId);
        }
        else{
            window.open('/' + rId);
        }
    },

    hideSpinner : function(component, event, helper){
        component.set("v.Spinner", false);
    }
    
   
})