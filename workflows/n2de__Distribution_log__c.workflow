<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>n2de__Distribution_Engine_Email_Notification</fullName>
        <description>Distribution Engine - Email Notification</description>
        <protected>false</protected>
        <recipients>
            <field>n2de__Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>n2de__Distribution_Engine_Templates/n2de__Distribution_Engine_Notification</template>
    </alerts>
    <alerts>
        <fullName>n2de__Distribution_Engine_Email_Notification_v2</fullName>
        <description>Distribution Engine - Email Notification v2</description>
        <protected>false</protected>
        <recipients>
            <field>n2de__Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>n2de__Distribution_Engine_Templates/n2de__Distribution_Engine_Notification_v2</template>
    </alerts>
    <rules>
        <fullName>n2de__Distribution Engine Notification</fullName>
        <actions>
            <name>n2de__Distribution_Engine_Email_Notification_v2</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Email notifications to reps / agents for assignment, alerting and re-assignment by Distribution Engine</description>
        <formula>((ISNEW() &amp;&amp; n2de__In_error__c != true) || (ISCHANGED(n2de__In_alert__c) &amp;&amp; n2de__In_alert__c = true) || (ISCHANGED(n2de__Is_reassigned_to_queue__c) &amp;&amp; n2de__Is_reassigned_to_queue__c == true)) &amp;&amp; n2de__Email_notifications_disabled__c != true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
