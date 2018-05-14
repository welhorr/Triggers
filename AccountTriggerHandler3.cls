public class AccountTriggerHandler  {
        //May 3 - Task 6: Whenever the owner of any account changes then all related account
        // (Parent -> parent Parent -> grandparent parent) must change with the new owner.

        //1- set of entered accounts that have parent
        Set<Id> currentAccIds = new Set<Id>();
        for (Account acc : TriggerNew) {
            if (acc.ParentId != null ) currentAccIds.add(acc.Id);
        }

        System.debug('Set is: ' +currentAccIds);

        List<Account> currentAccsList = [SELECT Id, OwnerId, ParentId, Parent.ParentId, Parent.OwnerId, Parent.Parent.OwnerId
                                            FROM Account WHERE Id IN :currentAccIds];
        //System.debug('List is: ' +currentAccsList +' and parentId of element 1 is: ' +currentAccsList.get(0).ParentId);

        Map<Id, Id> accIdToOwnerIdMap = new Map<Id, Id>();
        for (Account acc : currentAccsList) {
            accIdToOwnerIdMap.put(acc.Id, acc.OwnerId);
        }
        //System.debug('Map is: ' +accIdToOwnerIdMap);

        List<Account> modifiedAccs = new List<Account>();

        for (Account acc : currentAccsList) {
            if (acc.ParentId != null) {
            System.debug('acc.parentid is: '+acc.ParentId);
                Account parAcc = new  Account();
                parAcc.Id = acc.ParentId;
                parAcc.OwnerId = accIdToOwnerIdMap.get(acc.Id);
                modifiedAccs.add(parAcc);
            }
            if (acc.Parent.ParentId != null) {
                Account parAcc = new  Account();
                parAcc.Id = acc.Parent.ParentId;
                parAcc.OwnerId = accIdToOwnerIdMap.get(acc.Id);
                modifiedAccs.add(parAcc);
            }

        }
        //System.debug('modifiable List is: ' +modifiedAccs);
        update modifiedAccs;

    }
}
