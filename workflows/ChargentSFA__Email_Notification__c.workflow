<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>ChargentSFA__Account_Updater_Notification</fullName>
        <description>Account Updater Notification</description>
        <protected>false</protected>
        <recipients>
            <field>ChargentSFA__Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ChargentSFA__Chargent_Templates/ChargentSFA__Account_Updater_Feature_Html</template>
    </alerts>
    <alerts>
        <fullName>ChargentSFA__Account_Updater_Notification_Email</fullName>
        <description>Account Updater Notification</description>
        <protected>false</protected>
        <recipients>
            <field>ChargentSFA__Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ChargentSFA__Chargent_Templates/ChargentSFA__Account_Updater_Feature_Html</template>
    </alerts>
    <alerts>
        <fullName>ChargentSFA__Transaction_Error_Notification_Email</fullName>
        <description>Transaction Error Notification</description>
        <protected>false</protected>
        <recipients>
            <field>ChargentSFA__Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ChargentSFA__Chargent_Templates/ChargentSFA__SObject_Error_Email</template>
    </alerts>
    <rules>
        <fullName>ChargentSFA__Send Account Update Email</fullName>
        <actions>
            <name>ChargentSFA__Account_Updater_Notification_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ChargentSFA__Email_Notification__c.ChargentSFA__Account_Updater_Link__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>ChargentSFA__Send Sobject Error Email</fullName>
        <actions>
            <name>ChargentSFA__Transaction_Error_Notification_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ChargentSFA__Email_Notification__c.ChargentSFA__Email__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <criteriaItems>
            <field>ChargentSFA__Email_Notification__c.ChargentSFA__Status__c</field>
            <operation>contains</operation>
            <value>Error,Unresolved Transaction</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
