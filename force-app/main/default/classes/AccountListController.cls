public with sharing class AccountListController {
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getAccounts() {
        List<Account> accounts = [
            SELECT Id, Name, Industry, Phone, AnnualRevenue, Rating
            FROM Account
            ORDER BY Name ASC
            LIMIT 3
        ];
        Integer totalCount = [SELECT COUNT() FROM Account];
        return new Map<String, Object>{
            'accounts'   => accounts,
            'totalCount' => totalCount
        };
    }
}
