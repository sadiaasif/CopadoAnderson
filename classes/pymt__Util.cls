/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class Util {
    global Util() {

    }
    global static String addURLEncodedParm(String key, String value) {
        return null;
    }
    global static String assignIfNotEmpty(String newVal, String defaultVal) {
        return null;
    }
    global static Id assignIfNotNull(Id newVal, Id defaultVal) {
        return null;
    }
    global static Date assignIfNotNull(Date newVal, Date defaultVal) {
        return null;
    }
    global static Integer assignIfNotNull(Integer newVal, Integer defaultVal) {
        return null;
    }
    global static Decimal assignIfNotNull(Decimal newVal, Decimal defaultVal) {
        return null;
    }
    global static Integer assignIfNotNullOrZero(Integer newVal, Integer defaultVal) {
        return null;
    }
    global static Decimal assignIfNotNullOrZero(Decimal newVal, Decimal defaultVal) {
        return null;
    }
    global static Double coalesce(Double x, Double y) {
        return null;
    }
    global static String coalesce(String x, String y) {
        return null;
    }
    global static String concatFirstAndLastName(String firstname, String lastname) {
        return null;
    }
    global static String convertCountryToISO(String country) {
        return null;
    }
    global static String convertISOToSFCountry(String ISOCode) {
        return null;
    }
    global static String convertISOToStateProvince(String countryISOCode, String stateISOCode) {
        return null;
    }
    global static String convertStateProvinceToISO(String state, String country) {
        return null;
    }
    global static List<System.SelectOption> countryNamePicklistOptions(pymt.Util.CountryNamePicklistType listType) {
        return null;
    }
    global static List<System.SelectOption> countryNamePicklistOptions(pymt.Util.CountryNamePicklistType listType, Boolean filterOFAC) {
        return null;
    }
    global static String currencySymbol(String currencyISOCode) {
        return null;
    }
    global static String currencySymbolHTML(String currencyISOCode) {
        return null;
    }
    webService static String errorMessage(Integer code) {
        return null;
    }
    global static List<String> firstAndLastFromFullName(String fullname) {
        return null;
    }
    global static String firstN(String strval, Integer n) {
        return null;
    }
    global static String formatNVPairs(Map<String,String> nvPairs) {
        return null;
    }
    global static String getCurrencyFormatExpression(String siteName, String currencyCode) {
        return null;
    }
    global static Id getLoggedInContactId() {
        return null;
    }
    global static SObject getPersonAccount(String contactId) {
        return null;
    }
    global static Id getRecordTypeId(String developerName, String sObjectType) {
        return null;
    }
    global static String getShortCurrencyFormatExpression(String siteName, String currencyCode) {
        return null;
    }
    global static Boolean hasPersonAccounts() {
        return null;
    }
    global static Boolean hasStateCountryPicklists() {
        return null;
    }
    global static Boolean isNullOrEmpty(String x) {
        return null;
    }
    global static Boolean isNullOrZero(Integer x) {
        return null;
    }
    global static Boolean isNullOrZero(Decimal x) {
        return null;
    }
    global static Boolean isSafeURL(String urlString) {
        return null;
    }
    global static Boolean isValidPaymentId(String pmtXId) {
        return null;
    }
    global static Boolean isValidSalesforceId(String idString) {
        return null;
    }
    global static String joinStringArray(List<String> stringArray, String connector) {
        return null;
    }
    global static String lastN(String strval, Integer n) {
        return null;
    }
    global static void sortByLabel(List<System.SelectOption> opts) {

    }
    global static List<System.SelectOption> stateProvinceNamePicklistOptions(pymt.Util.StateProvinceNamePicklistType listType, String countryIsoCode) {
        return null;
    }
    global static Boolean strListContains(List<String> strList, String key) {
        return null;
    }
    global static Boolean strListContains(List<String> strList, String key, Boolean ignoreCase) {
        return null;
    }
    global static Date toDateIfValid(String value) {
        return null;
    }
    global static Decimal toDecimalIfValid(String value) {
        return null;
    }
    global static Integer toIntegerIfValid(String value) {
        return null;
    }
    global static String toProperCase(String value) {
        return null;
    }
    global static String toStringWithNDecimalPlaces(Double val, Integer n, System.RoundingMode mode) {
        return null;
    }
    global static String toStringWithNDecimalPlaces(Decimal val, Integer n, System.RoundingMode mode) {
        return null;
    }
global enum CountryNamePicklistType {ISO_ISO, ISO_NAME, NAME_ISO, NAME_NAME}
global enum StateProvinceNamePicklistType {ISO_ISO, ISO_NAME, NAME_ISO, NAME_NAME}
}
