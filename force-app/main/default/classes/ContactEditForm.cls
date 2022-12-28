public with sharing class ContactEditForm {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [SELECT Id,Name,FirstName,LastName,Email,Phone FROM Contact];
    }
    
}
