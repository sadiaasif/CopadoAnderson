<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Date_Today</fullName>
        <field>Date_Created__c</field>
        <formula>TEXT(TODAY())</formula>
        <name>Date Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>New_Status</fullName>
        <field>Status__c</field>
        <literalValue>New</literalValue>
        <name>New Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_fee</fullName>
        <field>Filing_Fee__c</field>
        <formula>TEXT(193)</formula>
        <name>Update fee</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>New Online Q</fullName>
        <actions>
            <name>Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>New_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Sets the Status of a New Online Q to &quot;New&quot;</description>
        <formula>NOT(ISBLANK( Client_Account_Number__c ) )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
