public class AccountTriggerHandler  {
    //BeforeDelete: trigger.Old, Trigger.OldMap
    public static void BeforeDelete(List<Account> TriggerOld , Map<Id, Account> TriggerOldMap) {
        ////Prevent the deletion of Account if it has Close Won opty:
        //1- gather all entered Account IDs
        Set<Id> accIdToDelete = new Set<Id>();
        for (Account acc : TriggerOld) {
            accIdToDelete.add(acc.Id);
        }

        //2- get List of all Accounts that have closed Opty and are entered
        List<Account> accToBlockDeletion = [SELECT Id
                                              FROM Account
                                             WHERE Id IN (SELECT AccountId
                                                            FROM Opportunity
                                                           WHERE StageName = 'Closed Won'
                                                             AND AccountId IN :accIdToDelete) ];
        //3- create Map that contains the ID as index:
        Map<Id, Account> accountMap = new Map<Id, Account>(accToBlockDeletion);

        //4- Loop across the Account to Block deletion and add the Error method if ID is in Map ID
        for (Account acc : TriggerOld) {
            if (accountMap.containsKey(acc.Id)) {
                acc.addError('Cannot delete Account as it has a Closed/Won Opportunity!');
            }
        }
    }
}
