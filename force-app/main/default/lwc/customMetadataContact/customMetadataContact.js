import { LightningElement,wire,track } from 'lwc';
import metadata from '@salesforce/apex/MetadataController.getMetadaList';
import insertContact from '@salesforce/apex/MetadataController.insertContact';
import insertAccount from '@salesforce/apex/MetadataController.insertAccount';
import insertOpportunity from '@salesforce/apex/MetadataController.insertOpp';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CustomMetadataContact extends LightningElement {

    
    @wire (metadata) metadata
    @track contact={}
    @track account ={}
    @track opportunity={}
    @track fieldObject
    valueChange(event){
        this.fieldObject = event.target.title
        if(this.fieldObject == 'Contact'){
            this.contact[event.target.name] = event.target.value
        }
        if(this.fieldObject == 'Opportunity'){
            this.opportunity[event.target.name] = event.target.value
        }
        if(this.fieldObject == 'Account'){
            this.account[event.target.name] = event.target.value
        }
    }
    toastEventFire(title,msg,variant,mode){
        const e = new ShowToastEvent({
            title: title,
            message: msg,
            variant: variant,
            mode: mode
        });
        this.dispatchEvent(e);
    }
    submitHandler(event){
        insertContact({con : this.contact})
        .then(result =>{
            this.toastEventFire('Success','Record is Saved','success');
        })
        .catch(error =>{
            this.error = error.message;
            alert(JSON.stringify(error))
        })
        insertOpportunity({opp : this.opportunity})
        .then(result =>{
            this.toastEventFire('Success','Record is Saved','success');
        })
        .catch(error =>{
            this.error = error.message;
            alert(JSON.stringify(error))
        })
        insertAccount({acc : this.account})
        .then(result =>{
            this.toastEventFire('Success','Record is Saved','success');
        })
        .catch(error =>{
            this.error = error.message;
            alert(JSON.stringify(error))
        })
    }
}