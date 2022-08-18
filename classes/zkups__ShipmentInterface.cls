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
    global static List<zkups.ShipmentRate> calculateRates(zkups__UPSShipmatePreference__c shipmatePreference, zkups__UPSShipment__c shipment, zkups__UPSShipmentSpecialServices__c specialServices, List<zkups__UPSPackage__c> packages) {
        return null;
    }
    global static Map<String,String> cancelShipment(zkups__UPSShipment__c shipment) {
        return null;
    }
    global static List<Attachment> convertLabelsGIF4x6ToPDF(List<Id> gifLabelIds) {
        return null;
    }
    @Future(callout=true)
    global static void createShipment(String jsonString) {

    }
    global static zkups.GlobalWebServiceResponse createShipment(zkups__UPSShipment__c shipment, zkups__UPSShipmatePreference__c shipmatePreference, User user, zkups__UPSShipmentSpecialServices__c shipmentSS, List<zkups.GlobalEntry> globalPackageEntries, List<zkups.GlobalEntry> globalCommodityEntries) {
        return null;
    }
    global static zkups.GlobalWebServiceResponse doPrintLabels(Map<Id,List<Attachment>> prefAttMap, Id userId) {
        return null;
    }
    global static zkups.GlobalWebServiceResponse doPrintLabels(Map<Id,List<zkups.FilesUtils.FileWrapper>> prefFileMap, Id userId) {
        return null;
    }
    global static List<zkups.GlobalEntry> fillGlobalEntries(List<zkups__UPSPackage__c> packageObjectList, List<zkups.GlobalEntry.CommodityWrapper> commodityWrapperList, String entryType) {
        return null;
    }
    global static Boolean fillPickupOnShipment(List<zkups__UPSShipment__c> shipmentList, zkups__UPSPickup__c pickup) {
        return null;
    }
    global static zkups.PrinterInfo fillSelectedPrinter(Set<Id> prefIds, Id userId) {
        return null;
    }
    global static zkups.ScaleInfo getScaleInfo(zkups__UPSShipmatePreference__c preference) {
        return null;
    }
    global static zkups.PickupInfo.CancelPickupReply pickupCancel(zkups__UPSShipmatePreference__c shipmatePreference, Id pickupObjectId) {
        return null;
    }
    global static zkups.PickupInfo.CreatePickupReply pickupCreate(zkups__UPSShipmatePreference__c shipmatePreference, zkups__UPSPickup__c pickupObject, List<zkups__UPSShipment__c> shipments) {
        return null;
    }
    @Future(callout=true)
    global static void saveSelectedRateToCAS(String jsonString) {

    }
    global static void startMassShipmentCancelBatch(String queryStr, Integer recordCount) {

    }
    global static zkups.TrackingInfo trackShipment(String trackingNumber, zkups__UPSShipmatePreference__c preference, Boolean checkShipmentInOrg) {
        return null;
    }
    @Future(callout=true)
    global static void trackShipmentFuture(String jsonString) {

    }
    global static zkups.ValidateAddressResult validateAddress(zkups__UPSShipment__c shipment, zkups__UPSShipmatePreference__c shipmatePreference) {
        return null;
    }
}
