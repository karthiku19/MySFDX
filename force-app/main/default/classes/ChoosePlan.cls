public class ChoosePlan {
   
     public Final Service_Request__c SRT;
     public String Plan {get; set;}
     
     public ChoosePlan (ApexPages.StandardController con){
        this.SRT = (Service_Request__c)con.getRecord();
    }
    
    public List<Plan__c> Plan1 {get
    {
       /* String SrId = SRT.Id ;
        Service_Request__c SRActId = [Select Account__c from Service_Request__c where Id =: SrId];
        String ActId = SRActId.Account__c;
        Account AssetId = [Select Asset__c from Account where Id =: ActId];
        String AstId = AssetId.Asset__c;  */   
      //  Audit1 = [SELECT Field,CreatedDate,NewValue,OldValue FROM AssetHistory where Field = 'Prepaid_Balance__c' and Asset.Id =:AstId  ];
        Plan1 = [Select Name,Data__c,SMS__c,Voice__c from Plan__c]; 
      //  system.debug(Audit1);
        return Plan1;
    }
	set;}
    
    public void UpdAst()
    {
        system.debug(Plan);
        String mulId = Plan.substring(0,Plan.length()-3);
        system.debug(mulId);
      if(Plan != null && Plan != '' )
       {
            String SrId = SRT.Id ;
            Service_Request__c SRActId = [Select Account__c from Service_Request__c where Id =: SrId];
            String ActId = SRActId.Account__c;
            Account AssetId = [Select Asset__c from Account where Id =: ActId];
            String AstId = AssetId.Asset__c;     
            Asset Ast1 = [SELECT Id,Plan__c from Asset where Id =:AstId  ];
            Ast1.Plan__c = mulId;
            update Ast1;
        } 
        
            }
}