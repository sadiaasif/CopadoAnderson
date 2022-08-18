<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Staff_Name_Convention</fullName>
        <field>Name</field>
        <formula>First_Name__c &amp; &quot; &quot; &amp; Last_Name__c</formula>
        <name>Staff Name Convention</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Same Convention</fullName>
        <actions>
            <name>Staff_Name_Convention</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Sales_Rep__c.OwnerId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates the sales rep name to match user&apos;s first &amp; last name.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
