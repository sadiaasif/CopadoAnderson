<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Create task when shipped</fullName>
        <active>false</active>
        <criteriaItems>
            <field>zkups__UPSShipment__c.zkups__ShipmentProcessingCompleted__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
