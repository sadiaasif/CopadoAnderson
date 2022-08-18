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
    @InvocableMethod(label='Track Shipment (USPS)' description='Track Shipment.')
    global static void trackShipment(List<zkusps.InvocableTracking.TrackParameter> inputList) {

    }
global class TrackParameter {
    @InvocableVariable( required=false)
    global Boolean createShipmentIfNotFound;
    @InvocableVariable( required=false)
    global Id customAddressId;
    @InvocableVariable( required=false)
    global Id endiciaPreferenceId;
    @InvocableVariable( required=false)
    global Id express1ShippingPreferenceId;
    @InvocableVariable( required=false)
    global Boolean isReturnShipment;
    @InvocableVariable( required=false)
    global Id recordId;
    @InvocableVariable( required=true)
    global String trackingNumber;
    global TrackParameter() {

    }
}
}
