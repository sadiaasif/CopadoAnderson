/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ACWebservice {
    global ACWebservice() {

    }
    webService static ChargentBase.ACWebservice.ACCreateResult createAutomatedCollectionsForObject(List<String> lstRecordObjectIds, String processId, String onCompletePaymentStatus, String lookupRelationWithOrders) {
        return null;
    }
    webService static ChargentBase.ACWebservice.ACCreateResult createAutomatedCollections(List<String> lstRecordObjectIds, String processId, String onCompletePaymentStatus) {
        return null;
    }
global class ACCreateResult {
    @WebService
    webService String operationMessage;
    @WebService
    webService Boolean operationSuccess;
    @WebService
    webService List<ChargentBase.ACWebservice.ACCreateResultItem> recordsDetail;
    global ACCreateResult() {

    }
}
global class ACCreateResultItem {
    @WebService
    webService String message;
    @WebService
    webService String orderId;
    @WebService
    webService String recordId;
    @WebService
    webService String status;
    global ACCreateResultItem() {

    }
}
}
