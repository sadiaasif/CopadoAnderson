<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Bookkeeping_Sale_NPS</fullName>
        <description>Bookkeeping Sale NPS Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Email2__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>NPS_Surveys/Bookkeeping_Sale</template>
    </alerts>
    <alerts>
        <fullName>Closed_Won_Pension_Alert</fullName>
        <ccEmails>tcraig@andersonadvisors.com</ccEmails>
        <description>Closed Won Pension Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>boss@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Pension_Emails/Traci_Alert</template>
    </alerts>
    <alerts>
        <fullName>Discount_Alert</fullName>
        <description>Discount Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>dgass@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/Discount_Alert</template>
    </alerts>
    <alerts>
        <fullName>Docusign_Payment_Email</fullName>
        <description>Docusign Payment Email</description>
        <protected>false</protected>
        <recipients>
            <field>Email2__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Platinum_Emails/DocuSign_Payment_Form</template>
    </alerts>
    <alerts>
        <fullName>Entity_Formation_NPS_Survey</fullName>
        <description>Entity Formation NPS Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Email2__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>NPS_Surveys/Entity_Formation</template>
    </alerts>
    <alerts>
        <fullName>Infinity_Decline_Email</fullName>
        <ccEmails>bwidener@andersonadvisors.com</ccEmails>
        <ccEmails>nfrates@andersonadvisors.com</ccEmails>
        <description>Infinity Decline Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>ppeery@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/Infinity_Decline_Email</template>
    </alerts>
    <alerts>
        <fullName>LeadAutoConvert</fullName>
        <description>LeadAutoConvert</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Unfiled_Public/New_Lead_Converted</template>
    </alerts>
    <alerts>
        <fullName>NPS_Opportunity_Testing</fullName>
        <description>Opportunity Testing</description>
        <protected>false</protected>
        <recipients>
            <field>Email2__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Opportunity_Survey_171221_205228</template>
    </alerts>
    <alerts>
        <fullName>Payment_Plan_Declined</fullName>
        <ccEmails>mpreseren@andersonadvisors.com</ccEmails>
        <description>Payment Plan Declined</description>
        <protected>false</protected>
        <recipients>
            <recipient>boss@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Opportunities_Emails/Payment_Plan_Decline</template>
    </alerts>
    <alerts>
        <fullName>Platinum_Decline_Email</fullName>
        <description>Platinum Decline Email</description>
        <protected>false</protected>
        <recipients>
            <field>Law_Coordinator_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/Platinum_Decline_Email</template>
    </alerts>
    <alerts>
        <fullName>Platinum_Sale_NPS_Survey</fullName>
        <description>Platinum Sale NPS Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Email2__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/Platinum_NPS</template>
    </alerts>
    <alerts>
        <fullName>Platinum_Transaction_Failed</fullName>
        <description>Platinum Transaction Failed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Unfiled_Public/Unapproved_Transaction_Mail</template>
    </alerts>
    <alerts>
        <fullName>RA_Change_Task_Email_Christian</fullName>
        <description>RA Change Task-Email Christian</description>
        <protected>false</protected>
        <recipients>
            <recipient>cabraham@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>srajagopalan@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Renewals/RA_Change_task_Alert</template>
    </alerts>
    <alerts>
        <fullName>Reminder_Of_Impending_Sale_Close_Date</fullName>
        <description>Reminder Of Impending Sale Close Date</description>
        <protected>false</protected>
        <recipients>
            <field>Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Opportunities_Emails/Sale_Opp_Close_Reminder</template>
    </alerts>
    <alerts>
        <fullName>Renewal_Sale_NPS_Survey</fullName>
        <description>Renewal Sale NPS Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Email2__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>NPS_Surveys/Renewal_Sale</template>
    </alerts>
    <fieldUpdates>
        <fullName>AS_Naming_Convention</fullName>
        <field>Name</field>
        <formula>TEXT(YEAR(DATEVALUE(CreatedDate)))+&quot;.&quot;+TEXT(MONTH(DATEVALUE(CreatedDate)))+&quot;.&quot; 
+TEXT(DAY(DATEVALUE(CreatedDate)))+&quot; -- &quot;+&quot;Anderson System Opportunity&quot;+&quot; -- &quot;+CreatedBy.FirstName+&quot; &quot;+CreatedBy.LastName</formula>
        <name>AS Naming Convention</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Acc_Yellow_Button</fullName>
        <field>YellowButton__c</field>
        <formula>&quot;Black Mamba&quot;</formula>
        <name>Acc Yellow Button</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Address</fullName>
        <field>ChargentSFA__Billing_Address__c</field>
        <formula>Account.BillingStreet</formula>
        <name>Address</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Amount</fullName>
        <field>Amount</field>
        <formula>Net_Transactions__c</formula>
        <name>Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Opp_Owner_to_Anderson_Advisors</fullName>
        <description>Assigns the owner of the opportunity to Anderson Advisors.</description>
        <field>OwnerId</field>
        <lookupValue>boss@andersonadvisors.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Opp Owner to Anderson Advisors</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Billing_First</fullName>
        <field>ChargentSFA__Billing_First__c</field>
        <formula>Account.First_Name__c</formula>
        <name>Billing First</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Bookkeeping_Amount</fullName>
        <field>Amount</field>
        <formula>Net_Transactions__c</formula>
        <name>Bookkeeping Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Capture_timestamp_On_Hold</fullName>
        <field>Date_Put_On_Hold__c</field>
        <formula>NOW()</formula>
        <name>Capture timestamp On Hold</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Platinum_Client_View_to_Blank</fullName>
        <field>Platinum_Client_View__c</field>
        <name>Change Platinum Client View to Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Stage_to_Partial_Payment</fullName>
        <field>StageName</field>
        <literalValue>Fulfillment/Partial Payment</literalValue>
        <name>Change Stage to Partial Payment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Charge_Amount</fullName>
        <field>ChargentSFA__Charge_Amount__c</field>
        <formula>35.00</formula>
        <name>Charge Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Charge_Date_Blank</fullName>
        <description>SCH-0041</description>
        <field>ChargentSFA__Charge_Date__c</field>
        <name>Charge Date = Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ChargentSFA__PartialPayment</fullName>
        <field>ChargentSFA__Payment_Received__c</field>
        <literalValue>Partial</literalValue>
        <name>Partial Payment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ChargentSFA__PaymentFull</fullName>
        <field>ChargentSFA__Payment_Received__c</field>
        <literalValue>Full</literalValue>
        <name>Payment Full</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ChargentSFA__Set_Manual_Charge_to_True</fullName>
        <description>This update will set the Chargent Manual Charge field to TRUE.</description>
        <field>ChargentSFA__Manual_Charge__c</field>
        <literalValue>1</literalValue>
        <name>Set Manual Charge to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ChargentSFA__UpdateChargeAmount</fullName>
        <field>ChargentSFA__Charge_Amount__c</field>
        <formula>ChargentSFA__Total__c -  ChargentSFA__Transaction_Total__c</formula>
        <name>Update Charge Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>City</fullName>
        <field>ChargentSFA__Billing_City__c</field>
        <formula>Account.BillingCity</formula>
        <name>City</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_QB_Error</fullName>
        <field>AVSFQB__QB_Error__c</field>
        <name>Clear QB Error</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_Date</fullName>
        <description>Updates Close Date when Stage is Closed Won.</description>
        <field>CloseDate</field>
        <formula>IF( 
First_Transaction__c&lt;&gt;NULL, datevalue(Last_Transaction__c), TODAY())</formula>
        <name>Close Won Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_Lost</fullName>
        <field>StageName</field>
        <literalValue>Closed Lost</literalValue>
        <name>Close Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_Lost_Pension_Sale</fullName>
        <description>Changes the stage of an opportunity to &quot;Close Lost&quot;</description>
        <field>StageName</field>
        <literalValue>Closed Lost</literalValue>
        <name>Close Lost Pension Sale</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_Lost</fullName>
        <description>Update Opportunity Stage to &apos;Closed Lost&apos;.</description>
        <field>StageName</field>
        <literalValue>Closed Lost</literalValue>
        <name>Closed Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_Lost_Date</fullName>
        <field>CloseDate</field>
        <formula>IF(
First_Transaction__c&lt;&gt;NULL, datevalue(First_Transaction__c), TODAY())</formula>
        <name>Closed Lost Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_Won</fullName>
        <description>Changes Opportunity stage to &apos;Closed Won&apos;.</description>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Corp_Headquarters_Naming_Convention</fullName>
        <field>Name</field>
        <formula>&apos;Corporate Headquarters Renewal&apos;</formula>
        <name>Corp Headquarters Naming Convention</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Country</fullName>
        <field>ChargentSFA__Billing_Country__c</field>
        <formula>Account.BillingCountry</formula>
        <name>Country</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Declined</fullName>
        <field>StageName</field>
        <literalValue>Declined-</literalValue>
        <name>Declined</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Declined_to_Closed_Won_Date</fullName>
        <description>Updates the date when the sale moves from Declined to Closed Won</description>
        <field>Out_of_Declined__c</field>
        <formula>TODAY()</formula>
        <name>Declined to Closed Won Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Discount_Workflow</fullName>
        <field>Discount_Workflow__c</field>
        <literalValue>1</literalValue>
        <name>Discount Workflow</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Effective_Date_Update</fullName>
        <field>Renewal_Effective_Date__c</field>
        <formula>DATE( 
YEAR(TODAY()) + 1, 
IF(MONTH(TODAY()) = 12, 1, MONTH(TODAY()) + 1), 1)</formula>
        <name>Effective Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Email2_Matches_Account</fullName>
        <description>Sets the Email2 field to match the Client Email on the account page. Provides an accurate email for the NPS Survey.</description>
        <field>Email2__c</field>
        <formula>Account.E_Mail__c</formula>
        <name>Email2 Matches Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>End_Date_Update</fullName>
        <field>Renewal_End_Date__c</field>
        <formula>DATE( 
YEAR(TODAY()) + 1, 
IF(MONTH(TODAY()) = 12, 1, MONTH(TODAY()) + 1), 1) - 1</formula>
        <name>End Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enter_Date</fullName>
        <field>Green_Corp_HQ_Date__c</field>
        <formula>TODAY()</formula>
        <name>Enter Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enter_the_date</fullName>
        <field>Sales_Rep_Entry_Date__c</field>
        <formula>TODAY()</formula>
        <name>Enter the date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Entity_Formation_Renewal_End_Date</fullName>
        <field>Renewal_End_Date__c</field>
        <formula>DATEVALUE(First_Transaction__c) + 365</formula>
        <name>Entity Formation - Renewal End Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fax</fullName>
        <field>ChargentSFA__Billing_Fax__c</field>
        <formula>Account.Fax</formula>
        <name>Fax</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fulfillment_Partial_Payment</fullName>
        <description>Force Fulfillment/Partial Payment</description>
        <field>StageName</field>
        <literalValue>Fulfillment/Partial Payment</literalValue>
        <name>Fulfillment / Partial Payment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Name</fullName>
        <field>ChargentSFA__Billing_Last__c</field>
        <formula>Account.Last_Name__c</formula>
        <name>Last Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source</fullName>
        <field>Lead_Source__c</field>
        <formula>TEXT(Account.Source__c)</formula>
        <name>Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Naming_Convention_NVREA_Free_JV_LLC</fullName>
        <field>Name</field>
        <formula>Campaign.Name</formula>
        <name>Naming Convention -- NVREA Free JV LLC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nonpayment</fullName>
        <field>Closed_Lost_Reason__c</field>
        <literalValue>Non Payment</literalValue>
        <name>Nonpayment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nullify_Account_Yellow_Button</fullName>
        <field>YellowButton__c</field>
        <name>Nullify Account Yellow Button</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PCV_PriorVal_Declined</fullName>
        <field>PCV_PriorVal__c</field>
        <formula>&quot;Declined&quot;</formula>
        <name>PCV PriorVal - Declined</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pay_Freq</fullName>
        <field>ChargentSFA__Payment_Frequency__c</field>
        <literalValue>Once</literalValue>
        <name>Pay Freq</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pay_Status</fullName>
        <field>ChargentSFA__Payment_Status__c</field>
        <name>Pay Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_End_Blank</fullName>
        <description>SCH-0041</description>
        <field>ChargentSFA__Payment_End_Date__c</field>
        <name>Payment End = Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Frequency</fullName>
        <field>ChargentSFA__Payment_Frequency__c</field>
        <literalValue>Monthly</literalValue>
        <name>Payment Frequency</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Frequency_Blank</fullName>
        <description>SCH-0041</description>
        <field>ChargentSFA__Payment_Frequency__c</field>
        <name>Payment Frequency = Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Received</fullName>
        <field>ChargentSFA__Payment_Received__c</field>
        <literalValue>Full</literalValue>
        <name>Payment Received</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Recurring</fullName>
        <description>If a renewal opportunity is created with the Chargent status field as &quot;Completed&quot; this will change it to &quot;Recurring&quot;.</description>
        <field>ChargentSFA__Payment_Status__c</field>
        <literalValue>Recurring</literalValue>
        <name>Payment Recurring</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Start_Blank</fullName>
        <description>SCH-0041</description>
        <field>ChargentSFA__Payment_Start_Date__c</field>
        <name>Payment Start = Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Start_Date</fullName>
        <field>ChargentSFA__Payment_Start_Date__c</field>
        <formula>today()</formula>
        <name>Payment Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Status</fullName>
        <field>ChargentSFA__Payment_Status__c</field>
        <literalValue>Recurring</literalValue>
        <name>Payment Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Status_Complete</fullName>
        <description>SCH-0041</description>
        <field>ChargentSFA__Payment_Status__c</field>
        <literalValue>Complete</literalValue>
        <name>Payment Status = Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Payment_Stop</fullName>
        <field>ChargentSFA__Payment_Stop__c</field>
        <literalValue>Unending</literalValue>
        <name>Payment Stop</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Phone</fullName>
        <field>ChargentSFA__Billing_Phone__c</field>
        <formula>Account.Mobile_Number__c</formula>
        <name>Phone</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Platinum_Amount</fullName>
        <field>Amount</field>
        <formula>Net_Transactions__c</formula>
        <name>Platinum Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Platinum_Client_View_None</fullName>
        <description>Designed to set Platinum Client View to Declined. Changed to &quot;None&quot; because &quot;Declined&quot; wasn&apos;t kicking people out of Platinum.</description>
        <field>Platinum_Client_View__c</field>
        <name>Platinum Client View None</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Platinum_Plan</fullName>
        <field>Current_Platinum_Membership__c</field>
        <literalValue>1</literalValue>
        <name>Platinum Plan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Platinum_Sale_Name</fullName>
        <field>Name</field>
        <formula>CASE(Platinum_Subscription__c,
&quot;Dani Johnson&quot;, &quot;Platinum Subscription - Dani Johnson&quot;,
&quot;Tax Team&quot;, &quot;Tax Team Subscription&quot;,
&quot;Platinum Elite&quot;, &quot;Platinum Elite Subscription&quot;,
&quot;Platinum Subscription&quot;)</formula>
        <name>Platinum Sale Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Platinum_Type</fullName>
        <field>Platinum_Subscription__c</field>
        <name>Platinum Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_PCV_PriorVal</fullName>
        <field>PCV_PriorVal__c</field>
        <name>Remove PCV PriorVal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Renewal_Effective_Date_Blank</fullName>
        <field>Renewal_Effective_Date__c</field>
        <name>Renewal Effective Date Blank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Renewal_End_Date</fullName>
        <field>Renewal_End_Date__c</field>
        <name>Renewal End Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Generate_to_Invoice</fullName>
        <description>Vertiba OnDemand, 8/29/2014, SR-00002164, Generate is set to &quot;Invoice&quot;</description>
        <field>AVSFQB__Generate_Object__c</field>
        <literalValue>Invoice</literalValue>
        <name>Set Generate to Invoice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Source</fullName>
        <field>Web_Source__c</field>
        <formula>Account.Web_Source__c</formula>
        <name>Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_Update</fullName>
        <field>StageName</field>
        <literalValue>Recycled</literalValue>
        <name>Stage Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_First_Update_Timestamp</fullName>
        <field>All_Services_First_Update__c</field>
        <formula>NOW()</formula>
        <name>Status First Update Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Timestamp_Field</fullName>
        <field>QA_Audit_Completed_Date__c</field>
        <formula>Today()</formula>
        <name>Timestamp Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Today_45</fullName>
        <field>CloseDate</field>
        <formula>TODAY() + 45</formula>
        <name>Today + 45</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Box</fullName>
        <field>Made_By_Trigger__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Unlimited_LLC_Fulfillment</fullName>
        <field>Name</field>
        <formula>IF(Total_Filing_Fees__c&gt;0,
TEXT(YEAR(DATEVALUE(CreatedDate)))+&quot;.&quot;+TEXT(MONTH(DATEVALUE(CreatedDate)))+&quot;.&quot; +TEXT(DAY(DATEVALUE(CreatedDate)))+&quot; -- &quot;+TEXT(LLC_UNL__c)+&quot; &quot;+&quot;Unlimited LLC Fulfillment + FF&quot;,
TEXT(YEAR(DATEVALUE(CreatedDate)))+&quot;.&quot;+TEXT(MONTH(DATEVALUE(CreatedDate)))+&quot;.&quot; +TEXT(DAY(DATEVALUE(CreatedDate)))+&quot; -- &quot;+TEXT(LLC_UNL__c)+&quot; &quot;+&quot;Unlimited LLC Fulfillment&quot;)</formula>
        <name>Unlimited LLC Fulfillment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Assigned_CSR_Email</fullName>
        <field>Law_Coordinator_Email__c</field>
        <formula>CASE( Account.Assigned_CSR__c, 
&quot;Alexandria Lessard&quot;, &quot;alessard@andersonadvisors.com&quot;, 
&quot;Amanda Dybas&quot;, &quot;adybas@andersonadvisors.com&quot;, 
&quot;Ambria Tibbs&quot;, &quot;atibbs@andersonadvisors.com&quot;, 
&quot;Antoinette Abernathy&quot;, &quot;aabernathy@andersonadvisors.com&quot;, 
&quot;Auriana Duffy&quot;, &quot;aduffy@andersonadvisors.com&quot;, 
&quot;Crystal Smerdel&quot;, &quot;csmerdel@andersonadvisors.com&quot;, 
&quot;Deborah Lewis&quot;, &quot;dlewis@andersonadvisors.com&quot;, 
&quot;Delma Sobers&quot;, &quot;dsobers@andersonadvisors.com&quot;, 
&quot;Erica Terrell&quot;, &quot;eterrell@andersonadvisors.com&quot;, 
&quot;Fallon Williams&quot;, &quot;fwilliams@andersonadvisors.com&quot;, 
&quot;Greg Coughlan&quot;, &quot;gcoughlan@andersonadvisors.com&quot;, 
&quot;Joseph Sacco&quot;, &quot;jsacco@andersonadvisors.com&quot;, 
&quot;Kristy McElwain&quot;, &quot;kmcelwain@andersonadvisors.com&quot;, 
&quot;Kyle Burgess&quot;, &quot;kburgess@andersonadvisors.com&quot;, 
&quot;Matthew Smidowicz&quot;, &quot;msmidowicz@andersonadvisors.com&quot;, 
&quot;Mayra De Arcos&quot;, &quot;mdearcos@andersonadvisors.com&quot;, 
&quot;Michelle Enriquez&quot;, &quot;menriquez@andersonadvisors.com&quot;, 
&quot;Roberta Hubbell&quot;, &quot;rhubbell@andersonadvisors.com&quot;, 
&quot;Savannah Wallace&quot;, &quot;savannah.wallace@andersonadvisors.com&quot;, 
&quot;Sydney Nichols&quot;, &quot;snichols@andersonadvisors.com&quot;, 
&quot;Whitney Ronnander&quot;, &quot;wronnander@andersonadvisors.com&quot;,
&quot;Team 1 - 1&quot;, &quot;swinter@andersonadvisors.com&quot;,
&quot;Team 1 - 2&quot;, &quot;swinter@andersonadvisors.com&quot;,
&quot;Team 1 - 3&quot;, &quot;swinter@andersonadvisors.com&quot;,
&quot;Team 2 - 1&quot;, &quot;cbrown@andersonadvisors.com&quot;,
&quot;Team 2 - 2&quot;, &quot;cbrown@andersonadvisors.com&quot;,
&quot;Team 3 - 1&quot;, &quot;eterrell@andersonadvisors.com&quot;,
&quot;Team 3 - 2&quot;, &quot;eterrell@andersonadvisors.com&quot;,
&quot;Team 3 - 3&quot;, &quot;eterrell@andersonadvisors.com&quot;,
&quot;Team 3 - 4&quot;, &quot;eterrell@andersonadvisors.com&quot;,
&quot;Team 3 - 5&quot;, &quot;eterrell@andersonadvisors.com&quot;,
&quot;Team 4 - 1&quot;, &quot;mborden@andersonadvisors.com&quot;,
&quot;Team 4 - 2&quot;, &quot;mborden@andersonadvisors.com&quot;,
&quot;Team 4 - 3&quot;, &quot;mborden@andersonadvisors.com&quot;,
&quot;Team 4 - 4&quot;, &quot;mborden@andersonadvisors.com&quot;,
&quot;Team 4 - 5&quot;, &quot;mborden@andersonadvisors.com&quot;,
NULL)</formula>
        <name>Update Assigned CSR Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Close_Date_Minus_1</fullName>
        <description>Close Date = Contract Effective Date - 1</description>
        <field>CloseDate</field>
        <formula>Renewal_Effective_Date__c - 1</formula>
        <name>Update Close Date Minus 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_Closed_Lost</fullName>
        <field>Closed_Lost_Date__c</field>
        <formula>today()</formula>
        <name>Update Date Closed Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_PCV_to_Plat</fullName>
        <field>Platinum_Client_View__c</field>
        <literalValue>Platinum</literalValue>
        <name>Update PCV to Plat</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Payment_Status</fullName>
        <field>Payment_Status_Prior_Value__c</field>
        <formula>PRIORVALUE(ChargentSFA__Payment_Status__c)</formula>
        <name>Update Payment Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Platinum_Type_1</fullName>
        <field>Platinum_Type__c</field>
        <literalValue>Platinum</literalValue>
        <name>Update Platinum Type 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Platinum_Type_3</fullName>
        <field>Platinum_Type__c</field>
        <literalValue>Platinum</literalValue>
        <name>Update Platinum Type 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Sales_Rep_Email</fullName>
        <field>Rep_Email__c</field>
        <formula>Sales_Rep__r.User__r.Email</formula>
        <name>Update Sales Rep Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Senior_Advisor</fullName>
        <description>Updates the Senior Advisor on the account.</description>
        <field>Senior_Advisor__c</field>
        <formula>Sales_Rep__r.First_Name__c &amp; &quot; &quot; &amp; Sales_Rep__r.Last_Name__c</formula>
        <name>Update Senior Advisor</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Timestamp_Rev10000</fullName>
        <field>Revenue_1000__c</field>
        <formula>Last_Transaction__c</formula>
        <name>Update Timestamp Rev10000</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>User_First_and_Last_Name</fullName>
        <field>Closed_By__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp; $User.LastName</formula>
        <name>User First and Last Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Zip</fullName>
        <field>ChargentSFA__Billing_Zip__c</field>
        <formula>Account.BillingPostalCode</formula>
        <name>Zip</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>All Services Status First Update</fullName>
        <actions>
            <name>Status_First_Update_Timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED(All_Services_Status__c),
TEXT(PRIORVALUE(All_Services_Status__c)) = &apos;New&apos;
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign Opp Owner to Anderson Advisors</fullName>
        <actions>
            <name>Assign_Opp_Owner_to_Anderson_Advisors</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>For State and Standard renewal sales, assign the Opportunity Owner to Anderson Advisors</description>
        <formula>AND(
$User.Id &lt;&gt; &quot;0050B000006okJa&quot;,
OwnerId &lt;&gt; &quot;005U0000001DC1y&quot;,
OR( 
RecordTypeId = &quot;012U0000000DhZz&quot;,
RecordTypeId = &quot;012U0000000DhZQ&quot;
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Bookkeeping Subscription Creation</fullName>
        <actions>
            <name>ChargentSFA__Set_Manual_Charge_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Closed_Won</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Received</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Stop</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Bookkeeping Subscription</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Override_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>ChargentSFA__Full Payment</fullName>
        <actions>
            <name>ChargentSFA__PaymentFull</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Amount =  ChargentSFA__Transaction_Total__c</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ChargentSFA__Partial Payment</fullName>
        <actions>
            <name>ChargentSFA__PartialPayment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(Amount &gt;  ChargentSFA__Transaction_Total__c, ChargentSFA__Transaction_Total__c &gt; 0)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ChargentSFA__Payment Status Recurring</fullName>
        <actions>
            <name>ChargentSFA__Set_Manual_Charge_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.ChargentSFA__Payment_Status__c</field>
            <operation>equals</operation>
            <value>Recurring</value>
        </criteriaItems>
        <description>This rule fires when the Chargent Payment Status field equals &quot;Recurring.&quot;  Use this rule to set any values that you want defined every time the value in the Payment Status field is recurring.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>ChargentSFA__Update Charge Amount</fullName>
        <actions>
            <name>ChargentSFA__UpdateChargeAmount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.ChargentSFA__Manual_Charge__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Close Date %2B 45 Days</fullName>
        <actions>
            <name>Today_45</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Created_From_Lead__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets the close date of opportunities created by leads to 45 days out.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Close Lost Pension Sale</fullName>
        <active>true</active>
        <description>Creates a time based workflow that Close Losts a pension sale 7 hours before the Renewal End Date if it&apos;s not already Closed Won.</description>
        <formula>AND( 
RecordTypeId = &quot;012U0000000g4st&quot; , 
NOT(ISPICKVAL( StageName , &quot;Closed Won&quot;)), 
NOT(ISPICKVAL( StageName , &quot;Fulfillment/Partial Payment&quot;)), 
TODAY() &lt; Renewal_End_Date__c 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Close_Lost_Pension_Sale</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Opportunity.Renewal_End_Date__c</offsetFromField>
            <timeLength>-7</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Collected %3E 1000</fullName>
        <actions>
            <name>Update_Timestamp_Rev10000</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR( AND(ISBLANK(Revenue_1000__c), 
        ChargentSFA__Transaction_Total__c &gt;= 1000), 
    AND(ISCHANGED(ChargentSFA__Transaction_Total__c)
        ,ChargentSFA__Transaction_Total__c &gt;= 1000)
   )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Completed to Recurring</fullName>
        <actions>
            <name>Payment_Recurring</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If a renewal opportunity is created with the Chargent status field as &quot;Completed&quot; this will change it to &quot;Recurring&quot;. 
Works in Conjuction with the OpportunityTriggerHandler to create recurring billing for renewals.</description>
        <formula>AND( 
OR( 
RecordTypeId = &quot;012U0000000DhZz&quot; , 
RecordTypeId = &quot;012U0000000DhZQ&quot;), 
ISPICKVAL(ChargentSFA__Payment_Status__c, &quot;Complete&quot;) 
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Corp Headquarters Naming Convention</fullName>
        <actions>
            <name>Corp_Headquarters_Naming_Convention</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Standard Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Nexus_Renewal__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Declined Platinum Updates Account</fullName>
        <actions>
            <name>PCV_PriorVal_Declined</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Platinum_Client_View_None</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Declined-</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Platinum Subscription</value>
        </criteriaItems>
        <description>Set the account field to None when Platinum is Declined</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Discount alert %3E20%25</fullName>
        <actions>
            <name>Discount_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Discount_Workflow</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Discount_Percentage__c</field>
            <operation>greaterOrEqual</operation>
            <value>20</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Fulfillment/Partial Payment,Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Discount_Workflow__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Entity Formation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CreatedDate</field>
            <operation>greaterOrEqual</operation>
            <value>9/1/2016</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Discount__c</field>
            <operation>greaterThan</operation>
            <value>200</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Filing_Fees_Audit__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Entity Formation -- Renewal Eff%2FEnd</fullName>
        <actions>
            <name>Entity_Formation_Renewal_End_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Entity Formation</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Force Closed Lost - Non Subscription</fullName>
        <actions>
            <name>Closed_Lost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Force Opportunity stage &apos;Closed Lost&apos; when &apos;Refunded Amount&apos; equals &apos;Balance Due&apos;. OR Renewal</description>
        <formula>OR(
AND(
NOT(RecordType.Id = &quot;012U0000000g6JK&quot;), NOT(RecordType.Id = &quot;012U0000000g5s4&quot;),
ABS(Refunded_Amount__c)  =  ChargentSFA__Balance_Due__c, ChargentSFA__Balance_Due__c  = Amount, Amount &gt;0, ChargentSFA__Transaction_Count__c&gt; 0, Override_Automation__c = False),
AND(
OR(
RecordType.Id = &quot;012U0000000g6JK&quot;, RecordType.Id = &quot;012U0000000g5s4&quot;),
OR(
ISPICKVAL(ChargentSFA__Payment_Status__c, &apos;Stopped&apos;), 
ISPICKVAL(ChargentSFA__Payment_Status__c, &apos;Complete&apos;))
))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Force Closed Won</fullName>
        <actions>
            <name>Closed_Won</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Change Opportunity to &apos;Closed Won&apos; and update &apos;Close Date&apos; to current date when there is at least one transaction, the &apos;Balance Due&apos; equals zero and &apos;Amount&apos; is greater than zero.</description>
        <formula>OR(
AND(
NOT(RecordType.Id = &quot;012U0000000g6JK&quot;), NOT(RecordType.Id = &quot;012U0000000g5s4&quot;), NOT(ISPICKVAL(StageName, &quot;Refund Requested&quot;)), ChargentSFA__Transaction_Count__c&gt;0, ChargentSFA__Balance_Due__c=0, Amount&gt;0),
AND( 
OR( 
RecordType.Id = &quot;012U0000000g6JK&quot;, RecordType.Id = &quot;012U0000000g5s4&quot;), 
ISPICKVAL(ChargentSFA__Payment_Status__c, &apos;Recurring&apos;) 
) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Force Fulfillment%2FPartial Payment</fullName>
        <actions>
            <name>Fulfillment_Partial_Payment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>SCH-0073
Change Opportunity Status to &apos;Fulfillment/Partial Payment&apos; when &apos;Balance Due&apos; is greater than zero, &apos;Amount&apos; is not equal to &apos;Balance Due&apos; and &apos;Transaction Count&apos; is greater than zero.</description>
        <formula>ROUND(ChargentSFA__Balance_Due__c,0)  &gt; 0 &amp;&amp; 
 ROUND(Amount,2)  &lt;&gt;  ROUND(ChargentSFA__Balance_Due__c,2)  &amp;&amp; 
 ChargentSFA__Transaction_Count__c  &gt; 0</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Force Partial Payment</fullName>
        <actions>
            <name>Change_Stage_to_Partial_Payment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISCHANGED( ChargentSFA__Transaction_Total__c),
 ChargentSFA__Transaction_Total__c &gt; 0,
PRIORVALUE(ChargentSFA__Transaction_Total__c) = 0,
ChargentSFA__Transaction_Total__c &lt; Amount
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Green Corp HQ</fullName>
        <actions>
            <name>Enter_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Vertucci_Fulfillment_Count__c</field>
            <operation>notEqual</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Green_Corp_HQ_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Enters a date on the account page when a sale is closed won with Vertucci fulfillment items.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Infinity Decline Email</fullName>
        <actions>
            <name>Infinity_Decline_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Declined-</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Infinity Subscription</value>
        </criteriaItems>
        <description>Sends an email to Patti when an infinity subscription is declined asking her to touch base with the client.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Infinity%2FPlatinum Sub Error</fullName>
        <actions>
            <name>Declined</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.ChargentSFA__Payment_Status__c</field>
            <operation>equals</operation>
            <value>Error</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Platinum Subscription,Bookkeeping Subscription,Infinity Subscription</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Naming Convention -- NVREA Free JV LLC</fullName>
        <actions>
            <name>Naming_Convention_NVREA_Free_JV_LLC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CampaignId</field>
            <operation>equals</operation>
            <value>NVREA Free JV LLC</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Deal</fullName>
        <actions>
            <name>Lead_Source</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Source</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Oppurtunity</fullName>
        <actions>
            <name>Address</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Billing_First</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>City</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Country</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Fax</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Phone</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Zip</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Opp Closed Won - Clear Recurring Billing</fullName>
        <actions>
            <name>Charge_Date_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_End_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Frequency_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Start_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Status_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>State Renewal,Standard Renewal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.ChargentSFA__Payment_Status__c</field>
            <operation>equals</operation>
            <value>Recurring</value>
        </criteriaItems>
        <description>SCH-0041</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Plat Closed Won After Declined</fullName>
        <actions>
            <name>Declined_to_Closed_Won_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Remove_PCV_PriorVal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_PCV_to_Plat</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates values when a Platinum sales comes back from Declined</description>
        <formula>AND(
ISPICKVAL( StageName , &quot;Closed Won&quot;),
ISPICKVAL(PRIORVALUE( StageName ), &quot;Declined-&quot;),
Name = &quot;Platinum Subscription&quot;,
RecordType.Id = &quot;012U0000000g5s4&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Platinum %26 Bookkeeping Subscription - no override</fullName>
        <actions>
            <name>Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Platinum Subscription,Bookkeeping Subscription</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Platinum Decline Email</fullName>
        <actions>
            <name>Platinum_Decline_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Assigned_CSR_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Declined-</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Platinum Subscription</value>
        </criteriaItems>
        <description>Sends an email to the CSR when a platinum subscription is declined asking them to touch base with the client.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Platinum Subscription</fullName>
        <actions>
            <name>Charge_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Received</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Platinum_Sale_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Renewal_End_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Platinum Subscription</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Override_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Platinum Subscription Creation - Non Tax Team</fullName>
        <actions>
            <name>ChargentSFA__Set_Manual_Charge_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Closed_Won</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Frequency</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Received</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Payment_Stop</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Renewal_Effective_Date_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Platinum Subscription</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Override_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>QA Audit Completed Date</fullName>
        <actions>
            <name>Timestamp_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.QA_Audit_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Remove Account Platinum subscription</fullName>
        <actions>
            <name>Change_Platinum_Client_View_to_Blank</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Platinum Subscription</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Renewal Update Close Date -- Qualification</fullName>
        <actions>
            <name>Update_Close_Date_Minus_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Close Date for renewals to one day prior to contract effective date.</description>
        <formula>AND(
OR( 
RecordTypeId = &quot;012U0000000DhZQ&quot;, RecordTypeId = &quot;012U0000000DhZz&quot;, RecordTypeId = &quot;012U0000000g4st&quot;),
 (CloseDate -1  &lt;&gt;  Renewal_Effective_Date__c ),
 ISPICKVAL(StageName, &quot;Qualification&quot;)
 )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Sales Rep is changed</fullName>
        <actions>
            <name>Enter_the_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
NOT(ISBLANK( Sales_Rep__c )),
ISBLANK( Sales_Rep_Entry_Date__c ),
ISCHANGED( Sales_Rep__c )
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Sales Rep to Senior Advisor</fullName>
        <actions>
            <name>Update_Senior_Advisor</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>When a sale of the appropriate record type is Closed Won, updates the Senior Advisor field on the account to page to the Sales Rep of the Closed Won sale.</description>
        <formula>AND( 
OR( 
RecordTypeId = &quot;012U0000000DFSx&quot;, 
RecordTypeId = &quot;0120B000000N8E5&quot;, 
RecordTypeId = &quot;0120B000000QwAn&quot;, 
RecordTypeId = &quot;012U0000000g4st&quot;, 
RecordTypeId = &quot;012U0000000DFUy&quot;), 
ISPICKVAL(StageName, &quot;Closed Won&quot;) 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stage On Hold</fullName>
        <actions>
            <name>Capture_timestamp_On_Hold</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISCHANGED(  Lead_Status__c  ),
 ISPICKVAL(Lead_Status__c, &apos;On Hold&apos;) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Unlimited LLC Fulfillment Naming Convention</fullName>
        <actions>
            <name>Unlimited_LLC_Fulfillment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>Entity Formation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.LLC_UNL__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.ChargentSFA__Balance_Due__c</field>
            <operation>notEqual</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Made_by_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Acc Yellow Button %28Into Partial%29</fullName>
        <actions>
            <name>Acc_Yellow_Button</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Fulfillment/Partial Payment</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YellowButton__c</field>
            <operation>equals</operation>
            <value>Black Mamba</value>
        </criteriaItems>
        <description>Used to denote partial titanium payments with a yellow icon.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Acc Yellow Button %28Out of Partial%29</fullName>
        <actions>
            <name>Nullify_Account_Yellow_Button</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>notEqual</operation>
            <value>Fulfillment/Partial Payment</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.YellowButton__c</field>
            <operation>notEqual</operation>
            <value>Black Mamba</value>
        </criteriaItems>
        <description>Used to denote partial titanium payments with a yellow icon.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Close Lost Date</fullName>
        <actions>
            <name>Closed_Lost_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Date_Closed_Lost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Close Won Date</fullName>
        <actions>
            <name>Close_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>User_First_and_Last_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Email2</fullName>
        <actions>
            <name>Email2_Matches_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the email field on the opportunity for the NPS Survey.</description>
        <formula>AND( OR( RecordType.Id = &quot;012U0000000DhZQ&quot;,  RecordType.Id = &quot;012U0000000DhZz&quot;, RecordType.Id = &quot;012U0000000DFSx&quot;, RecordType.Id = &quot;012U0000000g5s4&quot;, RecordType.Id = &quot;012U0000000g6JK&quot;, RecordType.Id = &quot;012U0000000g5X1&quot; ), OR( ISBLANK(Email2__c),  Email2__c  &lt;&gt; Account.E_Mail__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Rep Email</fullName>
        <actions>
            <name>Update_Sales_Rep_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates &quot;Rep Email&quot; Field on Opportunities with Sales Rep information.</description>
        <formula>OR(
AND(ISNEW(),NOT(ISBLANK( Sales_Rep__c ))),
ISCHANGED(Sales_Rep__c)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Senior Advisor on Creation</fullName>
        <actions>
            <name>Update_Senior_Advisor</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>If a sale is created on the account and there are no other closed sales of the correct record types this workflow will populate the Senior Advisor field on the account page.</description>
        <formula>AND( 
OR( 
RecordTypeId = &quot;012U0000000DFSx&quot;, 
RecordTypeId = &quot;0120B000000N8E5&quot;, 
RecordTypeId = &quot;0120B000000QwAn&quot;, 
RecordTypeId = &quot;012U0000000g4st&quot;, 
RecordTypeId = &quot;012U0000000DFUy&quot;),
ISPICKVAL(Account.Senior_Advisor_Picklist__c,&apos;&apos;), 
ISBLANK(  Account.First_Closed_Sale_Date__c ), 
NOT(ISPICKVAL(StageName, &quot;Closed Won&quot;)))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Platinum_Payment_Declined</fullName>
        <assignedToType>partnerUser</assignedToType>
        <description>Platinum Subscription payment failed, please follow up with client.  

If Platinum is not wanted, change field &apos;Payment Status&apos; to &apos;Stopped&apos;.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Platinum Payment Declined</subject>
    </tasks>
</Workflow>
