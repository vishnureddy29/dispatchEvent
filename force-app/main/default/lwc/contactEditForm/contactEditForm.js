import { LightningElement,wire,track } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import {refreshApex} from '@salesforce/apex';
import getContactList from '@salesforce/apex/ContactEditForm.getContactList'
import CONTACT_OBJECT from '@salesforce/schema/Contact'
import CONTACT_FIRSTNAME from '@salesforce/schema/Contact.FirstName'
import CONTACT_LASTNAME from '@salesforce/schema/Contact.LastName'
import CONTACT_PHONE from '@salesforce/schema/Contact.Phone'
import CONTACT_EMAIL from '@salesforce/schema/Contact.Email'

export default class ContactEditForm extends LightningElement {
    @wire(getContactList) contacts;

    objectName = CONTACT_OBJECT
    fieldList = [CONTACT_FIRSTNAME,CONTACT_LASTNAME,CONTACT_PHONE,CONTACT_EMAIL];

    successHandler(event){
        const tostEvent = new ShowToastEvent({
            title:"Contact Created",
            message:"Successfully created new Contact",
            variant:"success"
        })
        this.dispatchEvent(tostEvent)
        this.customFormModal = false;
        return refreshApex(this.contacts)
        
    }

    @track customFormModal = false;
    customShowModalPopup() {            
        this.customFormModal = true;
    }
 
    customHideModalPopup() {    
        
        this.customFormModal = false;
    }
}