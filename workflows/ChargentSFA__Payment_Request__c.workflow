<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>ChargentSFA__Payment_Request</fullName>
        <description>Payment Request</description>
        <protected>false</protected>
        <recipients>
            <field>ChargentSFA__Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ChargentSFA__Chargent_Templates/ChargentSFA__Payment_Request_Email_Html</template>
    </alerts>
    <rules>
        <fullName>ChargentSFA__Payment Request Email</fullName>
        <actions>
            <name>ChargentSFA__Payment_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ChargentSFA__Payment_Request__c.ChargentSFA__Send_Payment_Request_Email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>ChargentSFA__Payment_Request__c.ChargentSFA__Status__c</field>
            <operation>notEqual</operation>
            <value>Paid</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
