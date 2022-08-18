({
    doInit: function(component, event, helper) {
        
        var getList = component.get('v.items'); 
        var getElement = component.get('v.element');
        var getElementIndex = getList.indexOf(getElement);
        
        // if getElementIndex is not equal to -1 it's means list contains this element.
        var flag = component.get('v.flip');
        if(flag){
            if(getElementIndex != -1){ 
                component.set('v.condition',true);
            }else{
                component.set('v.condition',false);
            }
        }
        else{
            if(getElementIndex != -1){ 
                component.set('v.condition',false);
            }else{
                component.set('v.condition',true);
            }
        }
    }
})