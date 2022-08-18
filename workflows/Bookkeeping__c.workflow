<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_Blanca_Review</fullName>
        <ccEmails>blemus@andersonadvisors.com</ccEmails>
        <description>Old Alert - Blanca Review</description>
        <protected>false</protected>
        <recipients>
            <recipient>boss@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Bookkeeping/Alert_Bookkeeping_Reviewer_on_Review</template>
    </alerts>
    <alerts>
        <fullName>Alert_Bookkeeper_Reviewer</fullName>
        <description>Bookkeeping Email - Record - Bookkeeper Reviewer Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Bookkeeping_Reviewer_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Bookkeeping/Alert_Bookkeeping_Reviewer</template>
    </alerts>
    <alerts>
        <fullName>Bookkeeping_Records_NPS_Survey</fullName>
        <description>Bookkeeping Records NPS Survey</description>
        <protected>false</protected>
        <recipients>
            <field>NPS_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>info@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>simplesurvey__Simple_Survey/BK_NPS</template>
    </alerts>
    <alerts>
        <fullName>Client_Unresponsive_Email</fullName>
        <description>Client Email - Record - Client Unresponsive</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Client_Unresponsive</template>
    </alerts>
    <alerts>
        <fullName>Client_Unresponsive_Email_2</fullName>
        <description>Client Email - Record - Client Unresponsive Email Address 2</description>
        <protected>false</protected>
        <recipients>
            <field>Second_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Client_Unresponsive</template>
    </alerts>
    <alerts>
        <fullName>Client_Unresponsive_Email_3</fullName>
        <description>Client Email - Record - Client Unresponsive Email GiGi</description>
        <protected>false</protected>
        <recipients>
            <recipient>webteam@andersonadvisors.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Client_Unresponsive</template>
    </alerts>
    <alerts>
        <fullName>Draft_Sent_Email</fullName>
        <description>Client Email - Record - Draft Sent Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Draft_Sent_Email</template>
    </alerts>
    <alerts>
        <fullName>Draft_Sent_Email_2</fullName>
        <description>Client Email - Record - Draft Sent Email 2</description>
        <protected>false</protected>
        <recipients>
            <field>Second_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Draft_Sent_Email</template>
    </alerts>
    <alerts>
        <fullName>Missing_Info_Email</fullName>
        <description>Client Email - Record - Missing Info Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Missing_Info_Email</template>
    </alerts>
    <alerts>
        <fullName>Missing_Info_Email_2</fullName>
        <description>Client Email - Record - Missing Info Email 2</description>
        <protected>false</protected>
        <recipients>
            <field>Second_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Missing_Info_Email</template>
    </alerts>
    <alerts>
        <fullName>Send_Completed_Email</fullName>
        <description>Client Email - Record - Send Completed Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Completed_Email</template>
    </alerts>
    <alerts>
        <fullName>Send_Completed_Email_2</fullName>
        <description>Client Email - Record - Send Completed Email 2</description>
        <protected>false</protected>
        <recipients>
            <field>Second_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Bookkeeping/Completed_Email</template>
    </alerts>
    <alerts>
        <fullName>Send_Financials_Email</fullName>
        <description>Bookkeeping Email - Record - Send Financials Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Bookkeeper_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Bookkeeping/Alert_BK</template>
    </alerts>
    <alerts>
        <fullName>Tells_BK_and_Jr_BK_of_Review_Notes</fullName>
        <description>Bookkeeping Email - Record - BK and Jr. BK of Review Notes Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Bookkeeper_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Bookkeeping/Alert_BK_and_Jr_BK</template>
    </alerts>
    <alerts>
        <fullName>Tells_BK_and_Jr_BK_of_Review_Notes_2</fullName>
        <description>Bookkeeping Email - Record - BK and Jr. BK of Review Notes 2 Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Jr_Bookkeeper_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Bookkeeping/Alert_BK_and_Jr_BK</template>
    </alerts>
    <fieldUpdates>
        <fullName>Check_Repeat_these_books</fullName>
        <field>Repeat_these_books__c</field>
        <literalValue>1</literalValue>
        <name>Check Repeat these books</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Edit_Box</fullName>
        <field>Edit_Box__c</field>
        <literalValue>1</literalValue>
        <name>Edit Box</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>End_Month_Box_True</fullName>
        <field>End_Month_Box__c</field>
        <literalValue>1</literalValue>
        <name>End Month Box True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enter_Stopped_Services_Date</fullName>
        <field>Stopped_Services_Date__c</field>
        <formula>TODAY()</formula>
        <name>Enter Stopped Services Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>New_Month_True</fullName>
        <description>Sets the new month field to true.</description>
        <field>Month__c</field>
        <literalValue>1</literalValue>
        <name>New Month True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_Stopped_Services_Date</fullName>
        <field>Stopped_Services_Date__c</field>
        <name>Remove Stopped Services Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_NPS_email_to_client_emali</fullName>
        <field>NPS_Email__c</field>
        <formula>Client_Name__r.E_Mail__c</formula>
        <name>Set NPS email to client emali</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Recurrence_Trigger_to_True</fullName>
        <description>Triggers the books to repeat.</description>
        <field>Recurrence_Trigger__c</field>
        <literalValue>1</literalValue>
        <name>Set Recurrence Trigger to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Repeat_these_Books</fullName>
        <field>Repeat_these_books__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Repeat these Books</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_BK_Object_Comments</fullName>
        <field>Comments__c</field>
        <formula>TEXT(Today()) + &apos; - &apos; + $User.LastName + &apos; - &apos; + New_Comments__c + BR() + Comments__c</formula>
        <name>Update BK Object Comments</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Bookkeeping Email - Record -  to Reviewer</fullName>
        <actions>
            <name>Alert_Bookkeeper_Reviewer</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Emails Reviewer that the Bookkeeping record is in review.</description>
        <formula>AND(ISBLANK(Set_of_Books__c), 
OR(
AND( ISCHANGED(Jan_Bookkeeping_Stages__c ), 
ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Feb_Bookkeeping_Stages__c ), 
ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Mar_Bookkeeping_Stages__c ), 
ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Apr_Bookkeeping_Stages__c ), 
ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(May_Bookkeeping_Stages__c ), 
ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Jun_Bookkeeping_Stages__c ), 
ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Jul_Bookkeeping_Stages__c ), 
ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Aug_Bookkeeping_Stages__c ), 
ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Sep_Bookkeeping_Stages__c ), 
ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Oct_Bookkeeping_Stages__c ), 
ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Nov_Bookkeeping_Stages__c ), 
ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Dec_Bookkeeping_Stages__c ), 
ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Review&quot;)) 
))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Bookkeeping Email - Record - Review Notes to BK%2FJr BK</fullName>
        <actions>
            <name>Tells_BK_and_Jr_BK_of_Review_Notes</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Tells_BK_and_Jr_BK_of_Review_Notes_2</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Emails BK / Jr. Bk when the Stage goes into review notes.</description>
        <formula>AND(ISBLANK(Set_of_Books__c),
OR( 
AND( ISCHANGED(Jan_Bookkeeping_Stages__c ), 
ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Feb_Bookkeeping_Stages__c ), 
ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Mar_Bookkeeping_Stages__c ), 
ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Apr_Bookkeeping_Stages__c ), 
ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(May_Bookkeeping_Stages__c ), 
ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Jun_Bookkeeping_Stages__c ), 
ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Jul_Bookkeeping_Stages__c ), 
ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Aug_Bookkeeping_Stages__c ), 
ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Sep_Bookkeeping_Stages__c ), 
ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Oct_Bookkeeping_Stages__c ), 
ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Nov_Bookkeeping_Stages__c ), 
ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Review Notes&quot;)), 
AND( ISCHANGED(Dec_Bookkeeping_Stages__c ), 
ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Review Notes&quot;)) 
))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Bookkeeping Email - Record - Send Financials to BK</fullName>
        <actions>
            <name>Send_Financials_Email</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Emails BK when the Stage goes into Send Financials.</description>
        <formula>AND(ISBLANK(Set_of_Books__c),
OR( 
AND( ISCHANGED(Jan_Bookkeeping_Stages__c ), 
ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Feb_Bookkeeping_Stages__c ), 
ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Mar_Bookkeeping_Stages__c ), 
ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Apr_Bookkeeping_Stages__c ), 
ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(May_Bookkeeping_Stages__c ), 
ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Jun_Bookkeeping_Stages__c ), 
ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Jul_Bookkeeping_Stages__c ), 
ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Aug_Bookkeeping_Stages__c ), 
ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Sep_Bookkeeping_Stages__c ), 
ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Oct_Bookkeeping_Stages__c ), 
ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Nov_Bookkeeping_Stages__c ), 
ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Send Financials&quot;)), 
AND( ISCHANGED(Dec_Bookkeeping_Stages__c ), 
ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Send Financials&quot;)) 
))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Client Email -  Record - Client Unresponsive</fullName>
        <actions>
            <name>Client_Unresponsive_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Client_Unresponsive_Email_2</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Client_Unresponsive_Email_3</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Asks the client to reach out to us if the stage goes to Client Unresponsive</description>
        <formula>AND(
NOT(ISBLANK( Client_Email__c )),
ISBLANK(Set_of_Books__c),
OR(  
AND( ISCHANGED(Jan_Bookkeeping_Stages__c ), 
ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Feb_Bookkeeping_Stages__c ), 
ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Mar_Bookkeeping_Stages__c ), 
ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Apr_Bookkeeping_Stages__c ), 
ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(May_Bookkeeping_Stages__c ), 
ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Jun_Bookkeeping_Stages__c ), 
ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Jul_Bookkeeping_Stages__c ), 
ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Aug_Bookkeeping_Stages__c ), 
ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Sep_Bookkeeping_Stages__c ), 
ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Oct_Bookkeeping_Stages__c ), 
ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Nov_Bookkeeping_Stages__c ), 
ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)), 
AND( ISCHANGED(Dec_Bookkeeping_Stages__c ), 
ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)) 
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Client Email - Record - Send Draft</fullName>
        <actions>
            <name>Draft_Sent_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Draft_Sent_Email_2</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Emails the client when the stage is changed to draft.</description>
        <formula>AND(NOT(ISBLANK( Box_Viewable_Folder__c )),
NOT(ISBLANK( Client_Email__c )),
ISBLANK(Set_of_Books__c),
OR(
AND( ISCHANGED(Jan_Bookkeeping_Stages__c ),
ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Feb_Bookkeeping_Stages__c ),
ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Mar_Bookkeeping_Stages__c ),
ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Apr_Bookkeeping_Stages__c ),
ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(May_Bookkeeping_Stages__c ),
ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Jun_Bookkeeping_Stages__c ),
ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Jul_Bookkeeping_Stages__c ),
ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Aug_Bookkeeping_Stages__c ),
ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Sep_Bookkeeping_Stages__c ),
ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Oct_Bookkeeping_Stages__c ),
ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Nov_Bookkeeping_Stages__c ),
ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),
AND( ISCHANGED(Dec_Bookkeeping_Stages__c ),
ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Draft Sent&quot;))
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Client Email - Record - Waiting on Client Status</fullName>
        <actions>
            <name>Missing_Info_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Missing_Info_Email_2</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Sends email to client when stage is changed to Waiting on Client.</description>
        <formula>AND(NOT(ISBLANK( Client_Email__c)),
ISBLANK(Set_of_Books__c), 
OR(
AND( ISCHANGED(Jan_Bookkeeping_Stages__c ),
ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Feb_Bookkeeping_Stages__c ),
ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Mar_Bookkeeping_Stages__c ),
ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Apr_Bookkeeping_Stages__c ),
ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(May_Bookkeeping_Stages__c ),
ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Jun_Bookkeeping_Stages__c ),
ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Jul_Bookkeeping_Stages__c ),
ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Aug_Bookkeeping_Stages__c ),
ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Sep_Bookkeeping_Stages__c ),
ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Oct_Bookkeeping_Stages__c ),
ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Nov_Bookkeeping_Stages__c ),
ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),
AND( ISCHANGED(Dec_Bookkeeping_Stages__c ),
ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;))
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Enter Stopped Services Date</fullName>
        <actions>
            <name>Enter_Stopped_Services_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Uncheck_Repeat_these_Books</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3 OR 4 OR 5 OR 6 OR 7 OR 8 OR 9 OR 10 OR 11 OR 12</booleanFilter>
        <criteriaItems>
            <field>Bookkeeping__c.Jan_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Feb_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Mar_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Apr_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.May_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Jun_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Jul_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Aug_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Sep_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Oct_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Nov_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Dec_Bookkeeping_Stages__c</field>
            <operation>equals</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <description>Records the date if any month is put into the &quot;Stopped Services&quot; stage.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Next Month Not Started</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Bookkeeping__c.BK_Stage__c</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.BK_Stage__c</field>
            <operation>notEqual</operation>
            <value>Send Financials</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.BK_Stage__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Used with PB to set next month stage to Not Started</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>End_Month_Box_True</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Bookkeeping__c.End_of_Month__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Remove Stopped Services Date</fullName>
        <actions>
            <name>Check_Repeat_these_books</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Remove_Stopped_Services_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Bookkeeping__c.Jan_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Feb_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Mar_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Apr_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.May_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Jun_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Jul_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Aug_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Sep_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Oct_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Nov_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Bookkeeping__c.Dec_Bookkeeping_Stages__c</field>
            <operation>notEqual</operation>
            <value>Stopped_Services</value>
        </criteriaItems>
        <description>Removes the date if all months are clear of the &quot;Stopped Services&quot; stage.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Repeat the Books</fullName>
        <active>false</active>
        <description>Time based workflow to trigger a recurring books</description>
        <formula>AND(
Month__c = True,
Repeat_these_books__c = True,
MONTH(End_of_Month__c) = 12)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Set_Recurrence_Trigger_to_True</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Send Review Email to Blanca</fullName>
        <actions>
            <name>Alert_Blanca_Review</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>Emails Blanca to tell her the Bookkeeping record is in review.</description>
        <formula>AND(
ISPICKVAL( Bookkeeper_Reviewer__c , &quot;Blanca Lemus&quot;), 
OR(
AND( ISCHANGED(Jan_Bookkeeping_Stages__c ), 
ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Feb_Bookkeeping_Stages__c ), 
ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Mar_Bookkeeping_Stages__c ), 
ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Apr_Bookkeeping_Stages__c ), 
ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(May_Bookkeeping_Stages__c ), 
ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Jun_Bookkeeping_Stages__c ), 
ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Jul_Bookkeeping_Stages__c ), 
ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Aug_Bookkeeping_Stages__c ), 
ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Sep_Bookkeeping_Stages__c ), 
ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Oct_Bookkeeping_Stages__c ), 
ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Nov_Bookkeeping_Stages__c ), 
ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Dec_Bookkeeping_Stages__c ), 
ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Review&quot;)) 
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Review Email to Christina</fullName>
        <active>false</active>
        <description>Emails Christina to tell her the Bookkeeping record is in review.</description>
        <formula>AND(
ISPICKVAL( Bookkeeper_Reviewer__c , &quot;Christina Chavez&quot;),
OR(  
AND( ISCHANGED(Jan_Bookkeeping_Stages__c ), 
ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Feb_Bookkeeping_Stages__c ), 
ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Mar_Bookkeeping_Stages__c ), 
ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Apr_Bookkeeping_Stages__c ), 
ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(May_Bookkeeping_Stages__c ), 
ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Jun_Bookkeeping_Stages__c ), 
ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Jul_Bookkeeping_Stages__c ), 
ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Aug_Bookkeeping_Stages__c ), 
ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Sep_Bookkeeping_Stages__c ), 
ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Oct_Bookkeeping_Stages__c ), 
ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Nov_Bookkeeping_Stages__c ), 
ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Review&quot;)), 
AND( ISCHANGED(Dec_Bookkeeping_Stages__c ), 
ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Review&quot;)) 
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Comments</fullName>
        <actions>
            <name>Update_BK_Object_Comments</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Used with inline editing to update the comments.</description>
        <formula>OR(
AND(ISCHANGED(Update_Comments__c), 
NOT(ISBLANK(Update_Comments__c))),
AND(ISCHANGED(New_Comments__c), 
NOT(ISBLANK(New_Comments__c)))
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Email</fullName>
        <actions>
            <name>Set_NPS_email_to_client_emali</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the NPS email field to the account email for NPS Surveys</description>
        <formula>OR(
ISBLANK( NPS_Email__c ),
NPS_Email__c &lt;&gt; Client_Name__r.E_Mail__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
