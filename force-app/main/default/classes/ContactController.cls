public with sharing class ContactController {

    // Fetch record by Id (for Edit)
    @AuraEnabled(cacheable=true)
    public static Contact getContactById(Id recordId) {
        return [
            SELECT Id, FirstName, LastName, Email, Phone
            FROM Contact
            WHERE Id = :recordId
            LIMIT 1
        ];
    }

    // Update Contact (for Save)
    @AuraEnabled
    public static void updateContact(Contact contactRecord) {
        update contactRecord;
    }

    // @AuraEnabled
    // public static void updateContacts(List<Contact> contacts) {
    //     if (contacts == null || contacts.isEmpty()) return;
    //     update contacts;
    // }

    // @AuraEnabled
    // public static void deleteContact(Id contactId) {
    //     try {
    //         delete [SELECT Id FROM Contact WHERE Id = :contactId];
    //     } catch(Exception e) {
    //         throw new AuraHandledException('Unable to delete Contact: ' + e.getMessage());
    //     }
    // }

    // @AuraEnabled
    // public static void deleteContacts(List<Id> contactIds) {
    //     if (contactIds == null || contactIds.isEmpty()) return;
    //     List<Contact> toDelete = [SELECT Id FROM Contact WHERE Id IN :contactIds];
    //     delete toDelete;
    // }

    // TODO : Move it to New Apex class that fetched MDT Records
    // @AuraEnabled(cacheable=true)
    // public static List<Action_Button__mdt> getButtons(String objectApiName) {
    //     return [SELECT MasterLabel, Variant__c, Action_Type__c, Action_Value__c, Target__c 
    //             FROM Action_Button__mdt 
    //             WHERE Target__c = :objectApiName];
    // }
}