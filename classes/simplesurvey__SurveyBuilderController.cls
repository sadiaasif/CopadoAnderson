/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SurveyBuilderController {
    global SurveyBuilderController() {

    }
    @RemoteAction
    global static Boolean checkFieldUsedInOtherFieldSets(String fieldName, String fieldSetName) {
        return null;
    }
    @RemoteAction
    global static Boolean checkFieldsetExists(String name) {
        return null;
    }
    @RemoteAction
    global static Boolean checkTemplateExists(String name, Id folderId) {
        return null;
    }
    @RemoteAction
    global static String getBaseUrl() {
        return null;
    }
    @RemoteAction
    global static simplesurvey__Survey_Configuration__c getConfiguration(Id surveyConfigId) {
        return null;
    }
    @RemoteAction
    global static Map<String,List<simplesurvey.SurveyBuilderController.Option>> getDocumentImagesMap() {
        return null;
    }
    @RemoteAction
    global static List<simplesurvey.SurveyBuilderController.Option> getDocumentImages() {
        return null;
    }
    @RemoteAction
    global static Map<String,String> getRecordTypeToLastCreatedMap() {
        return null;
    }
    @RemoteAction
    global static simplesurvey__Simple_Survey_Setting__c getSimpleSurveySettings() {
        return null;
    }
    @RemoteAction
    global static simplesurvey.SurveyBuilderController.Option getSingleObjectDescribe(String objectName) {
        return null;
    }
    @RemoteAction
    global static List<simplesurvey__Survey_Configuration__c> getSurveyConfigurations() {
        return null;
    }
    @RemoteAction
    global static List<simplesurvey.SurveyBuilderController.Option> getSurveyFromObjectAlternative(Id surveyConfigId) {
        return null;
    }
    @RemoteAction
    global static List<simplesurvey.SurveyBuilderController.FieldInfo> getSurveyFromObjectFields(String surveyObject) {
        return null;
    }
    @RemoteAction
    global static List<simplesurvey.SurveyBuilderController.Option> getSurveyFromObject(Id surveyConfigId) {
        return null;
    }
    @RemoteAction
    global static simplesurvey.SurveyBuilderController.SurveyObjectConfiguration getSurveyObjectConfiguration(Id surveyConfigId) {
        return null;
    }
    @RemoteAction
    global static Id getSurveyRecordTypeIdByDeveloperName(String developerName) {
        return null;
    }
    @RemoteAction
    global static simplesurvey.SurveyBuilderController.EmailTemplateInfo getTemplateInfo(Id surveyConfigId) {
        return null;
    }
    @RemoteAction
    global static Id insertTemplate(String name, String developerName, String subject, String description, String body, Id folderId) {
        return null;
    }
    @RemoteAction
    global static List<simplesurvey.SurveyBuilderController.Option> lookupUsers(String name) {
        return null;
    }
    @RemoteAction
    global static Id saveConfiguration(simplesurvey__Survey_Configuration__c config) {
        return null;
    }
    @RemoteAction
    global static String sendExternalMarketingInstructions(String email, String templateContent, String filename, String ratingScale, String surveyType) {
        return null;
    }
    @RemoteAction
    global static String sendInstructions(String template, String filename) {
        return null;
    }
    @RemoteAction
    global static simplesurvey.SurveyBuilderController.RemoteActionResult updateSurveyConfigurationToEclipse(Id surveyConfigId) {
        return null;
    }
    @RemoteAction
    global static simplesurvey.SurveyBuilderController.RemoteActionResult uploadFileChunk(String base64, String fileName, String fileId) {
        return null;
    }
    @RemoteAction
    global static simplesurvey.SurveyBuilderController.RemoteActionResult uploadImageFileChunk(String base64, String fileName, String fileId) {
        return null;
    }
global class EmailTemplateInfo {
    global EmailTemplateInfo() {

    }
}
global class FieldInfo extends simplesurvey.SurveyBuilderController.Option implements System.Comparable {
}
global virtual class Option implements System.Comparable {
}
global class RemoteActionResult {
}
global class SurveyObjectConfiguration {
    global SurveyObjectConfiguration() {

    }
}
}
