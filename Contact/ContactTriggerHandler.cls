public class ContactTriggerHandler {
    
    public static void BeforeInsert(List<Contact> TriggerNew) {

    }

    public static void BeforeUpdate(List<Contact> TriggerNew,
                                    List<Contact> TriggerOld, 
                                 Map<Id, Contact> TriggerNewMap, 
                                Map<Id, Contact> TriggerOldMap) {
     
    }

    public static void BeforeDelete(List<Contact> TriggerOld, 
                                 Map<Id, Contact> TriggerOldMap) {

    }

    public static void AfterInsert(List<Contact> TriggerNew , 
                               Map<Id, Contact> TriggerNewMap) {

    }

    public static void AfterUpdate(List<Contact> TriggerNew,
                                   List<Contact> TriggerOld,
                                Map<Id, Contact> TriggerNewMap,
                                Map<Id, Contact> TriggerOldMap) {

    }

    public static void AfterDelete(Map<Id, Contact> TriggerOldMap) {

    }

    public static void AfterUndelete(List<Contact> TriggerNew , 
                                  Map<Id, Contact> TriggerNewMap) {

    }

} 
