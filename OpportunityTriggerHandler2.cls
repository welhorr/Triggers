public class OpportunityTriggerHandler {
    //AfterInsert: Trigger.new, Trigger.newMap
    public static void AfterInsert(List<Opportunity> TriggerNew , Map<Id, Opportunity> TriggerNewMap) {
        ////Create a Trigger on Opportunity Record which will check if Opportunity has an Account
        // associated or NOT if not then Create an Account with the Opportunity Name
        // followed by Account and associated that account with the Opportunity.

        Map<Id, Account> aMap = new Map<Id, Account>();

        for (Opportunity opp : TriggerNew) {
            if (opp.AccountId == null) {
                Account newAcc = new Account();
                newAcc.Name = opp.Name;
                aMap.put(opp.Id, newAcc);
            }
        }

        if (!aMap.isEmpty()) {
            insert aMap.values();
            List<Opportunity> opportunities = new List<Opportunity>();
            for (Id id : aMap.keySet()) {
                Opportunity newOpp = new Opportunity();
                newOpp.Id = id;
                newOpp.AccountId = aMap.get(id).Id;
                opportunities.add(newOpp);
            }
            update opportunities;
        }


    }

}
