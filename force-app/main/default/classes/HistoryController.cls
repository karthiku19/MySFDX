public class HistoryController {
    
     public Final Service_Request__c SRT;
     
     public HistoryController (ApexPages.StandardController con){
        this.SRT = (Service_Request__c)con.getRecord();
    }
    
    public List<AssetHistory> Audit1 {get
    {
        String SrId = SRT.Id ;
        Service_Request__c SRActId = [Select Account__c from Service_Request__c where Id =: SrId];
        String ActId = SRActId.Account__c;
        Account AssetId = [Select Asset__c from Account where Id =: ActId];
        String AstId = AssetId.Asset__c;     
        Audit1 = [SELECT Field,CreatedDate,NewValue,OldValue FROM AssetHistory where Field = 'Prepaid_Balance__c' and Asset.Id =:AstId  ];
        system.debug(Audit1);
        return Audit1;
    }
	set;}
    
   /* public List<AssetHistory> GetHistory()
    {
        String SrId = SRT.Id ;
        Service_Request__c SRActId = [Select Account__c from Service_Request__c where Id =: SrId];
        String ActId = SRActId.Account__c;
        Account AssetId = [Select Asset__c from Account where Id =: ActId];
        String AstId = AssetId.Asset__c;      
        Audit1 = [SELECT Field,NewValue,OldValue FROM AssetHistory where Field = 'Prepaid_Balance__c' and Asset.Id =:AstId  ];
        system.debug(Audit1);
        return Audit1;
   */ //}

}