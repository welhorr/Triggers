public class ContactTriggerHandler {

    public static void BeforeUpdate(List<Contact> TriggerNew,
            List<Contact> TriggerOld,
            Map<Id, Contact> TriggerNewMap,
            Map<Id, Contact> TriggerOldMap) {
            
        //1- get IDs of all parent account of the contacts entered
        Set<Id> accIds = new Set<Id>();
        for (Contact con : TriggerNew) {
            if (con.AccountId != null) {
                accIds.add(con.AccountId);
            }
        }

        //2- get the list of these accounts
        List<Account> accList = [SELECT Id, Type FROM Account WHERE Id IN :accIds];

        //3- get Map of Account ID / Account type
        Map<Id, String> accIdTypeMap = new Map<Id, String>();
        for (Account acc : accList) {
            accIdTypeMap.put(acc.Id, acc.Type);
        }

        //4- loop through the inserted contacts and add the type by linking to the key (account ID) of the Map above
        for (Contact con : TriggerNew) {
            con.Parent_Account_Type__c = accIdTypeMap.get(con.AccountId);
        }
    }
}
