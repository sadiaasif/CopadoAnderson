<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Client_Bookkkeping_Consult_calendar_Invite</fullName>
        <description>Client- Bookkkeping Consult calendar invite</description>
        <protected>false</protected>
        <recipients>
            <field>E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Bookkeeping/Schedule_BK_Consult_calendar_Invite</template>
    </alerts>
    <alerts>
        <fullName>Client_Schedule_Bookkkeping_Consult</fullName>
        <description>Client- Bookkkeping terms and condition and Consult Questionnaire</description>
        <protected>false</protected>
        <recipients>
            <field>E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Bookkeeping/BookKeeping_Consult_Email</template>
    </alerts>
    <alerts>
        <fullName>NPS_One_Time_BK_Jun_19</fullName>
        <description>NPS - One Time BK Jun &apos;19</description>
        <protected>false</protected>
        <recipients>
            <field>E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/NPS_One_Time_BK_Jun_19</template>
    </alerts>
    <alerts>
        <fullName>NPS_One_Time_Tax_Jun_19</fullName>
        <description>NPS - One Time Tax Jun &apos;19</description>
        <protected>false</protected>
        <recipients>
            <field>E_Mail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/NPS_One_Time_Tax_Jun_19</template>
    </alerts>
    <alerts>
        <fullName>Send_alert_of_Platinum_failed_transaction</fullName>
        <description>Send alert of Platinum failed transaction.</description>
        <protected>false</protected>
        <recipients>
            <field>ASCaller__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/Platinum_Error</template>
    </alerts>
    <fieldUpdates>
        <fullName>AFS_Lead_Status_Timestamp</fullName>
        <field>AFS_Lead_Timestamp2__c</field>
        <formula>NOW()</formula>
        <name>AFS Lead Status Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AS_Binder_Trigger</fullName>
        <field>AS_Binder_Trigger__c</field>
        <literalValue>1</literalValue>
        <name>AS Binder Trigger</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Name_Update</fullName>
        <field>Name</field>
        <formula>Last_Name__c+&quot;, &quot;+ First_Name__c +&quot; &amp; &quot;+Spouse_First_Name__c</formula>
        <name>Account Name Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CIty</fullName>
        <field>ShippingCity</field>
        <formula>BillingCity</formula>
        <name>CIty</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Anderson</fullName>
        <field>OwnerId</field>
        <lookupValue>boss@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Change Owner to Anderson</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Team</fullName>
        <field>Teams__c</field>
        <literalValue>Team Renewals</literalValue>
        <name>Change Team</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_Team_Renewals</fullName>
        <field>Assigned_CAM__c</field>
        <literalValue>Team Renewals</literalValue>
        <name>Change to Team Renewals</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Client_Name_Update</fullName>
        <field>Name</field>
        <formula>Last_Name__c+&quot;, &quot;+ First_Name__c +&quot; &amp; &quot;+ Spouse_Last_Name__c+&quot;, &quot;+ Spouse_First_Name__c</formula>
        <name>Client Name Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Client_Name_Update_V3</fullName>
        <field>Name</field>
        <formula>Last_Name__c+&quot;, &quot;+ First_Name__c</formula>
        <name>Client Name Update V3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Country</fullName>
        <field>ShippingCountry</field>
        <formula>BillingCountry</formula>
        <name>Country</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Dani_Johnson_Initiate</fullName>
        <field>Platinum_Type__c</field>
        <literalValue>Dani Johnson</literalValue>
        <name>Dani Johnson - Initiate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enter_Today</fullName>
        <description>Enter today into the Last NPS Sent field on the account object.</description>
        <field>Last_NPS_Sent__c</field>
        <formula>TODAY()</formula>
        <name>Enter Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>KMS_Date_Update</fullName>
        <field>KMS_Date__c</field>
        <formula>Now()</formula>
        <name>KMS Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LucidChart_Created_Date</fullName>
        <field>LucidChart_Blueprint_Created_Date__c</field>
        <formula>NOW()</formula>
        <name>LucidChart Created Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LucidChart_Feedback_By</fullName>
        <field>LucidChart_Feedback_By__c</field>
        <formula>$User.FirstName + &quot; &quot; + $User.LastName</formula>
        <name>LucidChart Feedback By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LucidChart_Feedback_Time</fullName>
        <field>LucidChart_Feedback_Date__c</field>
        <formula>NOW()</formula>
        <name>LucidChart Feedback Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NVREA_AP_Event_Yes</fullName>
        <field>Client_Signed_Up_for_AP_Event__c</field>
        <literalValue>Yes</literalValue>
        <name>NVREA AP Event - Yes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Platinum_Initiate</fullName>
        <field>Platinum_Membership__c</field>
        <literalValue>Platinum</literalValue>
        <name>Platinum Initiate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Platinum_Type_Revoke</fullName>
        <field>Platinum_Type__c</field>
        <name>Platinum Type Revoke</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>State</fullName>
        <field>ShippingState</field>
        <formula>BillingState</formula>
        <name>State</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Street</fullName>
        <field>PersonOtherStreet</field>
        <formula>BillingStreet</formula>
        <name>Street</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Street2</fullName>
        <field>ShippingStreet</field>
        <formula>BillingStreet</formula>
        <name>Street</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tax_Team_Initiate</fullName>
        <field>Platinum_Type__c</field>
        <literalValue>Tax Team</literalValue>
        <name>Tax Team - Initiate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_BK</fullName>
        <field>Bookkeeper_Text__c</field>
        <formula>TEXT( Bookkeeper_Picklist__c )</formula>
        <name>Update BK</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Platinum_Elite</fullName>
        <field>Platinum_Membership__c</field>
        <literalValue>Platinum Elite</literalValue>
        <name>Update Platinum Elite</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Platinum_picklist_to_None</fullName>
        <field>Platinum_Membership__c</field>
        <name>Platinum Revoke</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Senior_Advisor_1</fullName>
        <field>Senior_Advisor__c</field>
        <formula>TEXT( Senior_Advisor_Picklist__c )</formula>
        <name>Update Senior Advisor 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_State_to_two_letter_abbreviation</fullName>
        <field>PersonMailingState</field>
        <formula>Case (  ShippingState  , 
&quot;Alabama&quot;, &quot;AL&quot;, 
&quot;Alaska&quot;, &quot;AK&quot;, 
&quot;Arizona&quot;, &quot;AZ&quot;, 
&quot;Arkansas&quot;, &quot;AR&quot;, 
&quot;California&quot;, &quot;CA&quot;, 
&quot;Colorado&quot;, &quot;CO&quot;, 
&quot;Connecticut&quot;, &quot;CT&quot;, 
&quot;Delaware&quot;, &quot;DE&quot;, 
&quot;Florida&quot;, &quot;FL&quot;, 
&quot;Georgia&quot;, &quot;GA&quot;, 
&quot;Hawaii&quot;, &quot;HI&quot;, 
&quot;Idaho&quot;, &quot;ID&quot;, 
&quot;Illinois&quot;, &quot;IL&quot;, 
&quot;Indiana&quot;, &quot;IN&quot;, 
&quot;Iowa&quot;, &quot;IA&quot;, 
&quot;Kansas&quot;, &quot;KS&quot;, 
&quot;Kentucky&quot;, &quot;KY&quot;, 
&quot;Louisiana&quot;, &quot;LA&quot;, 
&quot;Maine&quot;, &quot;ME&quot;, 
&quot;Maryland&quot;, &quot;MD&quot;, 
&quot;Massachusetts&quot;, &quot;MA&quot;, 
&quot;Michigan&quot;, &quot;MI&quot;, 
&quot;Minnesota&quot;, &quot;MN&quot;, 
&quot;Mississippi&quot;, &quot;MS&quot;, 
&quot;Missouri&quot;, &quot;MO&quot;, 
&quot;Montana&quot;, &quot;MT&quot;, 
&quot;Nebraska&quot;, &quot;NE&quot;, 
&quot;Nevada&quot;, &quot;NV&quot;, 
&quot;New Hampshire&quot;, &quot;NH&quot;, 
&quot;New Jersey&quot;, &quot;NJ&quot;, 
&quot;New Mexico&quot;, &quot;NM&quot;, 
&quot;New York&quot;, &quot;NY&quot;, 
&quot;North Carolina&quot;, &quot;NC&quot;, 
&quot;North Dakota&quot;, &quot;ND&quot;, 
&quot;Ohio&quot;, &quot;OH&quot;, 
&quot;Oklahoma&quot;, &quot;OK&quot;, 
&quot;Oregon&quot;, &quot;OR&quot;, 
&quot;Pennsylvania&quot;, &quot;PA&quot;, 
&quot;Rhode Island&quot;, &quot;RI&quot;, 
&quot;South Carolina&quot;, &quot;SC&quot;, 
&quot;South Dakota&quot;, &quot;SD&quot;, 
&quot;Tennessee&quot;, &quot;TN&quot;, 
&quot;Texas&quot;, &quot;TX&quot;, 
&quot;Utah&quot;, &quot;UT&quot;, 
&quot;Vermont&quot;, &quot;VT&quot;, 
&quot;Virginia&quot;, &quot;VA&quot;, 
&quot;Washington&quot;, &quot;WA&quot;, 
&quot;West Virginia&quot;, &quot;WV&quot;, 
&quot;Wisconsin&quot;, &quot;WI&quot;, 
&quot;Wyoming&quot;, &quot;WY&quot;, 
&quot;Ontario&quot;, &quot;ON&quot;, 
&quot;Quebec&quot;, &quot;QC&quot;, 
&quot;QuéBec&quot;, &quot;QC&quot;, 
&quot;British Columbia&quot;, &quot;BC&quot;, 
&quot;Alberta&quot;, &quot;AB&quot;, 
&quot;Manitoba&quot;, &quot;MB&quot;, 
&quot;Saskatchewan&quot;, &quot;SK&quot;, 
&quot;Nova Scotia&quot;, &quot;NS&quot;, 
&quot;New Brunswick&quot;, &quot;NB&quot;, 
&quot;Newfoundland And Labrador&quot;, &quot;NL&quot;, 
&quot;Prince Edward Island&quot;, &quot;PE&quot;, 
&quot;Northwest Territories&quot;, &quot;NT&quot;, 
&quot;Yukon&quot;, &quot;YT&quot;, 
&quot;Nunavut&quot;, &quot;NU&quot; 
,&quot;&quot;)</formula>
        <name>Update State to two letter abbreviation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Tax_Preparer</fullName>
        <field>Tax_Preparer_Text__c</field>
        <formula>TEXT(  Tax_Preparer__c )</formula>
        <name>Update Tax Preparer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Tax_Queue</fullName>
        <field>Tax_Queue__c</field>
        <formula>CASE(Routing_8x8__c, 
&quot;Tax Package - Active&quot;, &quot;639&quot;, 
&quot;Tax Package - None Active&quot;, &quot;639&quot;,
&quot;639&quot;)</formula>
        <name>Update Tax Queue #</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Team_Que</fullName>
        <field>Team_Queue__c</field>
        <formula>CASE(Teams__c,
&quot;Team 1&quot;, &quot;228&quot;,
&quot;Team 2&quot;, &quot;230&quot;,
&quot;Team 3&quot;, &quot;231&quot;,
&quot;Team 4&quot;, &quot;232&quot;,
&quot;Team 5&quot;, &quot;233&quot;,
&quot;Team 6&quot;, &quot;1003&quot;,
&quot;Team 7&quot;, &quot;1007&quot;,
&quot;VIP&quot;, &quot;233&quot;,
&quot;Team Renewals&quot;, &quot;234&quot;,
&quot;234&quot;)</formula>
        <name>Update Team Que #</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Zip</fullName>
        <field>ShippingPostalCode</field>
        <formula>BillingPostalCode</formula>
        <name>Zip</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>uncheck_box</fullName>
        <field>KMS_Deliverable_Merge__c</field>
        <literalValue>0</literalValue>
        <name>uncheck box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <outboundMessages>
        <fullName>KMS_Conga_Trigger</fullName>
        <apiVersion>48.0</apiVersion>
        <endpointUrl>https://workflow.congamerge.com/OBMListener.ashx</endpointUrl>
        <fields>Id</fields>
        <fields>KMS_Deliverable_Conga_Trigger__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>boss@andersonadvisors.com</integrationUser>
        <name>KMS Conga Trigger</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>8x8 Populate Accounting CoordinatorQue %23</fullName>
        <actions>
            <name>Update_Tax_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>8x8 Populate Accounting Coordinator Que #</description>
        <formula>OR(ISCHANGED(Routing_8x8__c), ISBLANK(Tax_Queue__c), ISCHANGED(Tax_Queue__c), ISCHANGED(Workflow__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>8x8 Populate Team Que %23</fullName>
        <actions>
            <name>Update_Team_Que</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISCHANGED(Teams__c), ISBLANK(Team_Queue__c), ISCHANGED(Team_Queue__c), ISCHANGED(Workflow__c), ISCHANGED (Assigned_CAM__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AFS Lead Status Timestamp</fullName>
        <actions>
            <name>AFS_Lead_Status_Timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When either of the Status with AFS changes to Lead, a timestamp is created &amp; updated</description>
        <formula>OR(
AND(ISNEW(),
OR(
ISPICKVAL(Insurance__c , &apos;Lead&apos;),
ISPICKVAL(Status_with_AFS__c , &apos;Lead&apos;)
)),

OR(
AND(
ISCHANGED(Insurance__c),
ISPICKVAL(Insurance__c, &apos;Lead&apos;),
NOT(ISPICKVAL(PRIORVALUE(Insurance__c),&apos;Lead&apos;))),
AND(
ISCHANGED(Status_with_AFS__c),
ISPICKVAL(Status_with_AFS__c , &apos;Lead&apos;),
NOT(ISPICKVAL(PRIORVALUE(Status_with_AFS__c), &apos;Lead&apos;)))
))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AS Binder</fullName>
        <actions>
            <name>AS_Binder_Trigger</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.First_Closed_Sale_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>8/30/2016</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.AS_Binder_Sent__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Platinum_Sale_Count__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Platinum_Transaction_Error__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.AS_Binder_Trigger__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Send AS Binder when First Closed Sales Date populates</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Change to Team Renewals when CAM blank</fullName>
        <actions>
            <name>Change_Team</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISBLANK(TEXT(Assigned_CAM__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Dani Platinum Initiate - Account</fullName>
        <actions>
            <name>Dani_Johnson_Initiate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Dani Johnson Platinum</description>
        <formula>AND( 
Platinum_Transaction_Error__c=0, 
Platinum_Sale_Count__c&gt;0, 
Platinum_Type_Rollup__c&gt;0, 
NOT(ISPICKVAL(Platinum_Type__c, &quot;Lifetime Platinum&quot;)) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>KMS Date Update</fullName>
        <actions>
            <name>KMS_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KMS__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>KMS Deliverable Conga Merge</fullName>
        <actions>
            <name>KMS_Conga_Trigger</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.KMS_Deliverable_Merge__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>uncheck_box</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Last NPS Sent Date</fullName>
        <actions>
            <name>Enter_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Records the date of lhe last sent NPS Survey. Used to ensure we don&apos;t send more than 1 survey a day.</description>
        <formula>OR(
 ISCHANGED(NPS_BCP__c ),
 ISCHANGED(NPS_Bookkeeping__c ),
 ISCHANGED( NPS_Entity_Formation_Sale__c ),
 ISCHANGED( NPS_Living_Trust_Date__c ),
 ISCHANGED( NPS_Platinum_Sale__c ),
 ISCHANGED( NPS_Renewal_Sale__c ),
 ISCHANGED(  NPS_Tax_Case__c )

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LucidChart Created Date</fullName>
        <actions>
            <name>LucidChart_Created_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED( LucidChart_Created__c ),
 LucidChart_Created__c = TRUE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LucidChart Feedback Date</fullName>
        <actions>
            <name>LucidChart_Feedback_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>LucidChart_Feedback_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED( LucidChart_Diagram_Feedback__c ),
NOT(ISBLANK(LucidChart_Diagram_Feedback__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>NVREA AP Event - Yes</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client_Signed_Up_for_AP_Event__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <description>Sets the picklist to &quot;Yes&quot; after 3 months.</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>NVREA_AP_Event_Yes</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>91</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Ownership to Anderson Advisors</fullName>
        <actions>
            <name>Change_Owner_to_Anderson</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>notEqual</operation>
            <value>Anderson Advisors</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Picture Workflow</fullName>
        <actions>
            <name>Update_BK</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Senior_Advisor_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Tax_Preparer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Populates metadata for the picture fields.</description>
        <formula>OR(
ISCHANGED(  Bookkeeper_Picklist__c ),
ISCHANGED( Senior_Advisor_Picklist__c ),
ISCHANGED( Tax_Preparer__c )

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Platinum Account Email Failed Transaction</fullName>
        <actions>
            <name>Send_alert_of_Platinum_failed_transaction</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Platinum_Transaction_Error__c</field>
            <operation>notEqual</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ASCaller__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Platinum Revoke - Account</fullName>
        <actions>
            <name>Platinum_Type_Revoke</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(
OR(
Platinum_Transaction_Error__c &gt; 0,
Platinum_Sale_Count__c=0),
NOT(ISPICKVAL(Platinum_Type__c, &quot;Lifetime Platinum&quot;))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Schedule 90 days out%2E</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Schedule_out_90_days__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Shipping Validation</fullName>
        <active>false</active>
        <formula>AND(
CloudingoAgent__SAS__c=2 , 
ISCHANGED(ShippingAddress))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Street</fullName>
        <actions>
            <name>CIty</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Country</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>State</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Street2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Zip</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.ShippingStreet</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Tax Team Platinum Initiate - Account</fullName>
        <actions>
            <name>Tax_Team_Initiate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND( 
Platinum_Transaction_Error__c=0, 
Platinum_Sale_Count__c&gt;0, 
Plat_Type_Tax__c&gt;0, 
NOT(ISPICKVAL(Platinum_Type__c, &quot;Lifetime Platinum&quot;)) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update State to two letter abbreviation</fullName>
        <actions>
            <name>Update_State_to_two_letter_abbreviation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.ShippingState</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update client last name%2C first name</fullName>
        <actions>
            <name>Client_Name_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If account has different last names, it will change the format from Last Name, First &amp; Spouse First to Last Name, First &amp; Spouse Last Name, First Name</description>
        <formula>AND(NOT(ISBLANK(Spouse_First_Name__c )),
NOT(ISBLANK(Spouse_Last_Name__c )),
(Last_Name__c) &lt;&gt; (Spouse_Last_Name__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update client last name%2C first name v2</fullName>
        <actions>
            <name>Account_Name_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If account has different last names, it will change the format from Last Name, First &amp; Spouse First to Last Name, First &amp; Spouse Last Name, First Name</description>
        <formula>OR(
Last_Name__c=Spouse_Last_Name__c,
AND(
NOT(ISBLANK(Spouse_First_Name__c)),
ISBLANK(Spouse_Last_Name__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update client last name%2C first name v3</fullName>
        <actions>
            <name>Client_Name_Update_V3</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If account has different last names, it will change the format from Last Name, First &amp; Spouse First to Last Name, First &amp; Spouse Last Name, First Name</description>
        <formula>AND(ISBLANK(Spouse_First_Name__c),
ISBLANK(Spouse_Last_Name__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
