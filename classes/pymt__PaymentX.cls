/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PaymentX {
    global PaymentX() {

    }
    webService static String generateAccessKey() {
        return null;
    }
    webService static String getCurrencyFormatExpression(String siteName, String currencyCode) {
        return null;
    }
    global static String getGoogleMapsAPIKey() {
        return null;
    }
    global static String getKeychainEntrySerialized(String processorConnectionId) {
        return null;
    }
    webService static String getShortCurrencyFormatExpression(String siteName, String currencyCode) {
        return null;
    }
    webService static Id getSiteDefaultProcessorConnection(String siteName) {
        return null;
    }
    global static pymt__Sites_Website_Settings__c getSiteSettings(String siteName) {
        return null;
    }
    global static Boolean isAdvancedSitesEnabled() {
        return null;
    }
    webService static String isAlive() {
        return null;
    }
    global static Boolean isSitesDebugEnabled(String siteName) {
        return null;
    }
    global static void setKeychainEntryInTestMode(Id processorConnectionId, String jsonString) {

    }
    webService static pymt.PaymentX.TaxLookupResponse stateProvinceTaxLookup(String country, String state) {
        return null;
    }
    webService static pymt.PaymentX.APIPostResult testAPICall(String notification, String origin) {
        return null;
    }
    webService static String testNotificationHandler(String connectionId) {
        return null;
    }
    webService static pymt.PaymentX.TriggerShippingCalcResult triggerShippingCalc(String paymentXId, String shippingMethod) {
        return null;
    }
    webService static pymt.PaymentX.TriggerTaxCalcResult triggerTaxCalc(String paymentXId, String taxMethod) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResult triggerTaxCalculation(String paymentXId, String taxMethod) {
        return null;
    }
global class APIPostResult {
    @WebService
    webService String message;
    @WebService
    webService Boolean success;
    global APIPostResult() {

    }
}
global class CustomerInfo {
    @WebService
    webService String address;
    @WebService
    webService String city;
    @WebService
    webService String company;
    @WebService
    webService String country;
    @WebService
    webService String custId;
    @WebService
    webService String customerIP;
    @WebService
    webService String email;
    @WebService
    webService String fax;
    @WebService
    webService String firstname;
    @WebService
    webService String lastname;
    @WebService
    webService String phone;
    @WebService
    webService String postalCode;
    @WebService
    webService String state;
    global CustomerInfo() {

    }
}
global class ShippingInfo {
    @WebService
    webService String address;
    @WebService
    webService String city;
    @WebService
    webService String company;
    @WebService
    webService String country;
    @WebService
    webService String firstname;
    @WebService
    webService String lastname;
    @WebService
    webService String phone;
    @WebService
    webService String postalCode;
    @WebService
    webService String state;
    global ShippingInfo() {

    }
}
global class TaxLookupResponse {
    @WebService
    webService Integer errorCode;
    @WebService
    webService String message;
    @WebService
    webService Boolean success;
    @WebService
    webService Decimal value;
}
global class TransactionResult {
    @WebService
    webService Integer errorCode;
    @WebService
    webService String id;
    @WebService
    webService String message;
    @WebService
    webService Boolean success;
}
global class TransactionResultExt {
    @WebService
    webService Integer pxErrorCode;
    @WebService
    webService String pxId;
    @WebService
    webService String pxMessage;
    @WebService
    webService Boolean pxSuccess;
    @WebService
    webService String transErrorCode;
    @WebService
    webService String transMessage;
    @WebService
    webService String transResult;
}
global class TriggerShippingCalcResult {
    @WebService
    webService Decimal amount;
    @WebService
    webService Integer errorCode;
    @WebService
    webService String id;
    @WebService
    webService String message;
    @WebService
    webService Boolean success;
}
global class TriggerTaxCalcResult {
    @WebService
    webService Decimal amount;
    @WebService
    webService Integer errorCode;
    @WebService
    webService String id;
    @WebService
    webService String message;
    @WebService
    webService Boolean success;
}
}
