public with sharing class SupportCaseController {
    public Case caseToCreate {get;set;}
    public Id caseId {get;set;}
    public Id relatedRecordId {get;set;}
    public SupportCaseController() {
        //Get Id of related record
        this.relatedRecordId = ApexPages.currentPage().getParameters().get('id');
        // Instantiate new case
        this.caseToCreate = new Case(relatedRecord__c = relatedRecordId);

    }

    public void insertCase() {
        List<Case> createdCases = CaseService.createCases(new List<Case>{caseToCreate});
        caseId = createCases[0].Id;
        goToCasePage();
    }

    public static pageReference goToCasePage() {
        pageReference pageRef = new pageReference(new Case(Id= caseId));
        pageRef.setRedirect(true);
        return pageRef;
    }
}
