/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class GrooveLeads implements Database.Batchable<SObject> {
    global GrooveLeads(String confirmationString) {

    }
    global GrooveLeads(Set<Id> leadIDs, Datetime sinceDateTime) {

    }
    global void execute(Database.BatchableContext bc, List<SObject> batchedLeads) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    @InvocableMethod(label='Match Lead to Account' description='Finds the matching account(s) to leads')
    global static void matchLeadToAccount(List<Id> leadIDs) {

    }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return null;
    }
}
