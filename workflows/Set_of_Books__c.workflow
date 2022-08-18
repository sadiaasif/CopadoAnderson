<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_Bookeping_Reviewer_set</fullName>
        <description>Bookkeeping Email - Set - Bookeping Reviewer on Review Status</description>
        <protected>false</protected>
        <recipients>
            <field>bk_team_bk_reviewer_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Alert_Bookkeeping_Reviewer_set</template>
    </alerts>
    <alerts>
        <fullName>Client_Email_Set_Client_Unresponsive</fullName>
        <description>Client Email - Set - Client Unresponsive</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Client_Alert_Set_Client_Unresponsive</template>
    </alerts>
    <alerts>
        <fullName>Client_Email_Set_Client_Unresponsive_Email_Address_2</fullName>
        <description>Client Email - Set - Client Unresponsive Email Address 2</description>
        <protected>false</protected>
        <recipients>
            <field>Second_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Client_Alert_Set_Client_Unresponsive</template>
    </alerts>
    <alerts>
        <fullName>Client_Email_Set_Draft_Sent_Email</fullName>
        <description>Client Email - Set - Draft Sent Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Client_Alert_Set_Draft_Sent_Email</template>
    </alerts>
    <alerts>
        <fullName>Client_Email_Set_Draft_Sent_Email_2</fullName>
        <description>Client Email - Set - Draft Sent Email 2</description>
        <protected>false</protected>
        <recipients>
            <field>Second_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Client_Alert_Set_Draft_Sent_Email</template>
    </alerts>
    <alerts>
        <fullName>Client_Email_Set_Missing_Info_Email</fullName>
        <description>Client Email - Set - Missing Info Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Client_Alert_Set_Missing_Info_Email</template>
    </alerts>
    <alerts>
        <fullName>Client_Email_Set_Missing_Info_Email_2</fullName>
        <description>Client Email - Set - Missing Info Email 2</description>
        <protected>false</protected>
        <recipients>
            <field>Second_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Client_Alert_Set_Missing_Info_Email</template>
    </alerts>
    <alerts>
        <fullName>Client_Email_Set_Send_Completed_Email</fullName>
        <description>Client Email - Set- Send Completed Email</description>
        <protected>false</protected>
        <recipients>
            <field>Client_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Set_of_Books/Client_Alert_Set_Completed_Email</template>
    </alerts>
    <alerts>
        <fullName>Client_Email_Set_Send_Completed_Email_2</fullName>
        <description>Client Email - Set - Send Completed Email 2</description>
        <protected>false</protected>
        <recipients>
            <field>Second_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Set_of_Books/Client_Alert_Set_Completed_Email</template>
    </alerts>
    <alerts>
        <fullName>Send_Financials_Email_set</fullName>
        <description>Bookkeeping Email - Set - Send Financials Alert</description>
        <protected>false</protected>
        <recipients>
            <field>bk_team_bk_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Alert_BK_set</template>
    </alerts>
    <alerts>
        <fullName>Tells_BK_and_Jr_BK_of_Review_Notes_2_set</fullName>
        <description>Bookkeeping Email - Set - Jr. BK of Review Notes</description>
        <protected>false</protected>
        <recipients>
            <field>bk_team_jr_bk_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Alert_BK_and_Jr_BK_set</template>
    </alerts>
    <alerts>
        <fullName>Tells_BK_and_Jr_BK_of_Review_Notes_set</fullName>
        <description>Bookkeeping Email - Set - BK Review Notes Alert</description>
        <protected>false</protected>
        <recipients>
            <field>bk_team_bk_email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>bookkeepingsupport@andersonadvisors.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Set_of_Books/Alert_BK_and_Jr_BK_set</template>
    </alerts>
    <rules>
        <fullName>Bookkeeping Email - Set - BK Reviewer</fullName>
        <actions>
            <name>Alert_Bookeping_Reviewer_set</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Emails Bookeeping Reviewer that Bookkeeping record is in review.</description>
        <formula>AND(  OR(  AND( ISCHANGED(Jan_Bookkeeping_Stages__c ),  ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Feb_Bookkeeping_Stages__c ),  ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Mar_Bookkeeping_Stages__c ),  ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Apr_Bookkeeping_Stages__c ),  ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(May_Bookkeeping_Stages__c ),  ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Jun_Bookkeeping_Stages__c ),  ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Jul_Bookkeeping_Stages__c ),  ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Aug_Bookkeeping_Stages__c ),  ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Sep_Bookkeeping_Stages__c ),  ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Oct_Bookkeeping_Stages__c ),  ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Nov_Bookkeeping_Stages__c ),  ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Review&quot;)),  AND( ISCHANGED(Dec_Bookkeeping_Stages__c ),  ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Review&quot;))  )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Bookkeeping Email - Set - Review Notes to BK%2FJr BK</fullName>
        <actions>
            <name>Tells_BK_and_Jr_BK_of_Review_Notes_2_set</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Tells_BK_and_Jr_BK_of_Review_Notes_set</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Emails BK / Jr. Bk when the Stage goes into review notes.</description>
        <formula>OR(  AND( ISCHANGED(Jan_Bookkeeping_Stages__c ),  ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Feb_Bookkeeping_Stages__c ),  ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Mar_Bookkeeping_Stages__c ),  ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Apr_Bookkeeping_Stages__c ),  ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(May_Bookkeeping_Stages__c ),  ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Jun_Bookkeeping_Stages__c ),  ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Jul_Bookkeeping_Stages__c ),  ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Aug_Bookkeeping_Stages__c ),  ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Sep_Bookkeeping_Stages__c ),  ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Oct_Bookkeeping_Stages__c ),  ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Nov_Bookkeeping_Stages__c ),  ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Review Notes&quot;)),  AND( ISCHANGED(Dec_Bookkeeping_Stages__c ),  ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Review Notes&quot;))  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Bookkeeping Email - Set - Send Financials</fullName>
        <actions>
            <name>Send_Financials_Email_set</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Emails BK when the Stage goes into Send Financials.</description>
        <formula>OR(  AND( ISCHANGED(Jan_Bookkeeping_Stages__c ),  ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Feb_Bookkeeping_Stages__c ),  ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Mar_Bookkeeping_Stages__c ),  ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Apr_Bookkeeping_Stages__c ),  ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(May_Bookkeeping_Stages__c ),  ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Jun_Bookkeeping_Stages__c ),  ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Jul_Bookkeeping_Stages__c ),  ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Aug_Bookkeeping_Stages__c ),  ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Sep_Bookkeeping_Stages__c ),  ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Oct_Bookkeeping_Stages__c ),  ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Nov_Bookkeeping_Stages__c ),  ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Send Financials&quot;)),  AND( ISCHANGED(Dec_Bookkeeping_Stages__c ),  ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Send Financials&quot;))  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Client Email - Set - Client Unresponsive</fullName>
        <actions>
            <name>Client_Email_Set_Client_Unresponsive</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Client_Email_Set_Client_Unresponsive_Email_Address_2</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Asks the client to reach out to us if the stage goes to Client Unresponsive</description>
        <formula>AND(  NOT(ISBLANK( Client_Email__c )),  OR(  AND( ISCHANGED(Jan_Bookkeeping_Stages__c ),  ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Feb_Bookkeeping_Stages__c ),  ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Mar_Bookkeeping_Stages__c ),  ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Apr_Bookkeeping_Stages__c ),  ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(May_Bookkeeping_Stages__c ),  ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Jun_Bookkeeping_Stages__c ),  ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Jul_Bookkeeping_Stages__c ),  ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Aug_Bookkeeping_Stages__c ),  ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Sep_Bookkeeping_Stages__c ),  ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Oct_Bookkeeping_Stages__c ),  ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Nov_Bookkeeping_Stages__c ),  ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;)),  AND( ISCHANGED(Dec_Bookkeeping_Stages__c ),  ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Client Unresponsive&quot;))  )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Client Email - Set - Send Draft</fullName>
        <actions>
            <name>Client_Email_Set_Draft_Sent_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Client_Email_Set_Draft_Sent_Email_2</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Emails the client when the stage is changed to draft.</description>
        <formula>AND(NOT(ISBLANK( Box_Viewable_Folder__c )),  NOT(ISBLANK( Client_Email__c )),  OR(  AND( ISCHANGED(Jan_Bookkeeping_Stages__c ),  ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Feb_Bookkeeping_Stages__c ),  ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Mar_Bookkeeping_Stages__c ),  ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Apr_Bookkeeping_Stages__c ),  ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(May_Bookkeeping_Stages__c ),  ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Jun_Bookkeeping_Stages__c ),  ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Jul_Bookkeeping_Stages__c ),  ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Aug_Bookkeeping_Stages__c ),  ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Sep_Bookkeeping_Stages__c ),  ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Oct_Bookkeeping_Stages__c ),  ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Nov_Bookkeeping_Stages__c ),  ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Draft Sent&quot;)),  AND( ISCHANGED(Dec_Bookkeeping_Stages__c ),  ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Draft Sent&quot;))  )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Client Email - Set - Waiting on Client Status</fullName>
        <actions>
            <name>Client_Email_Set_Missing_Info_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Client_Email_Set_Missing_Info_Email_2</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Sends email to client when stage is changed to Waiting on Client.</description>
        <formula>AND(NOT(ISBLANK( Client_Email__c )),  OR(  AND( ISCHANGED(Jan_Bookkeeping_Stages__c ),  ISPICKVAL(Jan_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Feb_Bookkeeping_Stages__c ),  ISPICKVAL(Feb_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Mar_Bookkeeping_Stages__c ),  ISPICKVAL(Mar_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Apr_Bookkeeping_Stages__c ),  ISPICKVAL(Apr_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(May_Bookkeeping_Stages__c ),  ISPICKVAL(May_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Jun_Bookkeeping_Stages__c ),  ISPICKVAL(Jun_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Jul_Bookkeeping_Stages__c ),  ISPICKVAL(Jul_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Aug_Bookkeeping_Stages__c ),  ISPICKVAL(Aug_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Sep_Bookkeeping_Stages__c ),  ISPICKVAL(Sep_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Oct_Bookkeeping_Stages__c ),  ISPICKVAL(Oct_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Nov_Bookkeeping_Stages__c ),  ISPICKVAL(Nov_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;)),  AND( ISCHANGED(Dec_Bookkeeping_Stages__c ),  ISPICKVAL(Dec_Bookkeeping_Stages__c, &quot;Waiting on Client&quot;))  )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
