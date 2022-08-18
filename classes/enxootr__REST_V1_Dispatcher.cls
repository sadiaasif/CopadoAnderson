/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
@RestResource(urlMapping='/v1/*')
global class REST_V1_Dispatcher {
    global REST_V1_Dispatcher() {

    }
    @HttpDelete
    global static void doDELETE() {

    }
    @HttpGet
    global static void doGET() {

    }
    @HttpPatch
    global static void doPATCH() {

    }
    @HttpPost
    global static void doPOST() {

    }
    @HttpPut
    global static void doPUT() {

    }
global interface Dispatchable {
    void execute(Map<String,String> param0);
    String getURIMapping();
}
}
