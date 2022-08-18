import { LightningElement,wire,api,track } from 'lwc';
import GetTaxComplianceopp from '@salesforce/apex/ProjectRelatedTaxCompliance.GetTaxComplianceopp';

export default class ProjectRelatedTaxCompliance extends LightningElement {
@track columns = [    
{ label: 'Sale Name', fieldName: 'Name'},
{ label: 'Close Date', fieldName:'CloseDate', type: 'date'},
{ label: 'Stage', fieldName: 'StageName', type: 'text' },
{ label: 'Amount', fieldName: 'Amount'} ];
@api recordId;
@wire(GetTaxComplianceopp, { taxid: '$recordId' }) 
taxComplianceOpp;
}