<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>BCP_NPS_Survey</fullName>
        <description>BCP NPS Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Business_Continuity_NPS</template>
    </alerts>
    <alerts>
        <fullName>Case</fullName>
        <description>Case Owner changed email to group leader</description>
        <protected>false</protected>
        <recipients>
            <recipient>Case_Support_Group_Leader</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Communities_Emails/Case_Owner_Changed_Email_template_for_group_leader</template>
    </alerts>
    <alerts>
        <fullName>Case_Owner_changed_email_to_record_creator</fullName>
        <description>Case Owner changed email to record creator</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Communities_Emails/Case_Owner_Changed_Email_template_for_record_creator</template>
    </alerts>
    <alerts>
        <fullName>Case_Status_Changed</fullName>
        <description>Case Status Changed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Communities_Emails/Case_status_changed</template>
    </alerts>
    <alerts>
        <fullName>Case_Status_changed_email_to_group_leader</fullName>
        <description>Case Status changed email to group leader</description>
        <protected>false</protected>
        <recipients>
            <recipient>Case_Support_Group_Leader</recipient>
            <type>roleSubordinatesInternal</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Communities_Emails/Case_Status_Changed_Email_template_for_group_leader</template>
    </alerts>
    <alerts>
        <fullName>Case_Status_changed_email_to_record_creator</fullName>
        <description>Case Status changed email to record creator</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Communities_Emails/Case_Status_Changed_Email_template_for_record_creator</template>
    </alerts>
    <alerts>
        <fullName>Client_Email_Bookkeeping_Case_Closed</fullName>
        <description>Client Email - Bookkeeping Case Closed</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/BK_Case_Closed_Client_Email</template>
    </alerts>
    <alerts>
        <fullName>Critical_Help_Desk_Case</fullName>
        <ccEmails>salesforceteam@andersonadvisors.com</ccEmails>
        <description>Critical Help Desk Case</description>
        <protected>false</protected>
        <recipients>
            <recipient>nfrates@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/Critical_Help_Desk_Case</template>
    </alerts>
    <alerts>
        <fullName>Email_Estate_Planning</fullName>
        <ccEmails>estateplanning@andersonadvisors.com</ccEmails>
        <description>Email Estate Planning</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Unfiled_Public/SUPPORTNewassignmentnotificationSAMPLE</template>
    </alerts>
    <alerts>
        <fullName>Email_to_group_leader</fullName>
        <description>Email to group leader</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Communities_Emails/Email_to_group_leader</template>
    </alerts>
    <alerts>
        <fullName>Help_Desk_Case_Put_On_Hold</fullName>
        <description>Help Desk Case Put On Hold</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All/Help_Desk_Case_Put_On_Hold_1</template>
    </alerts>
    <alerts>
        <fullName>Help_Desk_Case_Put_On_Hold_Closed</fullName>
        <description>Help Desk Case Put On Hold Closed</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All/Help_Desk_Case_On_Hold_Closed</template>
    </alerts>
    <alerts>
        <fullName>Help_Desk_Case_Put_On_Hold_Reminder</fullName>
        <description>Help Desk Case Put On Hold Reminder</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All/Help_Desk_Case_On_Hold_Reminder_1</template>
    </alerts>
    <alerts>
        <fullName>Help_Desk_Confirmation</fullName>
        <description>Help Desk Confirmation</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All/Help_Desk_Confirmation</template>
    </alerts>
    <alerts>
        <fullName>Living_Trust_NPS_Survey</fullName>
        <description>Living Trust NPS Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>NPS_Surveys/Estate_Planning</template>
    </alerts>
    <alerts>
        <fullName>NPS_Case_Testing</fullName>
        <description>For NPS scores</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/NPS_New</template>
    </alerts>
    <alerts>
        <fullName>NPS_Welcome_Call_Complete</fullName>
        <description>NPS - Welcome Call Complete</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>NPS_Surveys/Welcome_Call_Completed</template>
    </alerts>
    <alerts>
        <fullName>New_Case_Assigned_to_Web_Team</fullName>
        <ccEmails>cowens@andersonadvisors.com</ccEmails>
        <ccEmails>gmcneill@andersonadvisors.com</ccEmails>
        <description>New Case Assigned to Web Team</description>
        <protected>false</protected>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All/New_Case_Assigned_to_Web_Team</template>
    </alerts>
    <alerts>
        <fullName>New_Comment</fullName>
        <description>New Comment</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Communities_Emails/Case_Comment</template>
    </alerts>
    <alerts>
        <fullName>New_Help_Desk_Case</fullName>
        <description>New Help Desk Case</description>
        <protected>false</protected>
        <recipients>
            <recipient>eteam@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/New_Case_Notification</template>
    </alerts>
    <alerts>
        <fullName>Notify_Sami_of_Case</fullName>
        <ccEmails>swallace@andersonadvisors.com</ccEmails>
        <description>Notify Sami of Case</description>
        <protected>false</protected>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/New_Case_Standard</template>
    </alerts>
    <alerts>
        <fullName>Platinum_Case_Assignment_Email</fullName>
        <description>Platinum Case Assignment Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Communities_Emails/Case_Assigned</template>
    </alerts>
    <alerts>
        <fullName>Platinum_Question_Answered</fullName>
        <description>Platinum Question Answered</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Communities_Emails/Case_Comment_added</template>
    </alerts>
    <alerts>
        <fullName>Platinum_Question_NPS_Email_Alert</fullName>
        <description>Platinum Question NPS Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>NPS_Surveys/Platinum_Question2</template>
    </alerts>
    <alerts>
        <fullName>SCH_0004</fullName>
        <description>SCH-0004 - Help Desk Closed Email to Creator</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>All/Help_Desk_Case_Closed</template>
    </alerts>
    <alerts>
        <fullName>Simple_Survey_NPS_Score</fullName>
        <description>Simple Survey NPS Score</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/simplesurvey__Simple_Survey_Account_and_Contact_0_10_Scale</template>
    </alerts>
    <alerts>
        <fullName>Tax_Case_NPS_Survey</fullName>
        <description>Tax Case NPS Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Client_E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>NPS_Surveys/Tax_Task</template>
    </alerts>
    <fieldUpdates>
        <fullName>Assigned_Case_to_Queue</fullName>
        <description>Shobi-Updated Toni covey -Nick - To deactivate Toni&apos;s user account</description>
        <field>OwnerId</field>
        <lookupValue>nfrates@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assigned Case to Queue</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Bundle_Applied</fullName>
        <field>Bundle_Applied__c</field>
        <literalValue>1</literalValue>
        <name>Bundle Applied</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Description</fullName>
        <field>Description</field>
        <formula>&apos;Living Trust&apos;</formula>
        <name>Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Description_Update</fullName>
        <field>Description</field>
        <formula>Description_Mirror__c  + BR() + BR() + Description</formula>
        <name>Description Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FR_Timestamp</fullName>
        <field>Flat_Rate_Hours_Last_Updated__c</field>
        <formula>NOW()</formula>
        <name>FR Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Help_Desk_Closed_By</fullName>
        <field>Closed_By__c</field>
        <formula>$User.FirstName + &quot; &quot; + $User.LastName</formula>
        <name>Help Desk Closed By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LTCase_Type</fullName>
        <field>Type</field>
        <literalValue>Living Trust</literalValue>
        <name>LT Case Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lee_Arnold_Case_Description</fullName>
        <field>Description</field>
        <formula>&apos;Lee Arnold -- Free Corp Package Purchased (1)&apos;</formula>
        <name>Lee Arnold Case Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lee_Arnold_Case_Subject</fullName>
        <description>&apos;Fulfillment on Agreement&apos;</description>
        <field>Subject</field>
        <formula>&apos;Fulfillment on Agreement&apos;</formula>
        <name>Lee Arnold Case Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Naming_Convention</fullName>
        <field>Subject</field>
        <formula>&apos;Fulfillment on Living Trust&apos;</formula>
        <name>Naming Convention</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pat_James_Cases_Description</fullName>
        <description>Pat James Free Corp Package Purchased (1)</description>
        <field>Description</field>
        <formula>&apos;Pat James -- Free Corp Package Purchased (1)&apos;</formula>
        <name>Pat James Cases Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pat_James_Cases_Subject</fullName>
        <description>&apos;Fulfillment on Agreement&apos;</description>
        <field>Subject</field>
        <formula>&apos;Fulfillment on Agreement&apos;</formula>
        <name>Pat James Cases Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Replace_Text</fullName>
        <field>Description</field>
        <formula>IF(CONTAINS(Description,&quot;(1) Invest For the Future 2020&quot;), SUBSTITUTE(Description, &quot;(1) Invest For the Future 2020&quot;,
&quot;Invest For the Future 2020 Package:&quot; + BR() +
&quot;(1) LLC Formation&quot; + BR() +
&quot;(1) Corporate Assistance Program, 1 Year, Initial&quot; + BR() +
&quot;(1) Platinum Membership&quot; + BR() +
&quot;(1) Registered Agent Fee&quot; + BR() +
&quot;(1) Wealth Planning Blueprint (WPB) / Keep More Solutions (KMS)&quot; + BR() +
&quot;(1) Livestream Access to All Events for the rest of 2020 online&quot; + BR() +
&quot;(4) Free Tickets to the Next Live Tax &amp; AP Event&quot;),&quot;&quot;)</formula>
        <name>Replace Text</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Survey_Email_Update</fullName>
        <field>Client_E_Mail__c</field>
        <formula>Account.E_Mail__c</formula>
        <name>Survey Email Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Turns_Comment_Box_off</fullName>
        <description>Self explanatory from name.</description>
        <field>Case_Comment_Box__c</field>
        <literalValue>0</literalValue>
        <name>Turns Comment Box off</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Case_Owner_to_AA</fullName>
        <field>OwnerId</field>
        <lookupValue>boss@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update Case Owner to AA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Entity_Formation</fullName>
        <field>Date_to_Service__c</field>
        <formula>NOW()</formula>
        <name>Update Entity Formation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_case</fullName>
        <field>Edit_Box__c</field>
        <literalValue>1</literalValue>
        <name>Update case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Vertucci_Case_Description</fullName>
        <field>Description</field>
        <formula>&apos;Nick Vertucci Package Purchased (1)&apos;</formula>
        <name>Vertucci Case Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Vertucci_Case_Subject</fullName>
        <field>Subject</field>
        <formula>&apos;Fulfillment on Agreement&apos;</formula>
        <name>Vertucci Case Subject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Alert Grady%2FCaleb to Help Desk Case</fullName>
        <actions>
            <name>New_Case_Assigned_to_Web_Team</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Help Desk</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Web Team</value>
        </criteriaItems>
        <description>Sends an email notification to Grady and Caleb when a Help Desk case is assigned to the Web Team</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Alert Sami to Help Desk Case</fullName>
        <actions>
            <name>Notify_Sami_of_Case</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Help Desk</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Anderson Advisors</value>
        </criteriaItems>
        <description>Sends an email notification to Sami when a Help Desk case is assigned to her.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Anderson System Case</fullName>
        <actions>
            <name>Welcome_Call</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Anderson System Case</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Case Survey%3A Update Client E-mail</fullName>
        <actions>
            <name>Survey_Email_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the Client email on a case to match the primary email on the account for NPS Surveys</description>
        <formula>AND(
OR(
/* Entity Formation */
RecordType.Id = &quot;012U0000000g6UT&quot;,

/* Tax */
RecordType.Id = &quot;012U0000000g6UO&quot;,

/* Anderson System Case */
RecordType.Id = &quot;012U0000000g6UJ&quot;, 

/* Community Platinum Case */
RecordType.Id = &quot;0120B000000N93u&quot;,

/* Living Trust */
RecordType.Id = &quot;012U0000000g7PJ&quot;),
OR(
ISBLANK(Client_E_Mail__c),
Client_E_Mail__c &lt;&gt; Account.E_Mail__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Community Case Assigned</fullName>
        <actions>
            <name>Platinum_Case_Assignment_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED( OwnerId ),
RecordTypeId = &quot;0120B000000N93u&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Community Case status changed</fullName>
        <actions>
            <name>Case_Status_changed_email_to_group_leader</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Case_Status_changed_email_to_record_creator</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(
ISCHANGED(Status),
RecordTypeId = &quot;0120B000000N93u&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Create new task Anderson System</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Anderson System Case</value>
        </criteriaItems>
        <description>Create a new task when a case is opened.Only For Anderson system Parent Case</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>DescriptionMirrorRule</fullName>
        <actions>
            <name>Description_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Used with FormAssembly to preserve existing Case Descriptions.</description>
        <formula>ISCHANGED( Description_Mirror__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Flat Rate Hours Timestamp</fullName>
        <actions>
            <name>FR_Timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Timestamps the datetime when the &quot;Monthly Flat Rate Hours&quot; in bookkeeping cases are changed.</description>
        <formula>IF(ISCHANGED( Monthly_Flat_Rate_Hours__c) ,TRUE,FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Help Desk Case is Closed</fullName>
        <actions>
            <name>SCH_0004</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Help_Desk_Closed_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Help Desk Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Closed_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>SCH-0004</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Help Desk Confirmation Email</fullName>
        <actions>
            <name>Help_Desk_Confirmation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Help Desk Case</value>
        </criteriaItems>
        <description>Sends a confirmation email when a help desk case is created.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>IFTF - Bundle</fullName>
        <actions>
            <name>Bundle_Applied</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Replace_Text</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Updates IFTF case description</description>
        <formula>AND(CONTAINS(Description, &quot;Invest For the Future 2020&quot;),
 Bundle_Applied__c = FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Into Entity Formation from Waiting on Documents</fullName>
        <actions>
            <name>Update_Entity_Formation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Set the Date Created when changed into Entity Formation from Waiting on Documents</description>
        <formula>AND(
RecordTypeId  = &quot;012U0000000g6UT&quot;,
PRIORVALUE(RecordTypeId) = &quot;0120B000000N8Q1&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LT Cases</fullName>
        <actions>
            <name>Description</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LTCase_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Naming_Convention</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Living_Trust</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Living Trust</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Lee Arnold Cases</fullName>
        <actions>
            <name>Lee_Arnold_Case_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lee_Arnold_Case_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lee_Arnold_Corp_Call</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Lee Arnold Corp</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Case Created</fullName>
        <actions>
            <name>Email_to_group_leader</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Assigned_Case_to_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Community Platinum Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Made_By_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>notEqual</operation>
            <value>Nick Frates</value>
        </criteriaItems>
        <description>SCH-109. Deactivated this workflow and moved processes to new flow: Case - Platinum Question Created - Emails</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Help Desk Case</fullName>
        <actions>
            <name>New_Help_Desk_Case</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Emails Edgar when a Help Desk case is created.</description>
        <formula>If(
/* Affiliate On-boarding */
RecordTypeId ==&apos;0124P000000EKfC&apos; ||

/* Marketing */
RecordTypeId ==&apos;0124P000000EKfE&apos; ||

/* Events */ 
RecordTypeId ==&apos;0124P000000EKfD&apos;
,true,False)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Help Desk Report</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Help Desk</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Category__c</field>
            <operation>equals</operation>
            <value>Reports/Dashboards</value>
        </criteriaItems>
        <description>Sends email to Sally when a new Help Desk report is requested.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Project</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Type</field>
            <operation>equals</operation>
            <value>Accounting</value>
        </criteriaItems>
        <description>Creating New Project for Each New Accounting Case</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notify Case Owner of New Case Comment</fullName>
        <actions>
            <name>New_Comment</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Turns_Comment_Box_off</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Case_Comment_Box__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Internal</value>
        </criteriaItems>
        <description>Sends email notification to case owner if a new case comment is left by the client</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pat James Cases</fullName>
        <actions>
            <name>Pat_James_Cases_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pat_James_Cases_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Pat_James_Corp_Call</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Pat James Corp</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Send Email  and Assign New Living Trust or Deed Prep Case to AA</fullName>
        <actions>
            <name>Email_Estate_Planning</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Case_Owner_to_AA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Assigns new living trust or deed preparation cases to Anderson Advisors.</description>
        <formula>OR(RecordTypeId = &quot;012U0000000g7PJ&quot;, RecordTypeId = &quot;0124P000000gMMA&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Survey feedback</fullName>
        <actions>
            <name>Update_case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>equals</operation>
            <value>NPS Complaint Resolution</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Vertucci Cases</fullName>
        <actions>
            <name>Vertucci_Case_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Vertucci_Case_Subject</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Vertucci</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Lee_Arnold_Corp_Call</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Lee Arnold Corp Call</subject>
    </tasks>
    <tasks>
        <fullName>Living_Trust</fullName>
        <assignedToType>owner</assignedToType>
        <description>Living Trust Fulfillment.</description>
        <dueDateOffset>60</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Living Trust</subject>
    </tasks>
    <tasks>
        <fullName>NVREA_Corp_Call</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NVREA Corp Call</subject>
    </tasks>
    <tasks>
        <fullName>New_task2</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Case.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Welcome Call</subject>
    </tasks>
    <tasks>
        <fullName>Pat_James_Corp_Call</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Pat James Corp Call</subject>
    </tasks>
    <tasks>
        <fullName>Welcome_Call</fullName>
        <assignedToType>owner</assignedToType>
        <description>Call the client and walk through Platinum site.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Welcome Call</subject>
    </tasks>
</Workflow>
