<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>X1099_Request_Email_to_Blanca</fullName>
        <ccEmails>blemus@andersonadvisors.com, kdunphy@andersonadvisors.com, srajagopalan@andersonadvisors.com</ccEmails>
        <description>1099 Request-Email to Blanca</description>
        <protected>false</protected>
        <recipients>
            <recipient>boss@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Bookkeeping/X1099_Request_Alert_to_blanca</template>
    </alerts>
    <alerts>
        <fullName>X1099_Request_Task_Notification</fullName>
        <description>1099 Request Task Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Email_1099_Request_Owner</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_comments_on_1099</fullName>
        <field>Comments__c</field>
        <formula>TEXT(Today()) + &apos; - &apos; +LEFT( $User.FirstName , 1)+&apos;.&apos;+ $User.LastName + &apos; - &apos; + Update_Comments__c + BR() + Comments__c</formula>
        <name>Update comments on 1099</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Update comments on 1099</fullName>
        <actions>
            <name>Update_comments_on_1099</name>
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
