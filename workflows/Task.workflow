<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Paper_File_Client_Printing_1</fullName>
        <description>Paper File - Client Printing 1</description>
        <protected>false</protected>
        <recipients>
            <recipient>aespada+lex@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>srivituso@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Unfiled_Public/Paper_File_Client_Printing</template>
    </alerts>
    <alerts>
        <fullName>X1099R_Email_Alert_to_Christos</fullName>
        <description>1099R Email Alert to Christos</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>srajagopalan@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>All/X1099R_email_Notification_to_Christos</template>
    </alerts>
    <fieldUpdates>
        <fullName>Bookkeeping_Case_Task_Naming_Convention</fullName>
        <field>Subject</field>
        <formula>IF(OR(ISNULL(Recurrence_Interval_Mirror__c  ), Recurrence_Interval_Mirror__c  &lt;33), 
TEXT(MONTH(End_Date__c)) + &apos;.&apos; + TEXT(YEAR(End_Date__c)) + &apos; Bookkeeping&apos;,
IF(YEAR(Start_Date__c) &lt;&gt; YEAR(End_Date__c),
TEXT(MONTH(Start_Date__c)) + &apos;.&apos; + TEXT(YEAR(Start_Date__c)) + &apos; - &apos;+ TEXT(MONTH(End_Date__c)) + &apos;.&apos; + TEXT(YEAR(End_Date__c)) +  &apos; Bookkeeping&apos;,
TEXT(MONTH(Start_Date__c)) + &apos; - &apos;+ TEXT(MONTH(End_Date__c)) + &apos;.&apos; + TEXT(YEAR(End_Date__c)) +  &apos; Bookkeeping&apos;))</formula>
        <name>Bookkeeping Case Task Naming Convention</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Bookkeeping_Stage_Completed</fullName>
        <field>Bookkeeping_Stages__c</field>
        <literalValue>Completed</literalValue>
        <name>Bookkeeping Stage: Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Bookkeeping_Stage_Send_Financials</fullName>
        <field>Bookkeeping_Stages__c</field>
        <literalValue>In Progress</literalValue>
        <name>Bookkeeping Stage: Send Financials</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_F_U_to_Call_Type</fullName>
        <description>If Task Subject contains Follow Up, it will be reassigned as a Call Task Record Type unless it is a Dissolution Type.</description>
        <field>RecordTypeId</field>
        <lookupValue>Call</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change F/U to Call Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner</fullName>
        <description>Changes the owner of a task to Anderson Advisors.</description>
        <field>OwnerId</field>
        <lookupValue>boss@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Comments</fullName>
        <field>Description</field>
        <name>Clear Comments</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Summary</fullName>
        <field>Summary__c</field>
        <name>Clear Summary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Complete</fullName>
        <field>Status</field>
        <literalValue>Completed</literalValue>
        <name>Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_in_Tax_Prep</fullName>
        <description>Date task is changed to Tax-Prep.</description>
        <field>Date_in_Tax_Prep__c</field>
        <formula>TODAY()</formula>
        <name>Date in Tax-Prep</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_in_Tax_Review</fullName>
        <description>Date task updated to Tax-Review.</description>
        <field>Date_in_Tax_Review__c</field>
        <formula>TODAY()</formula>
        <name>Date in Tax-Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Docs_Rcvd_from_Client</fullName>
        <field>Docs_Rcvd_from_Client__c</field>
        <name>Docs Rcvd from Client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Draft_Financial_Sent_to_Client</fullName>
        <field>Draft_Financial_Sent_to_Client_On__c</field>
        <formula>today()</formula>
        <name>Draft Financial Sent to Client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Draft_Financial_Sent_to_Client_On</fullName>
        <field>Draft_Financial_Sent_to_Client_On__c</field>
        <formula>TODAY()</formula>
        <name>Draft Financial Sent to Client On</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Final_Tax_Return_Timestamp</fullName>
        <description>Populates the timestamp field when the stage changes to Final Tax Return.</description>
        <field>Final_Tax_Return_Timestamp__c</field>
        <formula>NOW()</formula>
        <name>Final Tax Return Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Financial_Sent_to_Client_On</fullName>
        <field>Financials_Sent_to_Client_On__c</field>
        <formula>today()</formula>
        <name>Financial Sent to Client On</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Financials_Sent_to_Client_On</fullName>
        <field>Financials_Sent_to_Client_On__c</field>
        <name>Financials Sent to Client On</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Input_Completed_Date_in_Field</fullName>
        <field>Completed_Date__c</field>
        <formula>Now()</formula>
        <name>Input Completed Date in Field.</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Living_Trust_Updates_Comments</fullName>
        <field>Update_Comments__c</field>
        <formula>IF( 
AND( 
ISPICKVAL(PRIORVALUE(Living_Trust_Stages__c), &quot;Ready for Paralegal to Draft&quot;), 
ISPICKVAL(Living_Trust_Stages__c, &quot;Waiting for Attorney Review&quot;)), 

TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + &apos;Docs Drafted&apos; + BR() + TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + TEXT( Living_Trust_Stages__c ) + BR() + Description, 

TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + TEXT( Living_Trust_Stages__c ) + BR()+ Description)</formula>
        <name>Living Trust Updates Comments</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ready_to_File_Timestamp</fullName>
        <field>Ready_to_File_TS__c</field>
        <formula>NOW()</formula>
        <name>Ready to File Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Related_List_Update</fullName>
        <field>Formula_Comments__c</field>
        <formula>IF(LEN(Description)&gt;255,LEFT(Description,252)&amp;&quot;...&quot;,Description)</formula>
        <name>Related List Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Bookkeeping_Stage_to_Not_Started</fullName>
        <field>Bookkeeping_Stages__c</field>
        <literalValue>Not Started</literalValue>
        <name>Set Bookkeeping Stage to Not Started</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_RecordType_to_Call</fullName>
        <description>Sets Record Type to Call</description>
        <field>RecordTypeId</field>
        <lookupValue>Call</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set RecordType to Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Summary_to_Short_Description</fullName>
        <description>LEFT(Summary_c,252)&amp;”…”</description>
        <field>Summary__c</field>
        <formula>LEFT(Description,252)&amp;&apos;…&apos;</formula>
        <name>Set Summary to Short Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Timestamp_BCP</fullName>
        <description>Timestamps Ready to File Timestamp field (normally a Tax field) for AS Case tasks when a BCP stage is selected for the first time.</description>
        <field>Ready_to_File_TS__c</field>
        <formula>NOW()</formula>
        <name>Timestamp BCP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Timestamp_KMS</fullName>
        <field>Final_Tax_Return_Timestamp__c</field>
        <formula>NOW()</formula>
        <name>Timestamp KMS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Todays_Date</fullName>
        <description>Enter todays date</description>
        <field>Date_Due__c</field>
        <formula>TODAY()</formula>
        <name>Todays Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Type_of_Financials_Sent</fullName>
        <field>Type_of_Financials_Sent__c</field>
        <name>Type of Financials Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Comments</fullName>
        <field>Description</field>
        <formula>TEXT(Today()) + &apos; - &apos; +LEFT( $User.FirstName , 1)+&apos;.&apos;+ $User.LastName + &apos; - &apos; + Update_Comments__c + BR() + Description</formula>
        <name>Update Comments</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Comments_Status</fullName>
        <field>Description</field>
        <formula>TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - Changed to &apos; + TEXT( Status ) + BR() + Description</formula>
        <name>Update Comments - Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Comments_Task</fullName>
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
        <name>Update Comments - Task</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Comments_Tax_Stages_2</fullName>
        <field>Description</field>
        <formula>TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - Changed to &apos; + TEXT( Tax_Stage__c ) + BR() + Description</formula>
        <name>Update Comments - Tax Stages</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Comments_w_Stage</fullName>
        <description>Updates the comments with the Task Stage</description>
        <field>Description</field>
        <formula>IF(
AND(
ISPICKVAL(PRIORVALUE(Living_Trust_Stages__c), &quot;Ready for Paralegal to Draft&quot;),
ISPICKVAL(Living_Trust_Stages__c, &quot;Waiting for Attorney Review&quot;)),

TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + TEXT( Living_Trust_Stages__c )  + BR() + TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + &apos;Docs Drafted&apos; + BR() + Description,

TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + TEXT( Living_Trust_Stages__c ) + BR()+ Description)</formula>
        <name>Update Comments w/ Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Comments_with_Stage</fullName>
        <field>Description</field>
        <formula>TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + TEXT(Bookkeeping_Stages__c) + BR() + Description</formula>
        <name>Update Comments with Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_in_Ready_for_Client_Review</fullName>
        <field>Date_in_Ready_for_Client_Review__c</field>
        <formula>TODAY()</formula>
        <name>Update Date in Ready for Client Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_in_Tax_Review_Complete</fullName>
        <field>Date_in_Tax_Review_Complete__c</field>
        <formula>Today()</formula>
        <name>Update Date in Tax-Review Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Docs_Rcvd_from_Client</fullName>
        <field>Docs_Rcvd_from_Client__c</field>
        <formula>today()</formula>
        <name>Update Docs Rcvd from Client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Review_Complete</fullName>
        <field>Date_Binder_was_Shipped__c</field>
        <formula>TODAY()</formula>
        <name>Update Review Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Task_type_when_case_created</fullName>
        <field>Type</field>
        <literalValue>Email</literalValue>
        <name>Update Task type when case created</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_to_Internal</fullName>
        <field>Type</field>
        <literalValue>Internal</literalValue>
        <name>Update to Internal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>AC Expectation Calls</fullName>
        <actions>
            <name>Update_Comments_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Tracks first response time</description>
        <formula>AND(
ISCHANGED(Status),
TEXT( Status ) = &apos;In Progress&apos;,
OR(Subject = &apos;Tax Expectation Call&apos;,
Subject = &apos;Tax Advantage Program Onboarding&apos;,
Subject = &apos;Tax Welcome Call&apos;,
Subject = &apos;Accounting Start Pack Onboarding&apos;)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BCP Stage Selected</fullName>
        <actions>
            <name>Timestamp_BCP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Timestamps Ready to File Timestamp field (normally a Tax field) for AS Case tasks when a BCP stage is selected for the first time.</description>
        <formula>AND(ISCHANGED( Anderson_System_Stage__c ), CONTAINS(TEXT( Anderson_System_Stage__c), &apos;BCP&apos;),  RecordType.DeveloperName = &apos;Anderson System&apos;, ISBLANK(Ready_to_File_TS__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BKG Task%3A Update Docs Received Date</fullName>
        <actions>
            <name>Update_Docs_Rcvd_from_Client</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Bookkeeping Task</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Supporting Documents Received</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Docs_Rcvd_from_Client__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>BKG Task%3A Update Draft Financials Sent to Client</fullName>
        <actions>
            <name>Bookkeeping_Stage_Send_Financials</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Draft_Financial_Sent_to_Client</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Bookkeeping Task</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Type_of_Financials_Sent__c</field>
            <operation>equals</operation>
            <value>Missing Info,Draft</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Draft_Financial_Sent_to_Client_On__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>BKG Task%3A Update Final Financials Sent to Client</fullName>
        <actions>
            <name>Bookkeeping_Stage_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Financial_Sent_to_Client_On</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Bookkeeping Task</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Type_of_Financials_Sent__c</field>
            <operation>equals</operation>
            <value>Final</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Financials_Sent_to_Client_On__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Blank Task Record Type Buster</fullName>
        <actions>
            <name>Set_RecordType_to_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Changes tasks without a record type to Call</description>
        <formula>OR(
ISBLANK( RecordTypeId ),
ISNULL( RecordTypeId ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Bookkeeping Task Update</fullName>
        <actions>
            <name>Bookkeeping_Case_Task_Naming_Convention</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Bookkeeping Task</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.RecurrenceRegeneratedType</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.Username</field>
            <operation>notEqual</operation>
            <value>slee@andersonadvisors.com</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Client Printing - Ashley</fullName>
        <actions>
            <name>Paper_File_Client_Printing_1</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Tax_Stage__c</field>
            <operation>equals</operation>
            <value>Paper File - Client Printing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Tax_Advisors_Admin__c</field>
            <operation>equals</operation>
            <value>Ashley Silafau-Sanitoa</value>
        </criteriaItems>
        <description>Sends an email to Ashley when the stage is changed to Client Printing</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Comments for Related List</fullName>
        <actions>
            <name>Related_List_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Description</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Pulls first 255 characters of the task description and populates a field to display in the Case related list.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date - Ready for Client Review</fullName>
        <actions>
            <name>Draft_Financial_Sent_to_Client_On</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Recycle field Draft_Financial_Sent_to_Client_On__c on tax record type</description>
        <formula>AND( ISCHANGED( Tax_Stage__c), ISBLANK(Draft_Financial_Sent_to_Client_On__c), 
OR( 
ISPICKVAL( Tax_Stage__c, &apos;Ready for Client Review&apos;),
ISPICKVAL( Tax_Stage__c, &apos;Ready for Client Review - Paper File&apos;) 
) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date Binder Shipped %28Tax%29</fullName>
        <actions>
            <name>Update_Review_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Using the Date Binder Shipped field to store Review Complete / Review Complete Paper file dates</description>
        <formula>AND( ISCHANGED( Tax_Stage__c),ISBLANK(Date_Binder_was_Shipped__c),ISBLANK(Draft_Financial_Sent_to_Client_On__c),
OR(
ISPICKVAL( Tax_Stage__c, &apos;Review Complete- Paper File&apos;),
ISPICKVAL( Tax_Stage__c, &apos;Review Complete&apos;)
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date entered Tax-Prep</fullName>
        <actions>
            <name>Date_in_Tax_Prep</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Populates date into &quot;Date in Tax-Prep&quot; field when the Tax Stage</description>
        <formula>OR(
AND(ISCHANGED(Tax_Stage__c), ISBLANK(Date_in_Tax_Prep__c),
OR(
ISPICKVAL(Tax_Stage__c,&apos;Assigned&apos;), ISPICKVAL(Tax_Stage__c,&apos;In Progress&apos;), ISPICKVAL(Tax_Stage__c,&apos;Ready for Tax Prep&apos;))
),
AND(
AND(ISCHANGED(Tax_Stage__c), ISPICKVAL(Tax_Stage__c,&apos;Ready for Tax Prep&apos;),
NOT(ISPICKVAL(PRIORVALUE(Tax_Stage__c),&apos;Ready for Tax Prep&apos;)), NOT(ISPICKVAL(PRIORVALUE(Tax_Stage__c),&apos;In Progress&apos;))
)
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date entered Tax-Review</fullName>
        <actions>
            <name>Date_in_Tax_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Date entered Tax-Review</description>
        <formula>AND( ISCHANGED( Tax_Stage__c), ISBLANK(Date_in_Tax_Review__c),
ISPICKVAL( Tax_Stage__c, &apos;Review&apos;)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date in Ready for Client Review</fullName>
        <actions>
            <name>Update_Date_in_Ready_for_Client_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Date Task is changed to Ready for Client Review</description>
        <formula>AND( ISCHANGED( Tax_Stage__c), ISBLANK(Date_in_Ready_for_Client_Review__c),
OR(
ISPICKVAL( Tax_Stage__c, &apos;Ready for Client Review&apos;),
ISPICKVAL( Tax_Stage__c, &apos;Ready for Client Review - Paper Filing&apos;)
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date in Tax-Review Complete</fullName>
        <actions>
            <name>Update_Date_in_Tax_Review_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISCHANGED( Tax_Stage__c), ISBLANK(Date_in_Tax_Review_Complete__c), 
OR( 
ISPICKVAL( Tax_Stage__c, &apos;Review Complete&apos;),
ISPICKVAL( Tax_Stage__c, &apos;Review Complete- Paper File&apos;) 
) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Date task is completed</fullName>
        <actions>
            <name>Input_Completed_Date_in_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Timestamp when task status is changed to completed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Final Tax Return Timestamp</fullName>
        <actions>
            <name>Final_Tax_Return_Timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Dissolution</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Processing_Status__c</field>
            <operation>equals</operation>
            <value>Final Tax Return Required</value>
        </criteriaItems>
        <description>Populates the timestamp field when the stage changes to Final Tax Return.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Follow Up Task Automation</fullName>
        <actions>
            <name>Change_F_U_to_Call_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(
AND(CONTAINS(&quot;Accounting Coordinator&quot;, Owner:User.Title),
$User.Id &lt;&gt; &apos;0050B000007ZwgA&apos;,
IsVisibleInSelfService != TRUE), 
IF(AND(OR(CONTAINS(&quot;Follow up&quot;,Subject),CONTAINS(&quot;Follow Up&quot;,Subject)),   RecordTypeId != &quot;012U0000000g5s9&quot;, RecordTypeId != &quot;0120B000000N8Cn&quot;, $User.Id &lt;&gt; &apos;0050B000007ZwgA&apos;,
IsVisibleInSelfService != TRUE),TRUE,FALSE)
,FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>KMS Stage Selected</fullName>
        <actions>
            <name>Timestamp_KMS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Timestamps Ready to File Timestamp field (normally a Tax field) for AS Case tasks when a KMS stage is selected for the first time.</description>
        <formula>AND(ISCHANGED( Anderson_System_Stage__c ), CONTAINS(TEXT( Anderson_System_Stage__c), &apos;KMS&apos;),  RecordType.DeveloperName = &apos;Anderson System&apos;, ISBLANK(Final_Tax_Return_Timestamp__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Living Trust Stage Comments</fullName>
        <actions>
            <name>Update_Comments_w_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Detects if the Living Trust Stage was changed and updates the comments with the value.</description>
        <formula>AND(
RecordTypeId = &quot;0120B000000t82r&quot;,
ISCHANGED(  Living_Trust_Stages__c  ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Living Trust Task Closed</fullName>
        <actions>
            <name>Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Living Trust</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Living_Trust_Stages__c</field>
            <operation>equals</operation>
            <value>Closed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Living Trust related list WF</fullName>
        <actions>
            <name>Set_Summary_to_Short_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates summary field for the case related list when comments are changed.</description>
        <formula>ISCHANGED( Description )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Meeting Minute Task</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>contains</operation>
            <value>Meeting MInutes</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.CreatedById</field>
            <operation>equals</operation>
            <value>Clint Coons</value>
        </criteriaItems>
        <description>Assigns new meeting minute tasks to Anderson Advisors.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Call - Set Type to Internal</fullName>
        <actions>
            <name>Update_to_Internal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Call</value>
        </criteriaItems>
        <description>Sets the Type field of a new call to internal to prevent it from showing up in the Platinum message center.

Turned on 10/25 as preventative measure against internal communication going into the portal
Turned off 11/13 after sending groove video</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Deed Prep Task%3F Assign to AA</fullName>
        <actions>
            <name>Change_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Assigns created deed preparation tasks to Anderson Advisors.</description>
        <formula>RecordTypeId = &quot;0124P000000gMHn&quot;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Living Trust Task%3F Assign to AA</fullName>
        <actions>
            <name>Change_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Assigns created living trust tasks to Anderson Advisors.</description>
        <formula>AND(
RecordTypeId = &quot;0120B000000t82r&quot;,
NOT(ISBLANK(Related_Entity__c)),
NOT(CONTAINS(Subject, &quot;Consultation Reminder&quot;)),
NOT(CONTAINS(Subject, &quot;Print and Ship&quot;))
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Processing Task Without Due Date</fullName>
        <actions>
            <name>Todays_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Fills in today&apos;s date into the due date if a processing task is saved without one.</description>
        <formula>AND(
ISBLANK( ActivityDate ),
 RecordType.DeveloperName = &quot;Processing&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Ready to File Timestamp</fullName>
        <actions>
            <name>Ready_to_File_Timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
AND(ISCHANGED( Processing_Status__c),   ISPICKVAL(Processing_Status__c, &apos;Ready to File&apos;),  RecordType.Name = &apos;Dissolution&apos;)
,
AND(ISCHANGED( Tax_Stage__c ),
ISPICKVAL(Tax_Stage__c, &apos;Ready to File&apos;),
ISBLANK(Ready_to_File_TS__c))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Restart Bookeeping Stage for New Task</fullName>
        <actions>
            <name>Clear_Comments</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_Summary</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Docs_Rcvd_from_Client</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Financials_Sent_to_Client_On</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Bookkeeping_Stage_to_Not_Started</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Type_of_Financials_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.RecurrenceRegeneratedType</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Bookkeeping Task</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Summary for Tasks</fullName>
        <actions>
            <name>Set_Summary_to_Short_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 and 2)</booleanFilter>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>notContain</operation>
            <value>Email: &gt;&gt;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>notContain</operation>
            <value>Email: &lt;&lt;</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Tax Stage Comments</fullName>
        <actions>
            <name>Update_Comments_Tax_Stages_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates comment with latest Tax Stage change</description>
        <formula>AND(
    ISCHANGED(Tax_Stage__c),
    RecordType.Name = &apos;Tax&apos;
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Comments</fullName>
        <actions>
            <name>Update_Comments</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Used with inline editing list views.  Will add text to comments section in task.</description>
        <formula>OR(

AND(ISNEW(), NOT(ISBLANK(Update_Comments__c))),

AND(ISCHANGED(Update_Comments__c), NOT(ISBLANK(Update_Comments__c)))

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Comments with Stage</fullName>
        <actions>
            <name>Update_Comments_with_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED(Bookkeeping_Stages__c), RecordType.Id = &apos;0120B000000QxKo&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update IFTF Task</fullName>
        <actions>
            <name>Update_Comments_Task</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Formula_Comments__c</field>
            <operation>contains</operation>
            <value>(1) Invest For the Future 2020</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Description</field>
            <operation>notContain</operation>
            <value>Corporate Assistance Program</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Web_Request_in_Salesforce</fullName>
        <assignedTo>kstephen@andersonadvisors.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Task.CreatedDate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Web Request in Salesforce</subject>
    </tasks>
</Workflow>
