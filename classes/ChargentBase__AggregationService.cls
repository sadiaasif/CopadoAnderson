/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AggregationService {
    global AggregationService() {

    }
    global static Boolean launchBatchEvent(String aggImplementationType) {
        return null;
    }
    global static Boolean launchEvent(String aggImplementationType, List<ChargentBase.AggregationService.AggregationEventData> lstEventData) {
        return null;
    }
global virtual class AggregationEventData {
    global String timestamp;
    global String token;
    global AggregationEventData() {

    }
}
global class AggregationEventDataAutomatedCollections extends ChargentBase.AggregationService.AggregationEventData {
    global ChargentBase.TChargentDynamics.ChargentAcConfiguration acConfig;
    global ChargentBase.TChargentDynamics.ChargentAutomatedCollection acRecord;
    global ChargentBase.AggregationEventType eventType;
    global Boolean isProcessExecuted;
    global List<ChargentBase.TChargentDynamics.ChargentAutomatedCollectionsStage> lstAcStages;
    global List<ChargentBase.TChargentDynamics.ChargentAcStagesConfiguration> lstAcStagesConfig;
    global AggregationEventDataAutomatedCollections() {

    }
}
global class AggregationEventDataGatewayUsage extends ChargentBase.AggregationService.AggregationEventData {
    global ChargentBase.ChargentWebService.ChargentWebOutput chargentWebOutput;
    global ChargentBase__Gateway__c gateway;
    global AggregationEventDataGatewayUsage() {

    }
}
}
