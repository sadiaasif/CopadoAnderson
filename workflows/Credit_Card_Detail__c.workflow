<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_value_zero_to_mail_check</fullName>
        <field>Mail_Check__c</field>
        <formula>0</formula>
        <name>Set value zero to mail check</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Set null to mail check value</fullName>
        <actions>
            <name>Set_value_zero_to_mail_check</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Credit_Card_Detail__c.Mail_Check__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update CC Notes</fullName>
        <active>false</active>
        <description>Updates the CC Notes with whatever is entered into the CC Name</description>
        <formula>Name   &lt;&gt;  Credit_Card_Notes__c</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
