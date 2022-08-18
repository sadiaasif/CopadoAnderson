<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Put Logo in ImageURL</fullName>
        <active>false</active>
        <criteriaItems>
            <field>User.Image_URL__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Adds Anderson logo to Image URL if it&apos;s blank.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
