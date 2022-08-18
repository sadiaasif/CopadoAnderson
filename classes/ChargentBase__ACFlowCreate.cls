/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ACFlowCreate {
    global ACFlowCreate() {

    }
    @InvocableMethod(label='Create Automated Collections')
    global static List<ChargentBase.ACFlowCreate.AutomatedCollectionsOutput> createAutomatedCollections(List<ChargentBase.ACFlowCreate.AutomatedCollectionsInput> input) {
        return null;
    }
global class AutomatedCollectionsInput {
    @InvocableVariable(label='AC Process to Trigger' description='The Automated Collections Process to be triggered.' required=true)
    global String acConfigId;
    @InvocableVariable(label='Record ID List' description='Chargent Order Record IDs targeted for the triggering of Automated Collections.' required=true)
    global List<Id> lstRecordIds;
    @InvocableVariable(label='Post-Collection Payment Status' description='The value applied to the &apos;Payment Status&apos; field on the related Chargent Order record after this Automated Collections process has collected a payment.' required=false)
    global String postCollectionPaymentStatus;
    global AutomatedCollectionsInput() {

    }
}
global class AutomatedCollectionsOutput {
    @InvocableVariable(label='Result' description='Result of the operation.' required=false)
    global String message;
    @InvocableVariable(label='Chargent Orders - AC Not Triggered' description='The list of Chargent Order records for which AC could not be triggered.' required=false)
    global List<Id> orderIdFailed;
    @InvocableVariable(label='Chargent Orders - AC Triggered' description='The list of Chargent Order records for which AC has been triggered.' required=false)
    global List<Id> orderIdSuccessful;
    @InvocableVariable(label='DML Status' description='Status of the DML operation.' required=false)
    global String status;
    global AutomatedCollectionsOutput() {

    }
}
}
