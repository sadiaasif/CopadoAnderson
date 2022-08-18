import { LightningElement,wire,api,track } from 'lwc';
import Getprojectbyid from '@salesforce/apex/ProjectRelatedListTax.Getprojectbyid';

export default class TaxRelatedProject extends LightningElement {
    @track columns = [
        { label: 'Harvest Project ID', fieldName: 'H2S__HarvestProjectID__c'},
        { label: 'Package Burn', fieldName: 'Package_Burn__c', type: 'text' },
        { label: 'Project Code', fieldName: 'H2S__ProjectCode__c', type: 'text' },
        
        ];
    @api recordId;
@wire(Getprojectbyid, { taxid: '$recordId' }) 
    
Haverstpkg;
    }