<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Invitation_Status</fullName>
        <field>evt__Invitation_Status__c</field>
        <literalValue>Attended</literalValue>
        <name>Invitation Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registered_Timestamp</fullName>
        <field>Date_Registered__c</field>
        <formula>NOW()</formula>
        <name>Registered Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Invitation_Status</fullName>
        <field>evt__Invitation_Status__c</field>
        <literalValue>Confirmed</literalValue>
        <name>Update Invitation Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Attended</fullName>
        <actions>
            <name>Invitation_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>evt__Attendee__c.evt__Attended__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Check when status is Attended</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
