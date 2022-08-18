/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
@isTest
global virtual class SiteCheckoutPageController {
    global String bannerImage {
        get;
        set;
    }
    global String bannerImageId {
        get;
        set;
    }
    global String bannerImageURL {
        get;
        set;
    }
    global String billingcity {
        get;
        set;
    }
    global String billingcountry {
        get;
        set;
    }
    global String billingpostalcode {
        get;
        set;
    }
    global String billingstate {
        get;
        set;
    }
    global String billingstreet {
        get;
        set;
    }
    global String cancelTarget {
        get;
        set;
    }
    global String cancelURL {
        get;
        set;
    }
    global String cardType {
        get;
        set;
    }
    global List<pymt__Shopping_Cart_Item__c> cartItems {
        get;
        set;
    }
    @Deprecated
    global List<System.SelectOption> ccTypeOptions;
    global Contact checkoutContact {
        get;
        set;
    }
    global String creditCardNumber {
        get;
        set;
    }
    global String cvv {
        get;
        set;
    }
    global Boolean debug {
        get;
        set;
    }
    global Boolean disableForm {
        get;
        set;
    }
    global String expirationMonth {
        get;
        set;
    }
    global String expirationYear {
        get;
        set;
    }
    global String finishTarget {
        get;
        set;
    }
    global String finishURL {
        get;
        set;
    }
    global String fnameOnCard {
        get;
        set;
    }
    global Decimal handlingAmount {
        get;
        set;
    }
    global String invoiceNumber {
        get;
        set;
    }
    global String lnameOnCard {
        get;
        set;
    }
    global String logoImage {
        get;
        set;
    }
    global String logoImageId {
        get;
        set;
    }
    global String logoImageURL {
        get;
        set;
    }
    global pymt__PaymentX__c payment {
        get;
        set;
    }
    global String paymentId {
        get;
        set;
    }
    global Decimal preTaxAmount {
        get;
        set;
    }
    global Decimal shippingAmount {
        get;
        set;
    }
    global Boolean simulationMode {
        get;
        set;
    }
    global String stylesheetURL {
        get;
        set;
    }
    global String submitStatus {
        get;
        set;
    }
    global Decimal totalAmount {
        get;
        set;
    }
    global SiteCheckoutPageController() {

    }
    @Deprecated
    global System.PageReference cancelTransaction() {
        return null;
    }
    @Deprecated
    global System.PageReference finishTransaction() {
        return null;
    }
    @Deprecated
    global List<pymt__Shopping_Cart_Item__c> getAttachedCartItems() {
        return null;
    }
    @Deprecated
    global List<System.SelectOption> getCardTypeOptions() {
        return null;
    }
    @Deprecated
    global List<System.SelectOption> getExpMonthOptions() {
        return null;
    }
    @Deprecated
    global List<System.SelectOption> getExpYearOptions() {
        return null;
    }
    @Deprecated
    global String getFirstName(String name) {
        return null;
    }
    @Deprecated
    global Boolean getHasCartItems() {
        return null;
    }
    @Deprecated
    global String getLastName(String name) {
        return null;
    }
    @Deprecated
    global String getPtlIPAddress() {
        return null;
    }
    @Deprecated
    global System.PageReference processTransaction() {
        return null;
    }
    @Deprecated
    @isTest(SeeAllData=false OnInstall=false)
    global static void testSiteCheckoutPageController() {

    }
global class LocalException extends Exception {
}
global class LocalUserException extends Exception {
}
}
