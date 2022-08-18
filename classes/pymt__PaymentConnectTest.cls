/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PaymentConnectTest {
    global pymt__Settings__c settings;
    global PaymentConnectTest() {

    }
    global PaymentConnectTest(pymt.PaymentConnectTest.SettingsType settingType) {

    }
    global PaymentConnectTest(pymt.PaymentConnectTest.SettingsType settingType, pymt.PaymentConnectTest.ProcessorConnectionType procConnType) {

    }
    global pymt__Processor_Connection__c addProcessorConnection(pymt.PaymentConnectTest.ProcessorConnectionType procConnType) {
        return null;
    }
    global pymt__Settings__c addSettingsRecord(pymt.PaymentConnectTest.SettingsType settingType) {
        return null;
    }
    global static Account genericAccount() {
        return null;
    }
    global static Contact genericContact() {
        return null;
    }
    global void removeProcessorConnections() {

    }
global enum ProcessorConnectionType {ACHWORKS, AUTHNET, EWAYAUSHARED, EWAYAUSHAREDCVN, EWAYAUXML, EWAYAUXMLCVN, EWAYDIRECTCONNECTION, GOOGLE, PAYPALSTD, PAYPALWPP, STRIPE, WORLDPAY}
global enum SettingsType {GATEWAYSIM_STOREDBANKACCOUNTS, GATEWAYSIM_STOREDCREDITCARDS, STDGATEWAYSIM}
}
