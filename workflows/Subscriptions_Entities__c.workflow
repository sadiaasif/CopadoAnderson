<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>updaterenwaldate</fullName>
        <field>State_Renewal__c</field>
        <formula>Subscription__r.End_Date__c</formula>
        <name>updaterenwaldate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>Entity__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Update Renewal</fullName>
        <actions>
            <name>updaterenwaldate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Subscription__c.End_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
