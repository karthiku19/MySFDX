global class AccountGitStatusBatchScheduler implements Schedulable {

    // Scheduled via: System.schedule('Account Git Status Daily Batch', '0 0 0 * * ?', new AccountGitStatusBatchScheduler());
    global void execute(SchedulableContext sc) {
        Database.executeBatch(new AccountGitStatusBatch(), 200);
    }
}
