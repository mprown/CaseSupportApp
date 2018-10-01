public with sharing class CaseSelector {
    
    public List<Case> getCasesByParentId(Id relatedRecordId)
    {
        return [SELECT Id, Description, RelatedRecordId__c FROM Case WHERE RelatedRecordId__c =:relatedRecordId];
    }
}
