/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AuthNetCIM {
    global AuthNetCIM() {

    }
global class CreateCustomerProfileTransactionRequest {
    global Decimal amount;
    global String approvalCode;
    global String bankAccountNumberLast4;
    global String cardCode;
    global String cardNumberLast4;
    global String customerPaymentProfileId;
    global String customerProfileId;
    global String customerShippingAddressId;
    global pymt.AuthNetCIM.Duty duty;
    global String extraOptions;
    global List<pymt.AuthNetCIM.LineItem> lineItems;
    global pymt.AuthNetCIM.Order order;
    global Boolean recurringBilling;
    global String refId;
    global String routingNumberLast4;
    global pymt.AuthNetCIM.Shipping shipping;
    global String splitTenderId;
    global pymt.AuthNetCIM.Tax tax;
    global Boolean taxExempt;
    global pymt.AuthNetCIM.CreateCustomerProfileTransactionType transactionType;
    global String transId;
    global CreateCustomerProfileTransactionRequest() {

    }
    global String toXMLString(String apiLogin, String transKey) {
        return null;
    }
}
global enum CreateCustomerProfileTransactionType {AUTH_CAPTURE, AUTH_ONLY, CAPTURE_ONLY, PRIOR_AUTH_CAPTURE, REFUND, VOID_TRANSACTION}
}
