<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>New_Num</fullName>
        <field>Infinity_Net_Worth_2__c</field>
        <formula>Infinity_Net_Worth_Number__c</formula>
        <name>New Num</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update</fullName>
        <field>Traditional_Net_Worth_2__c</field>
        <formula>Total_Calculated_Assets__c -  Total_Calculated_Liabilities__c</formula>
        <name>Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>New Infinity Net Worth Value</fullName>
        <actions>
            <name>New_Num</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Infinity_Calculator__c.OwnerId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
