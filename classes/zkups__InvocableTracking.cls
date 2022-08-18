/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class InvocableTracking {
    global static Boolean STOP_INVOCABLE;
    global InvocableTracking() {

    }
    @InvocableMethod(label='Track Shipment (UPS)' description='Track Shipment.')
    global static void trackShipment(List<zkups.InvocableTracking.TrackParameter> inputList) {

    }
global class TrackParameter {
    @InvocableVariable( required=false)
    global Boolean createShipmentIfNotFound;
    @InvocableVariable( required=false)
    global Id customAddressId;
    @InvocableVariable( required=true)
    global Id preferenceId;
    @InvocableVariable( required=false)
    global Id recordId;
    @InvocableVariable( required=false)
    global String shipmentServiceType;
    @InvocableVariable( required=true)
    global String trackingNumber;
    @InvocableVariable( required=false)
    global String USPStrackingNumber;
    global TrackParameter() {

    }
}
}
