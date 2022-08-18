<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Anderson_Advisors_Follow_Up_on_Your_Living_Trust</fullName>
        <description>Anderson Advisors -- Follow Up on Your Living Trust</description>
        <protected>false</protected>
        <recipients>
            <field>Advisor_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All/Anderson_Advisors_Follow_Up_on_Your_Living_Trust</template>
    </alerts>
    <alerts>
        <fullName>Box1040IsChecked</fullName>
        <description>Alert for when the 1040 box is checked.</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Opportunities_Emails/X1040_2018</template>
    </alerts>
    <alerts>
        <fullName>Box_Mail_Upload_Email_Primary</fullName>
        <description>Box Mail Upload - Email Primary</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/Mail_Uploaded_to_Box</template>
    </alerts>
    <alerts>
        <fullName>Client_never_logged_into_Platinum_need_to_call</fullName>
        <ccEmails>eterrell@andersonadvisors.com</ccEmails>
        <description>Client never logged into Platinum, need to call.</description>
        <protected>false</protected>
        <recipients>
            <recipient>boss@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Unfiled_Public/Past_21_days_Platinum_login</template>
    </alerts>
    <fieldUpdates>
        <fullName>Contact_DJ</fullName>
        <field>Magentrix_User_Role__c</field>
        <literalValue>Dani Johnson</literalValue>
        <name>Contact - DJ</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_DJPlat</fullName>
        <field>Platinum_Type__c</field>
        <literalValue>Dani Johnson</literalValue>
        <name>Contact - DJ Platinum</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Dani_Johnson</fullName>
        <field>Magentrix_User_Role__c</field>
        <literalValue>Dani Johnson</literalValue>
        <name>Dani Johnson</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enable_Magentrix_User</fullName>
        <field>Magentrix_User__c</field>
        <literalValue>1</literalValue>
        <name>Enable Magentrix User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Magentrix_User_Role_Client</fullName>
        <description>Change Magentrix user role to client.</description>
        <field>Magentrix_User_Role__c</field>
        <literalValue>Client</literalValue>
        <name>Magentrix User Role - Client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Magentrix_User_Role_No_Platinum</fullName>
        <field>Magentrix_User_Role__c</field>
        <literalValue>Client</literalValue>
        <name>Magentrix User Role - No Platinum</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Magentrix_User_Role_Platinum</fullName>
        <field>Magentrix_User_Role__c</field>
        <literalValue>Platinum Client</literalValue>
        <name>Magentrix User Role - Platinum</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NVREA_AP_Event_Yes_Contact</fullName>
        <field>Client_Signed_Up_for_AP_Event__c</field>
        <literalValue>Yes</literalValue>
        <name>NVREA AP Event - Yes (Contact)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OCS</fullName>
        <field>Original_Campaign_Source__c</field>
        <formula>Account.Original_Campaign_Source__r.Name</formula>
        <name>OCS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Associated_Emails</fullName>
        <field>Associated_Emails__c</field>
        <formula>Associated_Emails__c &amp; &apos;;&apos; &amp; Email</formula>
        <name>Update Associated Emails</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Associated_Emails_2</fullName>
        <field>Associated_Emails__c</field>
        <formula>Associated_Emails__c &amp; &apos;;&apos; &amp;  DaScoopComposer__Email_2__c</formula>
        <name>Update Associated Emails (2)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Contact_Description</fullName>
        <field>Description</field>
        <formula>Description_Mirror__c + BR() + BR() + Description</formula>
        <name>Update Contact Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Email</fullName>
        <field>Email</field>
        <formula>Account.E_Mail__c</formula>
        <name>Update Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Platinum</fullName>
        <field>Magentrix_User_Role__c</field>
        <literalValue>Platinum Client</literalValue>
        <name>Update Platinum</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Platinum_Enrollment_Date</fullName>
        <field>Platinum_Date__c</field>
        <formula>today()</formula>
        <name>Update Platinum Enrollment Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_URL</fullName>
        <field>Strategy_URL__c</field>
        <formula>Account.Strategy_URL__c</formula>
        <name>Update URL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_parent_client_source</fullName>
        <field>Campaign__c</field>
        <formula>Account.Campaign__c</formula>
        <name>Update parent client source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_to_Platinum_Client</fullName>
        <field>Magentrix_User_Role__c</field>
        <literalValue>Platinum Client</literalValue>
        <name>Update to Platinum Client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_to_Yes</fullName>
        <field>Mailing_Allowed__c</field>
        <literalValue>Yes</literalValue>
        <name>Update to Yes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Workflow_Checkbox</fullName>
        <field>Workflow__c</field>
        <literalValue>1</literalValue>
        <name>Workflow Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>emailfromclient</fullName>
        <field>Email</field>
        <formula>Account.E_Mail__c</formula>
        <name>emailfromclient</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>DaScoopComposer__Notify_Groove</fullName>
        <apiVersion>40.0</apiVersion>
        <description>Sends an outbound message to Groove with the record ID and owner ID. This is used for real-time auto-import to Groove Flow.</description>
        <endpointUrl>https://app.grooveapp.com/salesforce/updates</endpointUrl>
        <fields>Id</fields>
        <fields>OwnerId</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>033e0000000dll6iag@00d8j0000008ajluai</integrationUser>
        <name>Notify Groove (Managed)</name>
        <protected>true</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Append Email 2</fullName>
        <actions>
            <name>Update_Associated_Emails_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Append Email 2 to Associated Email</description>
        <formula>AND(ISCHANGED(DaScoopComposer__Email_2__c),
 NOT(CONTAINS(DaScoopComposer__Email_2__c, Associated_Emails__c)),
NOT(ISBLANK(DaScoopComposer__Email_2__c))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Append Emails</fullName>
        <actions>
            <name>Update_Associated_Emails</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Append Emails to Associated Email</description>
        <formula>AND(ISCHANGED(Email),
 NOT(CONTAINS(Email, Associated_Emails__c)),
NOT(ISBLANK(Email))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>DaScoopComposer__Notify Groove on Contact Created %28Managed%29</fullName>
        <actions>
            <name>DaScoopComposer__Notify_Groove</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <description>This WF rule can be activated if you want to notify Groove that a new contact was created. That way Groove can e.g. instantly import the contact to a Groove Flow that has auto import enabled (and meets the auto-import rules of that Flow).</description>
        <formula>ISNEW()</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Description Mirror</fullName>
        <actions>
            <name>Update_Contact_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Description_Mirror__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Enable Magentrix User</fullName>
        <actions>
            <name>Enable_Magentrix_User</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Magentrix_User_Role__c</field>
            <operation>equals</operation>
            <value>Platinum Client,Dani Johnson,Tax Team</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Magentrix_User__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>If Email is blank%2C put in account email</fullName>
        <actions>
            <name>Update_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Self Explanatory from rule name.</description>
        <formula>ISBLANK( Email )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>NVREA AP Event%2FMailing Allowed - Yes %28Contact%29</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Client_Signed_Up_for_AP_Event__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Mailing_Allowed__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <description>Sets the picklist to &quot;Yes&quot; after 3 months.</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>NVREA_AP_Event_Yes_Contact</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Update_to_Yes</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>91</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>No logins to Platinum</fullName>
        <actions>
            <name>Client_never_logged_into_Platinum_need_to_call</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>IF(
AND(Platinum_Date__c+21&lt;=today(), Successful_Logins__c =0, 
NOT(ISPICKVAL(Magentrix_User_Role__c, &quot;Client&quot;)), NOT(ISPICKVAL(Magentrix_User_Role__c, &quot;&quot;))),
TRUE,
FALSE)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Platinum Enrollment Date</fullName>
        <actions>
            <name>Update_Platinum_Enrollment_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Magentrix_User__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Platinum_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Workflow_Checkbox</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>21</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Strategy URL%2FOriginal Campaign Source</fullName>
        <actions>
            <name>Update_URL</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.AccountName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates the listed field with data from the account when the contact is edited.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Parent Client Source</fullName>
        <actions>
            <name>Update_parent_client_source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If the parent client source is blank, pull it from the account.</description>
        <formula>ISBLANK( Campaign__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Platinum</fullName>
        <actions>
            <name>Update_Platinum</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Platinum_Type__c</field>
            <operation>equals</operation>
            <value>Platinum,Platinum Elite,Lifetime Platinum</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>if no email get from client</fullName>
        <actions>
            <name>emailfromclient</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
