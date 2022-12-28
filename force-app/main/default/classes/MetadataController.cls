public with sharing class MetadataController {

    @AuraEnabled(cacheable=true)
    public static List<Contact__mdt> getMetadaList() {
        List<Contact__mdt> mData = new List<Contact__mdt>();
        mData = [Select Label,Field_Type__c,sObject__c,Field_Api_Name__c FROM Contact__mdt ];
        return mData;
    }
    
    
    @AuraEnabled
     public static void insertContact(Contact con){ 
        try{
            insert con;
            }catch(Exception ex){
                throw new AuraHandledException(ex.getMessage());
            }
     }
     @AuraEnabled
     public static void insertOpp(Opportunity opp){
        try{
            insert opp;
            }catch(Exception ex){
                throw new AuraHandledException(ex.getMessage());
            }
     }
     @AuraEnabled
     public static void insertAccount(Account acc){ 
        try{
            insert acc;
            }catch(Exception ex){
                throw new AuraHandledException(ex.getMessage());
            }
     }
}






 // @AuraEnabled(cacheable=true)
    // public static Map < String, String > fetchMapData() {
    //     Map < String, String > mapMetaContact = new Map < String, String >();
    //     List<Contact__mdt> mData = [Select Label,Field_Type__c,Field_Api_Name__c FROM Contact__mdt ];
    //     List<Contact> con = [Select LastName,Phone,FirstName FROM Contact];
    //     mapMetaContact.put(mData.Label, con.LastName);
    //     System.debug(mapMetaContact);
    //     return mapMetaContact;
    // }
    // mData.filedApiname == 'Lastname'
    
    
    // con.lastname = 'name';
    // con.firstname


    // @AuraEnabled
    // public static void ContactMetadataController(Contact con) {
    //     try{
    //         Metadata.DeployContainer mdContainer = new Metadata.DeployContainer();
    //         //String nameSpacePrefix =''; // if the metadata belongs to any package than include the namespace.                
    //         //First Record 
    //         Metadata.CustomMetadata firstMetadataRec =  new Metadata.CustomMetadata();
    //         //String label1 = con.LastName;            

    //         firstMetadataRec.fullName ='Contact__mdt. '+con.LastName;
    //         firstMetadataRec.label = con.Title;           
    //         //adding values to fields
    //         Metadata.CustomMetadataValue customField1 = new Metadata.CustomMetadataValue();
    //         customField1.field = 'sObject__c';
    //         customField1.value = con.sObject__c;
    //         firstMetadataRec.values.add(customField1);            
    //         Metadata.CustomMetadataValue customField2 = new Metadata.CustomMetadataValue();
    //         customField2.field = 'Field_Type__c';
    //         customField2.value = con.Type__c;
    //         firstMetadataRec.values.add(customField2); 
            
    //         Metadata.CustomMetadataValue customField3 = new Metadata.CustomMetadataValue();
    //         customField3.field = 'Field_Api_Name__c';
    //         customField3.value = 'Contact LastName';
    //         firstMetadataRec.values.add(customField3);
                                    
    //         mdContainer.addMetadata(firstMetadataRec);

    //         Id jobId = Metadata.Operations.enqueueDeployment(mdContainer, null);
    //         system.debug('jobId***'+jobId);
    //     }
    //     catch(Exception ex){             
    //         //System.assert(false,ex.getMessage()); 
    //         system.debug('Error while creating modifying custom metadata.');
    //     }

       
        
    //}           
