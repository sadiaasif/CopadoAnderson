import { LightningElement, api,track,wire } from 'lwc';
import getTaxReturns from '@salesforce/apex/ClientEntityTaxReturnsController.getTaxReturns';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';

export default class ClientEntityTaxReturnsComponent extends NavigationMixin(LightningElement) {
    @api recordId;
    @api objectApiName;
    taxReturns = [];
    hasTaxReturns = false;

    @api 
    connectedCallback(){ 
        getTaxReturns({ clientOrEntityId: this.recordId })
        .then(result => {
            console.log(this.hasTaxReturns);
            console.log(result);
            this.hasTaxReturns = (result!=null && result.length>0)?true:false;
            console.log(this.hasTaxReturns);
            if(this.hasTaxReturns){ 
                for(var i=0;i<result.length;i++){
                    result[i].taxYearLabel = 'Year '+result[i].taxYear;
                    for(var j=0;j<result[i].taxReturns.length;j++){
                        result[i].taxReturns[j].link = '/'+result[i].taxReturns[j].Id;
                    }
                }
                this.taxReturns = result;
            }
        })
        .catch(error => {
            this.showNotification('ERROR!',error,'error');
        });
    }


    showNotification(title,message,variant) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(evt);
    }

    handleClick(event) {
        var defValues= { Tax_Year__c: event.target.value };
        if(this.objectApiName == 'Account'){
            defValues.Client__c = this.recordId; 
        }else{
            defValues.Entity__c = this.recordId; 
        }
       
        const defaultValues = encodeDefaultFieldValues(defValues);
        
        console.log(this.objectApiName);
        console.log(event.target.value);

        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Tax_Return__c',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaultValues
            }
        });

    }
}