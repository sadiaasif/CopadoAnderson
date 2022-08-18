import { LightningElement, api } from 'lwc';

export default class ClientTeamInfo extends LightningElement {
    @api recordId;
    @api objectApiName;
    fields = ['CAM_Pic__c', 'CSR_Pic__c', 'Assigned_CAM__c', 'Assigned_CSR__c', 'Senior_Advisor_Pic__c', 'Senior_Advisor_Picklist__c', 'Bookkeeper_Pic__c', 'Bookkeeper_Picklist__c'];

}