global class AccountGitStatusBatch implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, Email, Account.Name ' +
            'FROM Contact ' +
            'WHERE Account.Git_Status__c = \'Published\' ' +
            'AND Email != null'
        );
    }

    global void execute(Database.BatchableContext bc, List<Contact> contacts) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for (Contact con : contacts) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{ con.Email });
            email.setSubject('Account Published Notification: ' + con.Account.Name);
            email.setPlainTextBody(
                'Dear ' + con.Name + ',\n\n' +
                'This is to notify you that the account "' + con.Account.Name +
                '" has a Git Status of Published.\n\n' +
                'Best regards,\nSalesforce System'
            );
            emails.add(email);
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }

    global void finish(Database.BatchableContext bc) {
    }
}
