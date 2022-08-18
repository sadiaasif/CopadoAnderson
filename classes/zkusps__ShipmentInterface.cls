/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ShipmentInterface {
    global ShipmentInterface() {

    }
    global static List<zkusps.ShipmentRate> calculateRates(zkusps__EndiciaPreference__c endiciaPreference, zkusps__Shipment__c shipment, zkusps__MailPiece__c mailPiece, zkusps__SpecialServices__c specialServices) {
        return null;
    }
    global static List<zkusps.ShipmentRate> calculateRates(zkusps__Preference__c billingPreference, zkusps__Shipment__c shipment, zkusps__MailPiece__c mailPiece, zkusps__SpecialServices__c specialServices) {
        return null;
    }
    global static List<Attachment> convertLabelsGIF4x6ToPDF(List<Id> gifLabelIds) {
        return null;
    }
    global static List<Attachment> convertLabelsGIF6x4ToPDF(List<Id> gifLabelIds) {
        return null;
    }
    global static List<Attachment> convertLabelsPNGEnvelope10ToPDF(List<Id> pngLabelIds) {
        return null;
    }
    @Future(callout=true)
    global static void createShipment(String jsonString) {

    }
    global static void createShipmentSync(String jsonString) {

    }
    global static zkusps.GlobalWebServiceResponse doPrintLabels(Map<Id,List<Attachment>> prefAttMap, Id userId) {
        return null;
    }
    global static zkusps.GlobalWebServiceResponse doPrintLabels(Map<Id,List<zkusps.FilesUtils.FileWrapper>> prefFileMap, Id userId) {
        return null;
    }
    global static Map<String,String> getEndiciaLabelSizes(zkusps__Shipment__c shipment, String mailPieceShape, zkusps__SpecialServices__c specialServices) {
        return null;
    }
    global static zkusps.ScaleInfo getScaleInfo(zkusps__ShippingPreference__c pref, zkusps__EndiciaPreference__c endiciaPref) {
        return null;
    }
    @Future(callout=true)
    global static void saveSelectedRateToCAS(String jsonString) {

    }
    global static void saveSelectedRateToCASSync(String jsonString) {

    }
    global static zkusps.TrackingInfo trackShipment(String trackingNumber, Boolean checkShipmentInOrg) {
        return null;
    }
    global static zkusps.TrackingInfo trackShipment(String trackingNumber, zkusps__EndiciaPreference__c endiciaPreference, Boolean checkShipmentInOrg) {
        return null;
    }
    global static zkusps.TrackingInfo trackShipment(String trackingNumber, zkusps__Preference__c billingPreference, Boolean checkShipmentInOrg) {
        return null;
    }
    @Future(callout=true)
    global static void trackShipmentFuture(String jsonString) {

    }
    global static void trackShipmentFutureSync(String jsonString) {

    }
    global static zkusps.GlobalWebServiceResponse webServiceRequest(String requestName, Map<String,Object> requestMap, zkusps__EndiciaPreference__c endiciaPrefGlobal, zkusps__Preference__c expressPrefGlobal) {
        return null;
    }
}
