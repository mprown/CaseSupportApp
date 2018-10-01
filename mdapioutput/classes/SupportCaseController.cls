public with sharing class SupportCaseController {
    public static final string baseURL = URL.getSalesforceBaseUrl().toExternalForm();
    public Case caseToCreate {get;set;}
    public Id caseId;
    public Id relatedRecordId {get;set;}
    public SupportCaseController() {
        //Get Id of related record
        this.relatedRecordId = ApexPages.currentPage().getParameters().get('id');
        // Instantiate new case
        this.caseToCreate = new Case(relatedRecord__c = baseURL + '/' + relatedRecordId);

    }

    public SupportCaseController(Id relatedRecordId) 
    {
        this.relatedRecordId = relatedRecordId;
        // Instantiate new case
        this.caseToCreate = new Case(relatedRecord__c = baseURL + '/' + relatedRecordId, relatedRecordId__c = relatedRecordId);
    }

    public Id insertCase() {
        List<Case> createdCases = CaseService.createSupportCases(new List<Case>{caseToCreate});
        caseId = createdCases[0].Id;
        FeedItem post = new FeedItem();
            post.ParentId = ApexPages.currentPage().getParameters().get('id');
            post.Body = UserInfo.getName() + ' a case has been created for you';
            post.type = 'LinkPost'; 
            post.LinkUrl = '/' + caseId;
            post.Title = caseToCreate.Subject;
            insert post;
        return createdCases[0].Id;
        
    }

    public pageReference goToCasePage() {
        Id caseId = insertCase();
        String caseURL = baseURL + '/' + caseId;
        pageReference pageRef = new pageReference(caseURL);
        pageRef.setRedirect(false);
        return pageRef;
    }
}
