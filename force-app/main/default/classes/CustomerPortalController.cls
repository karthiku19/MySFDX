public class CustomerPortalController {
    
    public Final Sales_Order__c SO;
    public Sales_Order__c SalesOrder {get; set;}
    public Account Acct {get; set;}
    //public List<Price_List_Item__c> PriceListItem {get; set;}
    public List<Order_Item__c> OrderListItem {get; set;}
    
     public CustomerPortalController (ApexPages.StandardController con)
     {
        this.SO = (Sales_Order__c)con.getRecord();
        SalesOrder = [Select Account__c,Contract_Start_Date__c,Contract_End_Date__c,Name,Price_List__C from Sales_Order__c where Id =: SO.Id];
        system.debug(SalesOrder);
        String AccountId = SalesOrder.Account__c;
        system.debug('AccountIs'+SalesOrder);
        Acct = [Select Name,ShippingState,ShippingStreet,ShippingCity,ShippingPostalCode,ShippingCountry,AccountNumber,Contact_Email__c from Account where Id =: AccountId] ;
        system.debug('Acct'+Acct);
        String PriceListId = SalesOrder.Price_List__c;
        system.debug('this.SO'+this.SO);
        //PriceListItem = [Select Product_Name__c,Produkt__c,Rate_Code__c,Start_Date__c,Price__c from Price_List_Item__c where Price_List__c	 =: PriceListId] ;
        OrderListItem = [Select ProductName__c,Service_Cost__c,Rate_Code__c,Start_Date__c,Status__c,End_Date__c from Order_Item__c where Sales_Order__c =: SO.Id] ;
         
         
         
    }
}