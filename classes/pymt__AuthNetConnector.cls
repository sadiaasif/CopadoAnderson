/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AuthNetConnector {
    global AuthNetConnector() {

    }
    webService static pymt.PaymentX.TransactionResultExt capturePayment(Decimal amount, String paymentXId) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt chargeCreditCard(String description, Decimal amount, String paymentXId, String invoiceNum, String poNum, Boolean emailCustomer, pymt.AuthNetAimAPI.CustomerInfo customerInfo, pymt.AuthNetAimAPI.ShippingInfo shippingInfo, String ccNumber, String ccExp, String ccCVV, String authCode, Boolean taxExempt, String authenticationIndicator, String cardholderAuthValue, Boolean authOnly) {
        return null;
    }
    global static pymt.PaymentX.TransactionResultExt processCIMTransaction(pymt.AuthNetCIM.CreateCustomerProfileTransactionRequest request, pymt__PaymentX__c payment, List<pymt__Shopping_Cart_Item__c> cartItems, String connectionId) {
        return null;
    }
    global static pymt.PaymentX.TransactionResultExt processCreditCard(pymt__PaymentX__c payment, List<pymt__Shopping_Cart_Item__c> cartItems, String connectionId, String description, Decimal totalAmt, Decimal shippingAmt, Decimal taxAmt, String currencyCode, String invoiceNum, String poNum, Boolean emailCustomer, pymt.AuthNetAimAPI.CustomerInfo customerInfo, pymt.AuthNetAimAPI.ShippingInfo shippingInfo, String ccNumber, String ccType, String ccExp, String ccCVV, String authCode, Boolean taxExempt, String authenticationIndicator, String cardholderAuthValue, Boolean authOnly) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt processECheck(String eCheckType, String description, Decimal amount, String paymentXId, String invoiceNum, String poNum, Boolean emailCustomer, pymt.AuthNetAimAPI.CustomerInfo customerInfo, pymt.AuthNetAimAPI.ShippingInfo shippingInfo, String bankCheckNumber, String abaCode, String accountNumber, String acctType, String bankName, String bankAcctName, pymt.AuthNetAimAPI.ECheckOptFields eCheckExtraInfo) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt refundTransaction(Decimal amount, String ccNumber, String paymentXId, String reason) {
        return null;
    }
    webService static pymt.PaymentX.TransactionResultExt voidTransaction(String paymentXId, String reason) {
        return null;
    }
}
