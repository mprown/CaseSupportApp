public with sharing class CaseLogger extends Logger{
    Case cse {get;set;}
    List<Case> cases {get;set;}
    public CaseLogger(Case cse) 
    {

    }

    public CaseLogger(List<Cases> cases)
    {

    }
    public override void run()
    {

    }
    public override void createLogRecord()
    {

    }
    public override void createLogRecords()
    {

    }
    public override void updateLogRecord()
    {

    }
    public override void updateLogRecords()
    {

    }
    public static void publishNotifications(List<String> messages)
    {
        List<Notification__e> notifications = new List<Notification__e>();
        for (String message: messages) {
            notifications.add(new Notification__e(Message__c = message));
        }
        List<Database.SaveResult> results = EventBus.publish(notifications);
        // Inspect publishing results
        for (Database.SaveResult result : results) {
            if (!result.isSuccess()) {
                for (Database.Error error : result.getErrors()) {
                    System.debug('Error returned: ' +
                                 error.getStatusCode() +' - '+
                                 error.getMessage());
                }
            }
        }
    }
}
