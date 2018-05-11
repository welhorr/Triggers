public class OpportunityTriggerHandler {
    //BeforeUpdate: trigger.New, trigger.Old, Trigger.NewMap, Trigger.OldMap
    public static void BeforeUpdate(List<Opportunity> TriggerNew, 
                                    List<Opportunity> TriggerOld, 
                                    Map<Id, Opportunity> TriggerNewMap, 
                                    Map<Id, Opportunity> TriggerOldMap) {
        ////Task 4: Users can only move opportunity one stage upper or lower
        //1- Create List of all bad Opps that moved more than 1 stage up or down
        List<Opportunity> badOpps = new List<Opportunity>();
        Integer oppSize = TriggerNew.size();
        for (Integer i = 0; i < oppSize; i++) {
            if (TriggerOld.get(i).StageName == 'Prospecting' && ((TriggerNew.get(i).StageName != 'Prospecting') && (TriggerNew.get(i).StageName != 'Qualification'))) {
                badOpps.add(TriggerNew.get(i));
            }
            else if (TriggerOld.get(i).StageName == 'Qualification' && ((TriggerNew.get(i).StageName != 'Prospecting') && (TriggerNew.get(i).StageName != 'Needs Analysis') && (TriggerNew.get(i).StageName != 'Qualification'))) {
                badOpps.add(TriggerNew.get(i));
            }
            else if (TriggerOld.get(i).StageName == 'Needs Analysis' && ((TriggerNew.get(i).StageName != 'Qualification') && (TriggerNew.get(i).StageName != 'Value Proposition') && (TriggerNew.get(i).StageName != 'Needs Analysis'))) {
                badOpps.add(TriggerNew.get(i));
            }
            else if (TriggerOld.get(i).StageName == 'Value Proposition' && ((TriggerNew.get(i).StageName != 'Needs Analysis') && (TriggerNew.get(i).StageName != 'Id. Decision Makers') && (TriggerNew.get(i).StageName != 'Value Proposition'))) {
                badOpps.add(TriggerNew.get(i));
            }
            else if (TriggerOld.get(i).StageName == 'Id. Decision Makers' && ((TriggerNew.get(i).StageName != 'Value Proposition') && (TriggerNew.get(i).StageName != 'Perception Analysis') && (TriggerNew.get(i).StageName != 'Id. Decision Makers'))) {
                badOpps.add(TriggerNew.get(i));
            }
        }

        //2- put the bad opps in a Map
        Map<Id, Opportunity> badOppMap = new Map<Id, Opportunity>(badOpps);

        //3- Loop through the list of added Opp and add error if it exists in the bad Map
        for (Opportunity opp : TriggerNew) {
            if (badOppMap.containsKey(opp.Id)) {
                opp.addError('You cannot move an Opportunity more than 1 stage up or down!');
            }
        }
    }
}
