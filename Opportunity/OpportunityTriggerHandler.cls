public class OpportunityTriggerHandler {
    
    public static void BeforeInsert(List<Opportunity> TriggerNew) {

    }

    public static void BeforeUpdate(List<Opportunity> TriggerNew,
                                    List<Opportunity> TriggerOld, 
                                 Map<Id, Opportunity> TriggerNewMap, 
                                Map<Id, Opportunity> TriggerOldMap) {
     
    }

    public static void BeforeDelete(List<Opportunity> TriggerOld, 
                                 Map<Id, Opportunity> TriggerOldMap) {

    }

    public static void AfterInsert(List<Opportunity> TriggerNew , 
                               Map<Id, Opportunity> TriggerNewMap) {

    }

    public static void AfterUpdate(List<Opportunity> TriggerNew,
                                   List<Opportunity> TriggerOld,
                                Map<Id, Opportunity> TriggerNewMap,
                                Map<Id, Opportunity> TriggerOldMap) {

    }

    public static void AfterDelete(Map<Id, Opportunity> TriggerOldMap) {

    }

    public static void AfterUndelete(List<Opportunity> TriggerNew , 
                                  Map<Id, Opportunity> TriggerNewMap) {

    }

} 
