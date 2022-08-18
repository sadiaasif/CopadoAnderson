/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PayPalConnector extends pymt.PayPalConnectorBase {
    global PayPalConnector() {

    }
    webService static pymt.PaymentX.TransactionResultExt capturePayment(Boolean complete, Double amount, String paymentXId, String invoiceNum, String note) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt chargeCreditCard(String description, Decimal amount, String paymentXId, String invoiceNum, pymt.PayPalAPI.CustomerInfo customerInfo, pymt.PayPalAPI.ShippingInfo shippingInfo, String ccNumber, String ccType, String ccExp, String ccCVV, pymt.PayPalAPI.LineItemInfo lineItems, Decimal itemAmt, Decimal shippingAmt, Decimal handlingAmt, Decimal taxAmt, Boolean authOnly) {
        return null;
    }
    webService static pymt.PayPalConnector.CreateRecurringPaymentsProfileResult createRecurringPaymentsProfile(String connectionId, String requestParms) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt getRecurringPaymentsProfileDetails(String profileId, String connectionId, String format) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt getTransactionDetails(String paymentXId) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt manageRecurringPaymentsProfileStatus(String profileId, String processorConnection, String action, String note) {
        return null;
    }
    global static pymt.PaymentX.TransactionResultExt processCreditCard(pymt__PaymentX__c payment, List<pymt__Shopping_Cart_Item__c> cartItems, String connectionId, String description, Decimal amount, String currencyCode, String invoiceNum, pymt.PayPalAPI.CustomerInfo customerInfo, pymt.PayPalAPI.ShippingInfo shippingInfo, String ccNumber, String ccType, String ccExp, String ccCVV, String startDate, String issueNumber, Decimal itemAmt, Decimal shippingAmt, Decimal handlingAmt, Decimal taxAmt, Boolean authOnly) {
        return null;
    }
    global static pymt.PaymentX.TransactionResultExt processReferenceTransaction(pymt__PaymentX__c payment, List<pymt__Shopping_Cart_Item__c> cartItems, String connectionId, pymt.PayPalConnector.TransactionType transType, String description, Decimal amount, String currencyCode, String invoiceNum, pymt.PayPalAPI.CustomerInfo customerInfo, pymt.PayPalAPI.ShippingInfo shippingInfo, String referenceId, String ccType, String ccExp, String ccCVV, String ccLast4, String startDate, String issueNumber, Decimal itemAmt, Decimal shippingAmt, Decimal handlingAmt, Decimal taxAmt) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt refundTransaction(Boolean fullRefund, Double amount, String paymentXId, String note) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt voidAuthorization(String authorizationId, String paymentXId, String note) {
        return null;
    }
global class CreateRecurringPaymentsProfileResult {
    @WebService
    webService List<String> messages;
    @WebService
    webService String profileId;
    @WebService
    webService String response;
    @WebService
    webService String resultCode;
    @WebService
    webService String status;
}
global enum TransactionType {AUTH_CAPTURE, AUTH_ONLY}
}
