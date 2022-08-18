/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class stickItRemotingControllerv3 {
    global stickItRemotingControllerv3() {

    }
    @RemoteAction
    global static void addLabelToQueue(String labelXml, String labelName, String printer) {

    }
    @RemoteAction
    global static void addLabelsToQueue(Map<TSS_StickIt_MR1.stickItRemotingControllerv3.xmlObject,String> theLabels) {

    }
    @RemoteAction
    global static void deleteDefaultSettings(Id recordId) {

    }
    @RemoteAction
    global static TSS_StickIt_MR1__stickIt_defaults__c getDefaultSettings(List<String> rIds) {
        return null;
    }
    @RemoteAction
    global static List<SObject> getFieldValues(String fieldSelection, List<String> rIds, String orderFld) {
        return null;
    }
    @RemoteAction
    global static List<TSS_StickIt_MR1__StickIt_Label_Set__c> getLabelSets(String rId) {
        return null;
    }
    @RemoteAction
    global static Map<Id,TSS_StickIt_MR1.stickItRemotingControllerv3.labelObject> getLbls(List<String> rIds) {
        return null;
    }
    global static String getOrgType() {
        return null;
    }
    @RemoteAction
    global static List<Schema.PicklistEntry> getPicklistValues(String obj, String field) {
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
    global static List<TSS_StickIt_MR1.stickItRemotingControllerv3.xmlObject> getXmlListFromMap(Map<Id,List<Id>> labelsToPrint, String orderFld) {
        return null;
    }
    @RemoteAction
    global static List<TSS_StickIt_MR1.stickItRemotingControllerv3.xmlObject> getXmlList(List<String> tIds, List<String> rIds, String orderFld) {
        return null;
    }
    @RemoteAction
    global static String insertLabelPreviewAttachment(Id parentId, String title, String image) {
        return null;
    }
    @RemoteAction
    global static ContentDocumentLink insertLabelPreviewFile(Id parentId, String title, String image) {
        return null;
    }
    @RemoteAction
    global static List<Task> logActivities2(Map<String,String> fieldValueMap, List<String> rIds) {
        return null;
    }
    @RemoteAction
    global static void logActivities(String sub, List<String> rIds) {

    }
    @RemoteAction
    global static void saveDefaultSettings(String rId, Map<String,String> fieldValueMap) {

    }
    @RemoteAction
    global static void setDefaults(String rId, List<String> tIds, List<String> qtyPrefs, List<String> rollPrefs) {

    }
    @RemoteAction
    global static Set<Id> sortedIds(List<String> rIds, String orderField) {
        return null;
    }
    @RemoteAction
    global static SObject updateRecord(Id rId, List<TSS_StickIt_MR1.stickItRemotingControllerv3.fieldUpdateDef> fieldUpdateDefs) {
        return null;
    }
global class fieldUpdateDef {
    global String field;
    global String fieldType;
    global String val;
}
global class labelObject {
}
global class xmlObject {
    global Id lblId {
        get;
        set;
    }
    global String lblName {
        get;
        set;
    }
    global Integer lblOrder {
        get;
        set;
    }
    global String lblOrderVal {
        get;
        set;
    }
    global String lblXml {
        get;
        set;
    }
    global String sObjectId;
    global xmlObject(Integer lblOrder, String lblOrderVal, Id lblId, String lblName, String lblXml) {

    }
}
}
