import { LightningElement, api, track } from "lwc";
import checkforDigitalservice from "@salesforce/apex/SyncPlantinumandSfctrl.checkforDigitalservice";
import getcreateuserdetailsfromcontact from "@salesforce/apex/SyncPlantinumandSfctrl.getcreateuserdetailsfromcontact";
import getSfplatimumdetails from "@salesforce/apex/SyncPlantinumandSfctrl.getSfplatimumdetails";
import getPlatinumUserdetailsfromwordpress from "@salesforce/apex/SyncPlantinumandSfctrl.getPlatinumUserdetailsfromwordpress";
import syncPlatinumandsf from "@salesforce/apex/SyncPlantinumandSfctrl.syncPlatinumandsf";
import updatedigitalproductsoncon from "@salesforce/apex/SyncPlantinumandSfctrl.updatedigitalproductsoncon";
import generaterandomPassword from "@salesforce/apex/SyncPlantinumandSfctrl.generaterandomPassword";
import processEmail from "@salesforce/apex/SyncPlantinumandSfctrl.processEmail";
import createPlatinumUser from "@salesforce/apex/SyncPlantinumandSfctrl.createPlatinumUser";
import sendUpdate from "@salesforce/apex/SyncPlantinumandSfctrl.sendUpdate";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class ExampleLWC extends LightningElement {
@api
recordId ;
@api accwrapperList={};
@api WordpressplatinumaccwrapperList={};
@api digitalproductswrapperList={};
@api activeSections;
NeedtoSync = true;
generatenewpassword =true;
@api Checkforsync = false;
@api SendEmailtoclient = false;
@api isLoaded = false;
@api createuser = false;
@api Updateuser = false;
@api Email;

handleEmailChange(event) {
this.accwrapperList.accPlatinumEmail = event.detail.value;
}
handleFirstNameChange(event) {
  this.accwrapperList.accconFirstName=event.detail.value;
    }
    handleLastNameChange(event) {
        this.accwrapperList.accconLastName=event.detail.value;
        }


connectedCallback() {
   
this.isLoaded = !this.isLoaded;

var conId = this.recordId;

checkforDigitalservice({ accountId: this.recordId }).then(response => {
console.log(JSON.stringify(response));
this.digitalproductswrapperList = response; 
this.isLoaded = !this.isLoaded;

}).catch(error => {
console.log(error);
});

getcreateuserdetailsfromcontact({accountId: this.recordId })
.then(response => {

this.accwrapperList = response; 
console.log(JSON.stringify(response));
var platinumwordpressid = this.accwrapperList.acccontactWPId;
if(platinumwordpressid=='' || platinumwordpressid==null ){
this.Updateuser = false; 
this.createuser = true; 

}else{
this.createuser = false; 
this.Updateuser = true; 

}

});

}

SyncUser(event) {
this.isLoaded = true;

this.Checkforsync = true;
var a= this.recordId;
var contactID='';
console.log('***In helper'+a);
//call apex class method
//   var action = getSfplatimumdetails;

getSfplatimumdetails({accountId : this.recordId })
.then(response => {
this.accwrapperList = response;

//  var action2 = getPlatinumUserdetailsfromwordpress;
getPlatinumUserdetailsfromwordpress({
wordpressidSF : this.accwrapperList.acccontactWPId,
SFaccountid: this.recordId,
SFSaleid: this.accwrapperList.accsaleId,
SFcontactid: this.accwrapperList.acccontactId,
SFPlatinumSale: this.accwrapperList.accPlatinumsaleStage
}).then(response => {
this.WordpressplatinumaccwrapperList = response; 
this.isLoaded = false;

//set response value in wrapperList attribute on component.

}).catch(response => {
    this.isLoaded = false; 
});
}).catch(response => {
    this.isLoaded = false;    
});
}

SyncSFandwpUser() {
this.isLoaded = !this.isLoaded;

//   var action = syncPlatinumandsf;
syncPlatinumandsf({ 
wordpressidSF : this.accwrapperList.acccontactWPId,
SFaccountid: this.recordId,
SFSaleid: this.accwrapperList.accsaleId,
SFcontactid: this.accwrapperList.acccontactId,
SFPlatinumSale: this.accwrapperList.accPlatinumsaleStage
}).then(response => {
this.NeedtoSync = false;
this.WordpressplatinumaccwrapperList = response;
const toastEvent = new ShowToastEvent({
"message": "successfully Synced Saleforce and platinum !",
"title": "Success",
"variant":"success"
});
this.dispatchEvent(toastEvent);
this.isLoaded = !this.isLoaded;
})
.catch(response => {
    const toastEvent = new ShowToastEvent({
        "title": "Error",
        "message": "Error",
        "variant":"error"
        });
        this.dispatchEvent(toastEvent);
    this.isLoaded = false; 
});
}

Digitalproductsupdate(event) {
this.isLoaded = !this.isLoaded;

//  var updateconaction = updatedigitalproductsoncon;
updatedigitalproductsoncon({  


'contactid':this.digitalproductswrapperList.Conid,
'digitalproduct':this.digitalproductswrapperList.hasDigitalproducts

}).then(response => {  

if ( response === true ) {
const toastEvent = new ShowToastEvent({
"message": "Successfully updated the digital products!",
"title": "Success",
"variant":"success"
});

this.dispatchEvent(toastEvent);

//
this.isLoaded = !this.isLoaded;

//  var action = this.connectedCallback;
this.connectedCallback({ 
conId :  this.accwrapperList.acccontactId,
Email:   this.accwrapperList.accPlatinumEmail          
}).then(result => {
const toastEvent = new ShowToastEvent({
"title": "Success",
"message": "User Updated!",
"variant":"success"
});
this.dispatchEvent(toastEvent);
this.isLoaded = !this.isLoaded;

});
} else {
const toastEvent = new ShowToastEvent({
"message": "Sorry there was an issue.Please try again!",
"title": "Error",
"variant":"error"
});

this.dispatchEvent(toastEvent);
this.isLoaded = !this.isLoaded;

}

});
}

genrateandsetpassword() {
this.isLoaded = !this.isLoaded;

//  var generateandResetPassword = generaterandomPassword;
generaterandomPassword({   accountId :  this.recordId })
.then(response => {  
this.accwrapperList = response; 
this.SendEmailtoclient = true; 
this.isLoaded = !this.isLoaded;
})
.catch(error => {
const toastEvent = new ShowToastEvent({
"title": "Error",
"message": "Sorry there was an issue.Please try again!",
"type":"error"

});
this.dispatchEvent(toastEvent);
this.SendEmailtoclient = false; 
this.isLoaded = !this.isLoaded;
});



}

SendEmail() {
this.isLoaded = !this.isLoaded;

processEmail({
email:this.accwrapperList.accPlatinumEmail,
password:this.accwrapperList.accPlatinumGeneratedPass,
accconId:this.accwrapperList.acccontactId
}).then(result => {
   if(result){
const toastEvent = new ShowToastEvent({
    "title": "Success",
    "message": "Email Sent Successfully!",
    "variant":"success"
});
        this.dispatchEvent(toastEvent);
         this.generatenewpassword = true;  
         this.SendEmailtoclient = false; 
         this.isLoaded = !this.isLoaded;
    
}
    else{
//     .catch(error => {
const toastEvent = new ShowToastEvent({
    "title": "Error",
    "message": result,
    "variant":"error"
});
this.dispatchEvent(toastEvent);
    this.generatenewpassword = true; 
        this.SendEmailtoclient = false; 
    this.isLoaded = !this.isLoaded;
}

alert(JSON.stringify(response.getError()));

});
}

createUser(event) {

this.isLoaded = !this.isLoaded;

createPlatinumUser({ conIds : this.accwrapperList.acccontactId})
.then(result => {
this.accwrapperList = result;
this.accwrapperList.accconFirstName=event.detail.value;
if(this.accwrapperList.showerror==true  ){
const toastEvent = new ShowToastEvent({
"title": "Oops! The Client has no platinum subscription/Tax toolbox/Anderson Funding Community/Infinity subscription .",
"message": 'Please double-check if the client has a Platinum subscription sale type or the client has purchased Tax toolbox or Infinity subscription. If the error persist please submit a help desk case.',
"variant":"error"
});
this.dispatchEvent(toastEvent); 
}
else{

const toastEvent = new ShowToastEvent({
"title": "Success",
"message": "User Created!",
"variant":"success"
});
this.dispatchEvent(toastEvent);
}
this.isLoaded = !this.isLoaded;

})

.catch(error => {

const toastEvent = new ShowToastEvent({
"title": "Oops! That username is already in use.",
"message": 'Please double-check if a Platinum login already exists for this client and try resetting the password. If the error persist please submit a help desk case.',
"variant":"error"
});
this.dispatchEvent(toastEvent);
this.isLoaded = !this.isLoaded;

});
this.connectedCallback();
}

updateClick(evet) {
this.isLoaded = !this.isLoaded;
sendUpdate({ conId : this.accwrapperList.acccontactId, Email:  this.accwrapperList.accPlatinumEmail })
.then(result => {
// console.log(result);

const toastEvent = new ShowToastEvent({
    "title": "Success",
    "message": "User Updated!",
    "variant":"success"
});
this.dispatchEvent(toastEvent); 
this.isLoaded = !this.isLoaded;


});
}
}