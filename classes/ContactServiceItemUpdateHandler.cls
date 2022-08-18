global class ContactServiceItemUpdateHandler {
    private static List<String> newServiceItemsOnOpp;
    private static FlowOutputs opt;
    @InvocableMethod(label = 'Get Contact Service Items')
    public static List<FlowOutputs> getServiceItems(List<FlowInputs> inputs) {
        newServiceItemsOnOpp = new List<String>();
        for(Infinity_Subscription_Product__mdt infinity : inputs[0].infinityProds){
            if(inputs[0].incomingSIs.contains(infinity.ASID__c)){
                newServiceItemsOnOpp.add(infinity.Infinity_Membership__c);
            }
        }
        for(Digital_Course__mdt digital : inputs[0].digitalProds){
            if(inputs[0].incomingSIs.contains(digital.ASID__c)){
                newServiceItemsOnOpp.add(digital.ASID__c);
            }
        }
        if(newServiceItemsOnOpp.size() > 0){
            //check if the existing contact items have these service items
            for(String asid : newServiceItemsOnOpp){
                if(!inputs[0].existingSIs.contains(asid)){
                    inputs[0].existingSIs += asid + ','; 
                }
            }
        }
        if(inputs[0].existingSIs != Null){
            opt = new FlowOutputs();
            opt.contactSIList = inputs[0].existingSIs;
            return new List<FlowOutputs>{opt};
        }
        return null;
    }
    
    public class FlowInputs{
        
        @InvocableVariable
        public String incomingSIs;
        
        @InvocableVariable
        public String existingSIs;
        
        @InvocableVariable
        public List<Infinity_Subscription_Product__mdt> infinityProds;
        
        @InvocableVariable
        public List<Digital_Course__mdt> digitalProds;
    }
    
    
    public class FlowOutputs{
        @InvocableVariable
        public String contactSIList;
    }
}