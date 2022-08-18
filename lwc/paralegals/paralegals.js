import { LightningElement,api,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Platinum_Team__c.Name',
    'Platinum_Team__c.Paralegals__c',
    'Platinum_Team__c.Paralegals_Image_URL__c',
    'Platinum_Team__c.Paralegals_Email__c',
    'Platinum_Team__c.Paralegals_Phone__c',
];


const columns = [
    { label: 'Team Name', fieldName: 'teamName' },
    { label: 'Name', fieldName: 'name' },
    { label: 'Image', fieldName: 'imageURL'},
    { label: 'Email', fieldName: 'email', type: 'email' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
];


export default class Paralegals extends LightningElement {
    @api recordId;
    para = '';
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS }) 
    PlatinumTeam({error, data}){
        if(data){
            console.log('here');
            console.log(data.fields.Paralegals__c.value);
            this.para = data.fields.Paralegals__c.value;
            console.log(this.para);
        }
        else if(error){
            console.log('An error has occurred:');
            console.log(error);
        }
    }
    get result(){
        return this.PlatinumTeam && this.PlatinumTeam.data ? this.PlatinumTeam.data.fields.Paralegals__c.value : 'Loading...';
    }
    
    
}
class Paralegal {
    constructor(teamName, name, imageURL, email, phone) {
        this.teamName = teamName
        this.name = name
        this.imageURL = imageURL
        this.email = email
        this.phone = phone
    }
}