public with sharing class CaseService {
    public CaseService() {

    }

    public static List<Case> createCases(List<Case> casesToCreate) {
        try{
            insert casesToCreate;
        } catch(Exeption e) {
            Logger log = new Logger(new List<Exception> {e});
            log.insertRecords();
            throw exception;
        } finally {
            return casesToCreate;
        }
    }
}
