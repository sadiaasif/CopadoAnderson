<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Net Worth Record Created</fullName>
        <actions>
            <name>New_Net_Worth_Worksheet</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Net_Worth__c.Primary_First_Name__c</field>
            <operation>notEqual</operation>
            <value>1</value>
        </criteriaItems>
        <description>When a net worth worksheet is added</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>New_Net_Worth_Worksheet</fullName>
        <assignedTo>dgass@andersonadvisors.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Net_Worth__c.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Net Worth Worksheet</subject>
    </tasks>
</Workflow>
