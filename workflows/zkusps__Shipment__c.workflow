<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>USPS Log Tracking Number</fullName>
        <active>false</active>
        <criteriaItems>
            <field>zkusps__Shipment__c.zkusps__trackingNumber__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
