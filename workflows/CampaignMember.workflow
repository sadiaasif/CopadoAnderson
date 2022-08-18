<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Emails_Contact_30_days_before_card_expiration</fullName>
        <description>Emails Contact 30 days before card expiration</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Platinum_Emails/Update_Credit_Card_30</template>
    </alerts>
    <alerts>
        <fullName>Emails_Contact_60_days_before_card_expiration</fullName>
        <description>Emails Contact 60 days before card expiration</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Platinum_Emails/Update_Credit_Card_60</template>
    </alerts>
    <alerts>
        <fullName>Emails_Contact_7_days_before_card_expiration</fullName>
        <description>Emails Contact 7 days before card expiration</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Platinum_Emails/Update_Credit_Card_7</template>
    </alerts>
    <fieldUpdates>
        <fullName>Text_of_isPrimary</fullName>
        <description>Takes value of boolean field and puts it into text for the rollup summary field.</description>
        <field>Primary__c</field>
        <formula>IF(
Is_Primary__c = TRUE,
&quot;True&quot;,
&quot;False&quot;)</formula>
        <name>Text of isPrimary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Copy IsPrimary Value</fullName>
        <actions>
            <name>Text_of_isPrimary</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CampaignMember.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Copies the Is Primary value from the formula field to the checkbox field.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
