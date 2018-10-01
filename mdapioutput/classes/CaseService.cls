public with sharing class CaseService {
    public CaseService() {

    }

    public static List<Case> createSupportCases(List<Case> casesToCreate) {
        try{
            insert casesToCreate;
            NotificationController.publishNotifications(
            new List<String>{'A support case has been created'}, 
            List<SupportCase__e>.class, 
            SupportCase__e.getSobjectType());
        } catch(Exception e) {
            ExceptionLogger log = new ExceptionLogger(e, CaseService.class.getName());
            log.run();
            throw e;
        } 
            return casesToCreate;
        
    }

    
}
