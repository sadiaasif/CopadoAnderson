<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Additional_Entities_Email</fullName>
        <description>Additional Entities Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>gcrawford@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nfrates@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Client_Statement_Emails/Additional_Entities</template>
    </alerts>
    <rules>
        <fullName>Additional entities</fullName>
        <actions>
            <name>Additional_Entities_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Client_Statement__c.Additional_Tax_Entities__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Client_Statement__c.Additional_Bookkeeping_Entities__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Sends email to GiGi when a statement is created with additional tax or bookkeeping entities listed by the client.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
