/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class stickItQueueManager {
    global stickItQueueManager() {

    }
    @RemoteAction
    global static void flagJobPrinted(List<String> qIds) {

    }
    @RemoteAction
    global static void flagJobReceived(List<String> qIds) {

    }
    @RemoteAction
    global static TSS_StickIt_MR1__StickIt_Queue__c getLabelXml(String qId) {
        return null;
    }
    global static String getOrgType() {
        return null;
    }
    @RemoteAction
    global static List<TSS_StickIt_MR1__StickIt_Queue__c> getPendingLabels(String printLocation) {
        return null;
    }
    @RemoteAction
    global static List<TSS_StickIt_MR1__StickIt_Queue__c> getPendingLabelsv2(List<String> printLocation) {
        return null;
    }
    @RemoteAction
    global static List<String> getPrintLocations() {
        return null;
    }
    global static String getSf_stickit() {
        return null;
    }
    @RemoteAction
    global static SObject updateRecord(Id rId, List<TSS_StickIt_MR1.stickItQueueManager.fieldUpdateDef> fieldUpdateDefs) {
        return null;
    }
global class fieldUpdateDef {
    global String field;
    global String fieldType;
    global String val;
}
}
