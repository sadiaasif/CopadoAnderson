<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Assign_to_Amy</fullName>
        <field>OwnerId</field>
        <lookupValue>akasprzyk@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign to Amy</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email_Workaround</fullName>
        <field>E_Mail__c</field>
        <formula>Email</formula>
        <name>Email Workaround</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>First_Name</fullName>
        <field>First_Name_Hidden_for_Conversion__c</field>
        <formula>FirstName</formula>
        <name>First Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>GP_Update</fullName>
        <field>Grandparent_Campaign__c</field>
        <formula>Primary_Campaign__r.Parent_Campaign__c</formula>
        <name>GP Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Hubspot_Lead</fullName>
        <field>Recycled_Type__c</field>
        <literalValue>Hubspot</literalValue>
        <name>Hubspot Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Name</fullName>
        <field>Last_Name_Hidden_for_Conversion__c</field>
        <formula>LastName</formula>
        <name>Last Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Name_Convention</fullName>
        <field>Company</field>
        <formula>LastName  &amp; &quot;, &quot; &amp;  FirstName  &amp; &quot; &amp; &quot; &amp;  Spouse_s_First_Name__c</formula>
        <name>Lead Name Convention</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mailing_Allowed_No</fullName>
        <description>Sets Mailing Allowed to No</description>
        <field>Mailing_Allowed__c</field>
        <literalValue>No</literalValue>
        <name>Mailing Allowed - No</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mailing_Allowed_Yes</fullName>
        <description>Sets Mailing Allowed to Yes</description>
        <field>Mailing_Allowed__c</field>
        <literalValue>Yes</literalValue>
        <name>Mailing Allowed - Yes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mark_Do_Not_Call</fullName>
        <description>Sets Do Not Call to True</description>
        <field>DoNotCall</field>
        <literalValue>1</literalValue>
        <name>Mark Do Not Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>No_Spouse_Client_Name</fullName>
        <field>Company</field>
        <formula>LastName  &amp; &quot;, &quot; &amp;  FirstName  &amp;  Spouse_s_First_Name__c</formula>
        <name>No Spouse Client Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Number_of_Employees</fullName>
        <field>Number_of_Employees_Hidden__c</field>
        <formula>NumberOfEmployees</formula>
        <name>Number of Employees</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_change</fullName>
        <field>OwnerId</field>
        <lookupValue>boss@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Owner_change1</fullName>
        <field>OwnerId</field>
        <lookupValue>boss@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Owner change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Recycle_Lead</fullName>
        <field>Recycled_Type__c</field>
        <literalValue>Recycle</literalValue>
        <name>Recycle Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Revenue</fullName>
        <field>Annual_Revenue__c</field>
        <formula>AnnualRevenue</formula>
        <name>Revenue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_to_No</fullName>
        <field>Client_Signed_Up_for_AP_Event__c</field>
        <literalValue>No</literalValue>
        <name>Set to No</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_to_No_2</fullName>
        <field>Mailing_Allowed__c</field>
        <literalValue>No</literalValue>
        <name>Set to No 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Spouse_Last_Name</fullName>
        <field>Spouse_Last_Name__c</field>
        <formula>LastName</formula>
        <name>Spouse Last Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Timestamp_Field</fullName>
        <field>SQL_Date__c</field>
        <formula>NOW()</formula>
        <name>Timestamp Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Unmark_Do_Not_Call</fullName>
        <description>Sets Do Not Call to false</description>
        <field>DoNotCall</field>
        <literalValue>0</literalValue>
        <name>Unmark Do Not Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Account_Role</fullName>
        <field>Account_Roles__c</field>
        <literalValue>Primary Contact</literalValue>
        <name>Update Account Role</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Owner_Reminder</fullName>
        <field>Lead_Owner_Reminder__c</field>
        <formula>now()</formula>
        <name>Update Lead Owner Reminder</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_MLS</fullName>
        <field>Main_Lead_Source__c</field>
        <literalValue>Online Organic</literalValue>
        <name>Update MLS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>boss@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Priority</fullName>
        <field>Lead_Priority__c</field>
        <formula>1</formula>
        <name>Priority - 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_to_General</fullName>
        <field>RecordTypeId</field>
        <lookupValue>General_Lead</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update to General</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>akaCRM_RR__Send_to_Rotation_Update</fullName>
        <description>Update the Send to Rotation field to fire the LeadRotationEngineTrigger. Lead Assignment rules update lead owner after initial trigger. When a workflow updates a record, the trigger fires a second time.</description>
        <field>akaCRM_RR__Send_to_Rotation_Update__c</field>
        <literalValue>1</literalValue>
        <name>Send to Rotation Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>erica_te</fullName>
        <field>OwnerId</field>
        <lookupValue>kstephen@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>lead owner update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>lead_owner_update</fullName>
        <field>OwnerId</field>
        <lookupValue>boss@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>lead owner update</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_owner_offline</fullName>
        <field>OwnerId</field>
        <lookupValue>boss@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>update owner offline</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
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
        <fullName>AFS - Assign to Amy K%2E</fullName>
        <actions>
            <name>Assign_to_Amy</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Description</field>
            <operation>contains</operation>
            <value>A lead for AFS.</value>
        </criteriaItems>
        <description>Assigns leads to Amy K if created through form.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Add Account Role</fullName>
        <actions>
            <name>Update_Account_Role</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Account_Roles__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>DaScoopComposer__Notify Groove on Lead Created %28Managed%29</fullName>
        <actions>
            <name>DaScoopComposer__Notify_Groove</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <description>This WF rule can be activated if you want to notify Groove that a new lead was created. That way Groove can e.g. instantly import the lead to a Groove Flow that has auto import enabled (and meets the auto-import rules of that Flow).</description>
        <formula>ISNEW()</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Dani leads</fullName>
        <actions>
            <name>lead_owner_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Lead_Source__c</field>
            <operation>equals</operation>
            <value>Dani Johnson</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Dave Lindahl Supression</fullName>
        <actions>
            <name>Mailing_Allowed_No</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Mark_Do_Not_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OCS_Parent_Campaign__c</field>
            <operation>equals</operation>
            <value>Dave Lindahl AP Event Promotion</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>New Lead</value>
        </criteriaItems>
        <description>Prevents Leads in Dave Lindahl campaigns from being contacted for four months.</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Mailing_Allowed_Yes</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Unmark_Do_Not_Call</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Update_Priority</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>120</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Email Workaround</fullName>
        <actions>
            <name>Email_Workaround</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GP Campaign</fullName>
        <actions>
            <name>GP_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Primary_Campaign_Mirror__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Leads reassigned</fullName>
        <actions>
            <name>Owner_change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Primary_Campaign_Mirror__c</field>
            <operation>notEqual</operation>
            <value>Calendly,Elite Parent</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Lead_Source__c</field>
            <operation>notContain</operation>
            <value>Vertucci</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Description</field>
            <operation>notContain</operation>
            <value>A lead for AFS.</value>
        </criteriaItems>
        <description>All Leads sent to AA</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Lead</fullName>
        <actions>
            <name>First_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Lead_Name_Convention</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Number_of_Employees</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Revenue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Spouse_Last_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Spouse_s_First_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Lead - No Spouse</fullName>
        <actions>
            <name>No_Spouse_Client_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Spouse_s_First_Name__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Uses primary client&apos;s last name if spouse&apos;s last name field is null.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Nick Verttucci</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Lead_Source__c</field>
            <operation>contains</operation>
            <value>Nick Vertucci-Package</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Nick Vertucci</fullName>
        <actions>
            <name>erica_te</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Lead_Source__c</field>
            <operation>contains</operation>
            <value>Nick Vertucci-Package</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Organic Youtube</fullName>
        <actions>
            <name>Update_MLS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Created_By_Profile__c</field>
            <operation>notEqual</operation>
            <value>System Administrator,CEO &amp; Partners</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Original_Campaign_Source_Name__c</field>
            <operation>equals</operation>
            <value>Anderson Youtube Free SS,Clint Youtube Free SS</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Record Type</fullName>
        <actions>
            <name>Update_to_General</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>Nick Vertucci Bus Tour</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>SQL Timestamp</fullName>
        <actions>
            <name>Timestamp_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( Lead_Score__c ),
 OR(PRIORVALUE(Lead_Score__c) &lt; 75,
ISNULL(PRIORVALUE(Lead_Score__c)),
ISBLANK(PRIORVALUE(Lead_Score__c))
),
 Lead_Score__c &gt;= 75)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Reminder for Lead Owners</fullName>
        <actions>
            <name>Update_Lead_Owner_Reminder</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Update the Lead Owner Reminder on the leads assigned to specific users.</description>
        <formula>(isnew() || ischanged (OwnerId)) &amp;&amp; ( OwnerId = &apos;005U0000003q8mD&apos; || OwnerId = &apos;005U0000003q8mI&apos; || OwnerId = &apos;005U0000003q8m3&apos; || OwnerId = &apos;005U0000003p93W&apos; || OwnerId = &apos;005U0000003NYNv&apos; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Signed up for AP Event%2FMailing Allowed</fullName>
        <actions>
            <name>Set_to_No</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_to_No_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Main_Lead_Source__c</field>
            <operation>equals</operation>
            <value>Nick Vertucci-NVREA</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Website Consultation Form</fullName>
        <actions>
            <name>Update_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Campaign__c</field>
            <operation>equals</operation>
            <value>Website Consultation Form</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Website Offline Chat</fullName>
        <actions>
            <name>update_owner_offline</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Campaign__c</field>
            <operation>contains</operation>
            <value>Website Offline Chat</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>akaCRM_RR__Send to Rotation Update</fullName>
        <actions>
            <name>akaCRM_RR__Send_to_Rotation_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.akaCRM_RR__Send_to_Rotation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Update the Send to Rotation field to fire the LeadRotationEngineTrigger. Lead Assignment rules update lead owner after initial trigger. When a workflow updates a record, the trigger fires a second time.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>lead owner update</fullName>
        <actions>
            <name>Owner_change1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Lead_Source__c</field>
            <operation>contains</operation>
            <value>,Adwords,American Wealth,Amerifi,Association of Private Lenders,Bing,Chaikin Analytics,Clint&apos;s Blog,Crystal Han,Dani Johnson,Dan Noble,Dave Lindahl,Dave McShane,Don Pendleton,Elan Edwards,Existing Client,Facebook,Google,Internet Referral</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
