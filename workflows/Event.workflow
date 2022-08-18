<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_reminder_1_hour_before</fullName>
        <description>Email reminder 1 hour before</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Unfiled_Public/X1_day_appointment_Reminder</template>
    </alerts>
    <alerts>
        <fullName>New_Event</fullName>
        <description>New Event</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/New_Event</template>
    </alerts>
    <alerts>
        <fullName>X1_Day_Before_appointment_email</fullName>
        <description>1 Day Before appointment email</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Unfiled_Public/X1_day_appointment_Reminder</template>
    </alerts>
    <fieldUpdates>
        <fullName>Set_Summary_to_Short_Description</fullName>
        <field>Summary__c</field>
        <formula>LEFT(Description,252)&amp;&apos;…&apos;</formula>
        <name>Set Summary to Short Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Email Reminder Appointment</fullName>
        <actions>
            <name>X1_Day_Before_appointment_email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Event.IsReminderSet</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Reminder email for appointments in Events</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Event.ReminderDateTime</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Email Reminder Appointment 1 hour before</fullName>
        <actions>
            <name>Email_reminder_1_hour_before</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Event.IsReminderSet</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Reminder email for appointments in Events</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Event.ReminderDateTime</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>New Event</fullName>
        <actions>
            <name>New_Event</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>IF(ISBLANK(WhatId), FALSE, TRUE)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Summary for Tasks</fullName>
        <actions>
            <name>Set_Summary_to_Short_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event.Subject</field>
            <operation>notContain</operation>
            <value>Email: &gt;&gt;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Event.Subject</field>
            <operation>notContain</operation>
            <value>Email: &lt;&lt;</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
