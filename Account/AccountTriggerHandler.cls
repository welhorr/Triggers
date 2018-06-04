public class AccountTriggerHandler {
    
    public static void BeforeInsert(List<Account> TriggerNew) {

    }

    public static void BeforeUpdate(List<Account> TriggerNew,
                                    List<Account> TriggerOld, 
                                 Map<Id, Account> TriggerNewMap, 
                                Map<Id, Account> TriggerOldMap) {
     
    }

    public static void BeforeDelete(List<Account> TriggerOld, 
                                 Map<Id, Account> TriggerOldMap) {

    }

    public static void AfterInsert(List<Account> TriggerNew , 
                               Map<Id, Account> TriggerNewMap) {

    }

    public static void AfterUpdate(List<Account> TriggerNew,
                                   List<Account> TriggerOld,
                                Map<Id, Account> TriggerNewMap,
                                Map<Id, Account> TriggerOldMap) {

    }

    public static void AfterDelete(Map<Id, Account> TriggerOldMap) {

    }

    public static void AfterUndelete(List<Account> TriggerNew , 
                                  Map<Id, Account> TriggerNewMap) {

    }

} 
