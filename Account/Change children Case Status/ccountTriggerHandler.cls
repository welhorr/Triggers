public class AccountTriggerHandler  {
    //AfterUpdate: trigger.New, trigger.Old, Trigger.NewMap, Trigger.OldMap
    public static void AfterUpdate(List<Account> TriggerNew) {
        ////Change children Cases status to Case Status of Account
        //1- Get all IDs of Accounts inserted
        Set<Id> accIds = new Set<Id>();
        for (Account acc : TriggerNew) {
            accIds.add(acc.Id);
        }
        
        //2- Get all Cases associated with these Accounts
        List<Case> cases = [ SELECT Status, Id, AccountId, Account.Case_Status__c
                               FROM Case
                               WHERE AccountId IN :accIds];

        //Loop through the list of these cases, and change the status to the status of the parent Account
        for (Case aCase : cases) {
            aCase.Status = aCase.Account.Case_Status__c;
        }

        update cases;
    }
 } 
