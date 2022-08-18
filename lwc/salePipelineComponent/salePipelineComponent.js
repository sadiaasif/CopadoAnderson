import { LightningElement, api,track,wire} from 'lwc';
import Id from '@salesforce/user/Id';
import { getRecord } from 'lightning/uiRecordApi';
import UserNameFld from '@salesforce/schema/User.Name';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Lightningeditform extends LightningElement {
    @api recordId;
    @api isLoaded = false;
    @api isEditable = false;
    @api errorMessage = '';
    @api originalComment = '';
    @track value;
    value = [];
    userId = Id;
    @api currentUserName;
    error;
    
    @wire(getRecord, { recordId: Id, fields: [UserNameFld]}) 
    userDetails({error, data}) {
        if (data) {
            this.currentUserName = data.fields.Name.value;
        } else if (error) {
            this.error = error ;
        }
    }

    get options() {
        return [
            { label: 'Call/Voicemail', value: 'Call/Voicemail' },
            { label: 'Email', value: 'Email' },
            { label: 'Text', value: 'Text' },
        ];
    }
     handleSubmit(event){
        event.preventDefault();       // stop the form from submitting
        const fields = event.detail.fields;
        this.errorMessage = '';
        
        let followUp1Type = this.template.querySelector('[data-id="followUp1Type"]').value;
        fields.Follow_Up_1__c = followUp1Type.join(';');

        let followUp2Type = this.template.querySelector('[data-id="followUp2Type"]').value;
        fields.Follow_Up_2__c = followUp2Type.join(';');

        let followUp3Type = this.template.querySelector('[data-id="followUp3Type"]').value;
        fields.Follow_Up_3__c = followUp3Type.join(';');

        let finalfollowUpType = this.template.querySelector('[data-id="finalfollowUpType"]').value;
        fields.Final_Follow_Up__c = finalfollowUpType.join(';');
        
        this.isLoaded = true;
        if(fields.Update_Comments__c!=null && fields.Update_Comments__c!='' &&fields.Update_Comments__c!=this.originalComment){
            var todaydate= new Date().toISOString();
            todaydate = todaydate.substr(0, todaydate.indexOf('T')); 
            fields.Comments__c = (todaydate+' - '+this.currentUserName+' - '+ fields.Update_Comments__c)+'\n'+
                                 (fields.Comments__c==null?'':fields.Comments__c);
        }
        this.template.querySelector('lightning-record-edit-form').submit(fields);

        
      }
       handleOnLoad(event) {
   
        try{
            var record = event.detail.records;
            var fields = record[this.recordId].fields; 
            
            const followUp1Typec = fields.Follow_Up_1__c!=null?fields.Follow_Up_1__c.value:null;
            this.template.querySelector('[data-id="followUp1Type"]').value =  followUp1Typec!=null?followUp1Typec.split(";"):[];  
            const followUp2Typec = fields.Follow_Up_2__c!=null?fields.Follow_Up_2__c.value:null;
            this.template.querySelector('[data-id="followUp2Type"]').value =  followUp2Typec!=null?followUp2Typec.split(";"):[];  
            const followUp3Typec = fields.Follow_Up_3__c!=null?fields.Follow_Up_3__c.value:null;
            this.template.querySelector('[data-id="followUp3Type"]').value =  followUp3Typec!=null?followUp3Typec.split(";"):[];  
            const followUp4Typec = fields.Final_Follow_Up__c!=null?fields.Final_Follow_Up__c.value:null;
            this.template.querySelector('[data-id="finalfollowUpType"]').value =  followUp4Typec!=null?followUp4Typec.split(";"):[];  
        
            this.originalComment = fields.Update_Comments__c.value;
        }
        catch(e){
            console.log(e);
        }
         
     }
  
    handleSuccess(event){
        this.isLoaded = false; 
        this.createdRecordId = event.detail.id;
        const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Record Saved Successfully',
            variant: 'success',
            mode: 'dismissable',
        });
        this.dispatchEvent(evt);
        this.isEditable = false;
    }

    handleError(event){
        this.isLoaded = false;
        let errorMsg = event.detail;
        if(errorMsg.detail!=null && errorMsg.detail!=''){
            this.errorMessage = 'ERROR: '+errorMsg.detail;
        }
    }


    handleCancel(event){
        this.isEditable = false;
    }

    handleEdit(event){
        this.isEditable = true;
    }
    viewOnlyLoad(event){
        try{
            var record = event.detail.records;
            var fields = record[this.recordId].fields; 
            const followUp1Typec = fields.Follow_Up_1__c!=null?fields.Follow_Up_1__c.value:null;
            this.template.querySelector('[data-id="followUp1TypeViewOnly"]').value =  followUp1Typec!=null?followUp1Typec.split(";"):[];  
            const followUp2Typec = fields.Follow_Up_2__c!=null?fields.Follow_Up_2__c.value:null;
            this.template.querySelector('[data-id="followUp2TypeViewOnly"]').value =  followUp2Typec!=null?followUp2Typec.split(";"):[];  
            const followUp3Typec = fields.Follow_Up_3__c!=null?fields.Follow_Up_3__c.value:null;
            this.template.querySelector('[data-id="followUp3TypeViewOnly"]').value =  followUp3Typec!=null?followUp3Typec.split(";"):[];  
            const followUp4Typec = fields.Final_Follow_Up__c!=null?fields.Final_Follow_Up__c.value:null;
            this.template.querySelector('[data-id="finalfollowUpTypeViewOnly"]').value =  followUp4Typec!=null?followUp4Typec.split(";"):[];  
        }catch(e){
            console.log(e);
        }
    }
}