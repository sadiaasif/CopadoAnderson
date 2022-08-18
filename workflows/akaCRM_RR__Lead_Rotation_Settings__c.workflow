<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Lead Rotation Assign</fullName>
        <active>false</active>
        <booleanFilter>1 OR 2 OR 3 OR 4</booleanFilter>
        <criteriaItems>
            <field>akaCRM_RR__Lead_Rotation_Settings__c.OwnerId</field>
            <operation>contains</operation>
            <value>Rick</value>
        </criteriaItems>
        <criteriaItems>
            <field>akaCRM_RR__Lead_Rotation_Settings__c.OwnerId</field>
            <operation>contains</operation>
            <value>Jesus</value>
        </criteriaItems>
        <criteriaItems>
            <field>akaCRM_RR__Lead_Rotation_Settings__c.OwnerId</field>
            <operation>contains</operation>
            <value>Justin</value>
        </criteriaItems>
        <criteriaItems>
            <field>akaCRM_RR__Lead_Rotation_Settings__c.OwnerId</field>
            <operation>contains</operation>
            <value>Smith</value>
        </criteriaItems>
        <description>Assign task to lead rotation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
