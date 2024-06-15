global with sharing class CaseService {

    global static void closeCases(Set<Id> idCases, String closeReason){
        if (idCases == null || idCases.size() == 0)
            throw new  CaseServiceException('There arent records to processed');

        List<Case> casesToUpdate = new List<Case>();

        for (Case caso: [ SELECT Id, Status, Reason FROM Case WHERE Id in :idCases ]){
            caso.Status = 'Closed';
            caso.Reason = closeReason;
            casesToUpdate.add(caso);
        }

        SavePoint sp = Database.setSavepoint();
        try {
            update casesToUpdate;
        } catch (Exception e) {
            Database.rollback(sp);
            throw e;
            
        }
    }

    public class CaseServiceException extends Exception{}
}