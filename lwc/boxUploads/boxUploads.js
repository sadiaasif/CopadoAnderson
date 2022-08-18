import { LightningElement, api, wire } from 'lwc';
import fetchClientUploads from '@salesforce/apex/BoxUploadsHelper.fetchClientUploads';

export default class BoxUploads extends LightningElement {
    @api recordId;
    @api objectApiName;
    @wire(fetchClientUploads, { taskId:'$recordId' })
    returnedValue;

}