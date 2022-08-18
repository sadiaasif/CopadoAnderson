<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Tax Email 1</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Tax__c.Email_1_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Placeholder for email one</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Tax Email 2</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Tax__c.Email_2_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Placeholder for email one</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
