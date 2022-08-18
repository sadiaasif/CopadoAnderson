<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Timestamp_Escalation_Cleared_FU</fullName>
        <field>Escalation_Cleared_Time__c</field>
        <formula>NOW()</formula>
        <name>Timestamp Escalation Cleared</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Timestamp Escalation Cleared</fullName>
        <actions>
            <name>Timestamp_Escalation_Cleared_FU</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(
ISCHANGED( Escalation_Cleared__c )
,TRUE,FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
