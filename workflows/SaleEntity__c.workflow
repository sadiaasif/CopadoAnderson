<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Re_evaluate_Records</fullName>
        <description>Re-evaluates sales entity records after the contract end date passed</description>
        <field>Opportunity_Updated__c</field>
        <literalValue>1</literalValue>
        <name>Re-evaluate Records</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Re-evaluate Records</fullName>
        <active>true</active>
        <criteriaItems>
            <field>SaleEntity__c.Contract_End_Date__c</field>
            <operation>lessOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Update the opportunity updated field in order to re-evaluate the sales entity record</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Re_evaluate_Records</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>SaleEntity__c.Contract_End_Date__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Unlimited LLC Fulfillment</fullName>
        <active>false</active>
        <criteriaItems>
            <field>SaleEntity__c.Unlimited_LLC__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
