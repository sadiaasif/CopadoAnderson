/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AssignLicenseInGroove {
    global AssignLicenseInGroove() {

    }
    @InvocableMethod(label='Assign Licenses in Groove' description='Assigns a Groove license to a list of users (by ID) and a License type (Core, Dialer, Flow)')
    global static void assignUsersGrooveLicense(List<DaScoopComposer.AssignLicenseInGroove.AssignLicensesParams> params) {

    }
global class AssignLicensesParams {
    @InvocableVariable( required=true)
    global String licenseType;
    @InvocableVariable( required=true)
    global Id userId;
    global AssignLicensesParams() {

    }
}
}
