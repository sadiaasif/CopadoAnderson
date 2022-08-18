<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Deed_Follow_Ups_Client_has_not_returned_Deed_Final</fullName>
        <description>Deed - Follow Ups - Client has not returned Deed - Final</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Deeds/Deed_not_returned_Final_Follow_Up</template>
    </alerts>
    <alerts>
        <fullName>Deed_Follow_Ups_Client_has_not_returned_Deed_Initial</fullName>
        <description>Deed - Follow Ups - Client has not returned Deed - Initial</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Deeds/Deed_not_returned_Follow_Up</template>
    </alerts>
    <alerts>
        <fullName>Deed_Sent_to_County</fullName>
        <description>Deed - Sent to County</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Deeds/Deed_Sent_to_County</template>
    </alerts>
    <alerts>
        <fullName>Deed_Shipped_to_Client_SCH_0311</fullName>
        <description>Deed Shipped to Client - SCH-0311</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Land_Trust_Shipping_Confirmation</template>
    </alerts>
    <alerts>
        <fullName>Deed_Signed_Deed_Received</fullName>
        <description>Deed - Signed Deed Received</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Deeds/Signed_Deed_Received</template>
    </alerts>
    <alerts>
        <fullName>Documents_Complete_NPS_Email_Alert</fullName>
        <description>Documents Complete NPS Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Document_Complete_NPS</template>
    </alerts>
    <alerts>
        <fullName>Entities_Articles_Received_From_State</fullName>
        <description>Entities - Articles Received From State</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Articles_Received_From_State</template>
    </alerts>
    <alerts>
        <fullName>Entities_Articles_Sent</fullName>
        <description>Entities - Articles Sent</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Articles_Sent</template>
    </alerts>
    <alerts>
        <fullName>Entities_Articles_Sent_for_LLc</fullName>
        <description>Entities - Articles Sent for LLC</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Articles_Sent_LLC</template>
    </alerts>
    <alerts>
        <fullName>Entities_Automatic_Email_Remainder_to_client_to_Sign_Certificates</fullName>
        <description>Entities-Automatic Email Remainder to client to Sign Certificates</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Email_Remainder_to_client_to_Sign_Certificates</template>
    </alerts>
    <alerts>
        <fullName>Entities_Automatic_Email_to_clients_w_Binder_Review_Video_link</fullName>
        <description>Entities-Automatic Email to clients w/Binder Review Video link</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Automatic_Email_to_clients_w_Binder_Review_Video_link_Template</template>
    </alerts>
    <alerts>
        <fullName>Entities_Documents_Complete</fullName>
        <description>Entities - Documents Complete</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Documents_Complete</template>
    </alerts>
    <alerts>
        <fullName>Entities_EIN_Received_Corp_LLC_LP</fullName>
        <description>Entities - EIN Received - Corp, LLC, LP</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/EIN_Received_Corp_LLC_LP</template>
    </alerts>
    <alerts>
        <fullName>Entities_EIN_Received_Disregarded_LLC</fullName>
        <description>Entities - EIN Received - Disregarded LLC</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/EIN_Received_Disregarded_LLC</template>
    </alerts>
    <alerts>
        <fullName>Entities_EIN_Received_Pension_Plan_Non_Profit_Entity</fullName>
        <description>Entities - EIN Received - Pension Plan &amp; Non Profit Entity</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/EIN_Received_Pension_Plan_Non_Profit_Entity</template>
    </alerts>
    <alerts>
        <fullName>Entities_Form_2553_Drip_SCH_0323</fullName>
        <description>Entities - Form 2553 Drip - SCH-0323</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Form_2553_HTML_Version</template>
    </alerts>
    <alerts>
        <fullName>Entities_Form_8822B_Drip_SCH_0323</fullName>
        <description>Entities - Form 8822B Drip - SCH-0323</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Form_8822B_HTML_Version</template>
    </alerts>
    <alerts>
        <fullName>Entities_Form_8832_Drip</fullName>
        <description>Entities - Form 8832 Drip - SCH-0323</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Form_8832_HTML_Version</template>
    </alerts>
    <alerts>
        <fullName>Entities_Funding_Task_Email</fullName>
        <description>Entities -Funding Task Email</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>mfrank@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Funding_Task_Email</template>
    </alerts>
    <alerts>
        <fullName>Entities_Pension_Funding</fullName>
        <description>Entities -  Pension Funding</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>dtrentini@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Pension_Funding_Email</template>
    </alerts>
    <alerts>
        <fullName>Filing_Error_Alert</fullName>
        <description>Filing Error Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>jmorris@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nfrates@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Unfiled_Public/Filing_Error_Alert</template>
    </alerts>
    <alerts>
        <fullName>Land_Trust_Shipped_to_Client_SCH_0311</fullName>
        <description>Land Trust Shipped to Client - SCH-0311</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Land_Trust_Shipped_to_Client</template>
    </alerts>
    <alerts>
        <fullName>Renewal_Mailer_Email_Alert</fullName>
        <description>Renewal Mailer Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Pension_Emails/Renewal_Mailer</template>
    </alerts>
    <alerts>
        <fullName>Service_Department_NPS</fullName>
        <description>NPS Sent when documents complete field is 10 days ago</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>NPS_Surveys/Service_Department</template>
    </alerts>
    <alerts>
        <fullName>Tax_Organizer</fullName>
        <description>Tax Organizer</description>
        <protected>false</protected>
        <recipients>
            <field>Reminder_Email_10__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Entity_Emails/Tax_Organizer</template>
    </alerts>
    <fieldUpdates>
        <fullName>Business_Address</fullName>
        <field>Business_Address__c</field>
        <literalValue>Wyoming</literalValue>
        <name>Business Address</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Disable_Emails_to_True</fullName>
        <description>Sets Disable Email to True</description>
        <field>Disable_Emails__c</field>
        <literalValue>1</literalValue>
        <name>Disable Emails to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enter_Todays_Date</fullName>
        <field>Prepaid_SLA_Date__c</field>
        <formula>TODAY()</formula>
        <name>Enter Todays Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Living_Trust_In_Progress_Status</fullName>
        <field>Currently_Working_On__c</field>
        <literalValue>0</literalValue>
        <name>Living Trust In Progress Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mail_Services_Update</fullName>
        <field>Test_Mail_Services__c</field>
        <formula>AccountCHQ__c</formula>
        <name>Mail Services Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Org_State</fullName>
        <field>Organization_State__c</field>
        <literalValue>Wyoming</literalValue>
        <name>Org State</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RA_Checkbox_True</fullName>
        <description>Makes the RA Checkbox True.</description>
        <field>Registered_Agent__c</field>
        <literalValue>1</literalValue>
        <name>RA Checkbox True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RA_Checkbox_to_False</fullName>
        <field>Registered_Agent__c</field>
        <literalValue>0</literalValue>
        <name>RA Checkbox to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Send_Tax_Mailer_to_True</fullName>
        <field>Send_Tax_Mailer__c</field>
        <literalValue>1</literalValue>
        <name>Set Send Tax Mailer to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status</fullName>
        <field>Status__c</field>
        <literalValue>Active</literalValue>
        <name>Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tax_Form</fullName>
        <field>Tax_Form__c</field>
        <literalValue>1065</literalValue>
        <name>Tax Form</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tax_Organizer_Next_Date</fullName>
        <field>Tax_Organizer_Next_Send_Date__c</field>
        <formula>Today() + 366</formula>
        <name>Tax Organizer - Next Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tax_Period_Type</fullName>
        <field>Tax_Year_Ended__c</field>
        <literalValue>Calendar Year</literalValue>
        <name>Tax Period Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tax_Return_Required</fullName>
        <field>Tax_Return_Required__c</field>
        <literalValue>1</literalValue>
        <name>Tax Return Required</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tax_Status</fullName>
        <field>Tax_Status__c</field>
        <literalValue>Partnership</literalValue>
        <name>Tax Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Box_After_Merge</fullName>
        <field>Conga_Merge_Lease_Agreement__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Box After Merge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Box_After_Merge1</fullName>
        <field>Conga_Merge_Lease_Agreement__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Box After Merge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_AccName_Entity</fullName>
        <description>Update client name on Entity for Email Salutation</description>
        <field>AccName__c</field>
        <formula>Primary_Client__r.First_Name__c +&quot; &quot;+ Primary_Client__r.Last_Name__c</formula>
        <name>Update  AccName -Entity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Client_Email_Entity</fullName>
        <description>Update Client Email on Entity To send Email</description>
        <field>Reminder_Email_10__c</field>
        <formula>Primary_Client__r.E_Mail__c</formula>
        <name>Update Client Email -Entity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Entity_Nominee_Services</fullName>
        <field>Nominee_Services__c</field>
        <literalValue>Nominee</literalValue>
        <name>Update Entity Nominee Services</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Entity_Nominee_Services2</fullName>
        <field>Nominee_Services__c</field>
        <literalValue>Corp Nom</literalValue>
        <name>Update Entity Nominee Services2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Mailing_Services</fullName>
        <field>Mailing_Services__c</field>
        <literalValue>Corporate Headquarters</literalValue>
        <name>Update Mailing Services</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Org_Date</fullName>
        <field>Organizational_Date__c</field>
        <formula>today()</formula>
        <name>Update Org Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Plan_Adoption_Year</fullName>
        <field>Plan_Adoption_Year__c</field>
        <formula>YEAR(Plan_Adoption_Date__c)</formula>
        <name>Update Plan Adoption Year</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_RA</fullName>
        <field>Registered_Agent_Services__c</field>
        <literalValue>True</literalValue>
        <name>Update RA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X2553_Election</fullName>
        <field>Tax_Status__c</field>
        <literalValue>S - Corporation</literalValue>
        <name>2553 Election</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>X2553_Tax_Form_Update</fullName>
        <field>Tax_Form__c</field>
        <literalValue>1120S</literalValue>
        <name>2553 Tax Form Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Conga_Trigger_Lease_Agreement_Outbound</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Conga_Trigger_Lease_Agreement__c</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>Conga Trigger Lease Agreement Outbound</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>2553 Election</fullName>
        <actions>
            <name>X2553_Election</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>X2553_Tax_Form_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Entities__c.Date_Form_2553_Completed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Automatic Email to clients w%2FBinder Review Video link-Shipping Method Docusign-Final</fullName>
        <actions>
            <name>Update_AccName_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Client_Email_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Automatic Email to clients w/Binder Review Video link -Shipping Method -Docusign, Email Sent 1 day after the Date Shipped</description>
        <formula>AND(     NOT( ISBLANK( Date_Shipped__c )), ISPICKVAL( Shipping_Method__c , &apos;DocuSign&apos; )  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Entities_Automatic_Email_to_clients_w_Binder_Review_Video_link</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Entities__c.Date_Shipped__c</offsetFromField>
            <timeLength>31</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Automatic Email to clients w%2FBinder Review Video link-Shipping Method Docusign-live</fullName>
        <actions>
            <name>Update_AccName_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Client_Email_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Automatic Email to clients w/Binder Review Video link -Shipping Method -Docusign, Email Sent 1 day after the Date Shipped</description>
        <formula>AND(  
  NOT( ISBLANK( Date_Shipped__c )),
ISPICKVAL( Shipping_Method__c , &apos;DocuSign&apos; )

)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Entities_Automatic_Email_to_clients_w_Binder_Review_Video_link</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Entities__c.Date_Shipped__c</offsetFromField>
            <timeLength>103</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Automatic Email to clients w%2FBinder Review Video link-Shipping Method Not Docusign</fullName>
        <actions>
            <name>Update_AccName_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Client_Email_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Automatic Email to clients w/Binder Review Video link -Shipping Method Other than Docusign, Email Sent 4 day after the Date Shipped</description>
        <formula>AND( 
NOT( ISBLANK( Date_Shipped__c )), 
NOT(ISPICKVAL( Shipping_Method__c , &apos;DocuSign&apos; )) ,
 NOT(ISBLANK(AccName__c  ) ),
NOT(ISBLANK( Reminder_Email_10__c ) )

)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Entities_Automatic_Email_to_clients_w_Binder_Review_Video_link</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Entities__c.Date_Shipped__c</offsetFromField>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Automatic Email to clients w%2FBinder Review Video link-Shipping Method Not Docusign-Final</fullName>
        <actions>
            <name>Update_AccName_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Client_Email_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Automatic Email to clients w/Binder Review Video link -Shipping Method Other than Docusign, Email Sent 4 day after the Date Shipped</description>
        <formula>AND(  NOT( ISBLANK( Date_Shipped__c )),  NOT(ISPICKVAL( Shipping_Method__c , &apos;DocuSign&apos; ))   )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Entities_Automatic_Email_to_clients_w_Binder_Review_Video_link</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Entities__c.Date_Shipped__c</offsetFromField>
            <timeLength>103</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Automatic Email to clients w%2FBinder Review Video link-Shipping Method Not Docusign-live</fullName>
        <actions>
            <name>Update_AccName_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Client_Email_Entity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Automatic Email to clients w/Binder Review Video link -Shipping Method Other than Docusign, Email Sent 4 day after the Date Shipped</description>
        <formula>AND( 
NOT( ISBLANK( Date_Shipped__c )), 
NOT(ISPICKVAL( Shipping_Method__c , &apos;DocuSign&apos; )) 

)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Entities_Automatic_Email_to_clients_w_Binder_Review_Video_link</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Entities__c.Date_Shipped__c</offsetFromField>
            <timeLength>31</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Conga Trigger Lease Agreement</fullName>
        <actions>
            <name>Conga_Trigger_Lease_Agreement_Outbound</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Entities__c.Conga_Merge_Lease_Agreement__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Uncheck_Box_After_Merge1</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Conversion Renewal Task</fullName>
        <actions>
            <name>Conversion_Renewal_Task</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Entities__c.Inactive_Reason__c</field>
            <operation>equals</operation>
            <value>Converted</value>
        </criteriaItems>
        <description>When Converted is selected as the inactive reason.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Create task for Entity</fullName>
        <actions>
            <name>Limited_Liability_Company_LLC_Filing</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2 OR 3 OR 4</booleanFilter>
        <criteriaItems>
            <field>Entities__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Limited Liability Company (LLC)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Entities__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Joint Venture LLC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Entities__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>GAP Fund LLC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Entities__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>IRA LLC</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Disable Emails for Living Trusts</fullName>
        <actions>
            <name>Disable_Emails_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Entities__c.Disable_Emails__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Entities__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Living Trust</value>
        </criteriaItems>
        <description>Anytime a Living Trust is edited, mark &quot;Disable_Emails&quot; as True.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Entity RA Picklist to Checkbox %28False%29</fullName>
        <actions>
            <name>RA_Checkbox_to_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Transfers the Value of the Entity Registered Agent services Picklist to the RA checkbox.</description>
        <formula>ISPICKVAL(Registered_Agent_Services__c, &quot;False&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Entity RA Picklist to Checkbox %28True%29</fullName>
        <actions>
            <name>RA_Checkbox_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Transfers the Value of the Entity Registered Agent services Picklist to the RA checkbox.</description>
        <formula>ISPICKVAL(Registered_Agent_Services__c, &quot;True&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GAP Fund LLC - Create</fullName>
        <actions>
            <name>Business_Address</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Org_State</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Tax_Form</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Tax_Period_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Tax_Return_Required</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Tax_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Entities__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>GAP Fund LLC</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GAP Fund LLC - Org Date</fullName>
        <actions>
            <name>Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Org_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Entities__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>GAP Fund LLC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Entities__c.Organizational_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Entities__c.SOS_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Update Org Date when SOS # is not null.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Living Trust In Progress Status</fullName>
        <actions>
            <name>Living_Trust_In_Progress_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Entities__c.Documents_Complete__c</field>
            <operation>greaterOrEqual</operation>
            <value>7/23/2015</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Mailing Service Sync beta</fullName>
        <actions>
            <name>Mail_Services_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Syncs the mailing services field to the CHQ field on the account.</description>
        <formula>AccountCHQ__c &lt;&gt;  Test_Mail_Services__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Prepaid Date</fullName>
        <actions>
            <name>Enter_Todays_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Enters the date into the Prepaid SLA Date field when the SLA is selected</description>
        <formula>AND(
ISPICKVAL(SLA__c, &quot;Prepaid Admin&quot;),
ISCHANGED(SLA__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TaskCreateforLandTrust</fullName>
        <actions>
            <name>New_Task</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Entities__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Land Trust</value>
        </criteriaItems>
        <description>TaskCreateforLandTrust</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Tax Date - Make Sale</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Entities__c.Send_Tax_Mailer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Checks a box that makes the tax sale.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Entities__c.Tax_Mailer_Date__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Tax Organizer - Initial Scheduled</fullName>
        <actions>
            <name>Tax_Organizer_Next_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Entities__c.Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Entities__c.Disregarded_to_Entity_s_EIN__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>SCH-0025</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Tax Organizer - Next Scheduled</fullName>
        <actions>
            <name>Tax_Organizer</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Tax_Organizer_Next_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>SCH-0025</description>
        <formula>AND( TEXT(Status__c) = &quot;Active&quot;,
 Primary_Client__r.Id = &quot;0010B00001xFkWP&quot;
 )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Plan Adoption Date Field</fullName>
        <actions>
            <name>Update_Plan_Adoption_Year</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Entities__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Pension Plan</value>
        </criteriaItems>
        <description>Updates the Plan Adoption Date field so it can be used in Formulas</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Articles_Received</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Articles Received</subject>
    </tasks>
    <tasks>
        <fullName>Conversion_Renewal_Task</fullName>
        <assignedTo>boss@andersonadvisors.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A renewal sale needs to be updated to reflect an entity that is converting.</description>
        <dueDateOffset>15</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Conversion Renewal Task</subject>
    </tasks>
    <tasks>
        <fullName>Documents_Complete</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Documents Complete</subject>
    </tasks>
    <tasks>
        <fullName>Limited_Liability_Company_LLC_Filing</fullName>
        <assignedTo>boss@andersonadvisors.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>8</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Entities__c.DateCreated__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Limited Liability Company (LLC) Filing</subject>
    </tasks>
    <tasks>
        <fullName>New_Task</fullName>
        <assignedTo>boss@andersonadvisors.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>New Task create for Land Trust</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Entities__c.X5500_Due_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>New Task</subject>
    </tasks>
    <tasks>
        <fullName>Stock_Certificates_Ledgers_Followup</fullName>
        <assignedToType>owner</assignedToType>
        <description>Confirm that the client has signed and returned the Stock Certificates &amp; Ledgers to Mcleod Office.</description>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Entities__c.Date_Shipped__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Stock Certificates &amp; Ledgers Followup</subject>
    </tasks>
</Workflow>
