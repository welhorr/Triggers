public class AttachmentTriggerHandler {
    
    public static void BeforeInsert(List<Attachment> TriggerNew) {

    }

    public static void BeforeUpdate(List<Attachment> TriggerNew,
                                    List<Attachment> TriggerOld, 
                                 Map<Id, Attachment> TriggerNewMap, 
                                Map<Id, Attachment> TriggerOldMap) {
     
    }

    public static void BeforeDelete(List<Attachment> TriggerOld, 
                                 Map<Id, Attachment> TriggerOldMap) {

    }

    public static void AfterInsert(List<Attachment> TriggerNew , 
                               Map<Id, Attachment> TriggerNewMap) {

    }

    public static void AfterUpdate(List<Attachment> TriggerNew,
                                   List<Attachment> TriggerOld,
                                Map<Id, Attachment> TriggerNewMap,
                                Map<Id, Attachment> TriggerOldMap) {

    }

    public static void AfterDelete(Map<Id, Attachment> TriggerOldMap) {

    }

    public static void AfterUndelete(List<Attachment> TriggerNew , 
                                  Map<Id, Attachment> TriggerNewMap) {

    }

}
