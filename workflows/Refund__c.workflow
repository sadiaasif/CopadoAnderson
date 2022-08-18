<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Completed_Research</fullName>
        <description>Completed Research</description>
        <protected>false</protected>
        <recipients>
            <field>Created_By_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Refund_Templates/Completed_Research</template>
    </alerts>
    <alerts>
        <fullName>Follow_up_on_Refund</fullName>
        <description>Follow up on Refund</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Follow_up_on_Refund</template>
    </alerts>
    <alerts>
        <fullName>Refund_Completed_Email_to_Client</fullName>
        <description>Refund Completed Email to Client</description>
        <protected>false</protected>
        <recipients>
            <field>Client_s_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Refund_Templates/Refund_Template_3</template>
    </alerts>
    <alerts>
        <fullName>Refund_Notification_Email</fullName>
        <description>Sends a notification to the owner of a refund when it is created or assigned to them.</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Refund_Templates/Refund_Created_and_Status_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Timestamp_Bill_Date</fullName>
        <field>Last_Date_Assigned_to_Bill__c</field>
        <formula>NOW()</formula>
        <name>Timestamp Bill Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Last Date Assigned to Bill</fullName>
        <actions>
            <name>Timestamp_Bill_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISCHANGED(OwnerId), OwnerId = &apos;005U0000006TfyNIAS&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
