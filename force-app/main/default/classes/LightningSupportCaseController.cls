public with sharing class LightningSupportCaseController {
    
    @AuraEnabled
    public static case getRecord(Id relatedRecordId){
        SupportCaseController scc = new SupportCaseController(relatedRecordId);
        return scc.caseToCreate;
    }

    @AuraEnabled
    public static Case submitRecord(Case caseToSubmit){
        List<Case> createdCases = CaseService.createSupportCases(new List<Case>{caseToSubmit});
        return createdCases[0];
    }

    @AuraEnabled
    public static void sendNotification(){
        NotificationController.publishNotifications(
            new List<String>{'A support case has been created'}, 
            List<SupportCase__e>.class, 
            SupportCase__e.getSobjectType());
      
    }
}
