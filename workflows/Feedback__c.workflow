<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>X9_NPS_Survey_Submitted</fullName>
        <description>&lt;9 NPS Survey Submitted</description>
        <protected>false</protected>
        <recipients>
            <recipient>kstephen@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>NPS_Surveys/X9_NPS_Submission</template>
    </alerts>
    <fieldUpdates>
        <fullName>Datetime_completed</fullName>
        <field>Date_Completed__c</field>
        <formula>NOW()</formula>
        <name>Datetime completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Comments</fullName>
        <field>Comments__c</field>
        <formula>TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + Update_Comments__c + BR() + Comments__c</formula>
        <name>Update Comments</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_first_contact</fullName>
        <field>First_Contact_Date__c</field>
        <formula>NOW()</formula>
        <name>update first contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Date Completed Timestamp</fullName>
        <actions>
            <name>Datetime_completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( Status__c), 
TEXT(Status__c) = &apos;Completed&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>First Contact</fullName>
        <actions>
            <name>update_first_contact</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( Status__c ),
 ISBLANK(First_Contact_Date__c),
TEXT(Status__c) = &apos;In Progress&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Comments - Feedback</fullName>
        <actions>
            <name>Update_Comments</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(

AND(ISNEW(), NOT(ISBLANK(Update_Comments__c))),

AND(ISCHANGED(Update_Comments__c), NOT(ISBLANK(Update_Comments__c)))

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
