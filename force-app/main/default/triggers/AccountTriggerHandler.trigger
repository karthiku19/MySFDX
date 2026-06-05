trigger AccountTriggerHandler on Account (before insert) {
    
    if( Trigger.isInsert ){
        if(Trigger.isBefore) {
            for(Account accRec : trigger.New){
               String parentAccountId = accRec.ParentId;
               String currentActId = accRec.Id;
               String toplevelAccountId = null;
               integer hierarchyCount = 1;
                if(parentAccountId != null && parentAccountId != ''){
                    while (parentAccountId != null && parentAccountId != ''){
                        string currentparentAccountId = parentAccountId;
                        parentAccountId = [Select Id,ParentId from account where Id =: parentAccountId ].ParentId;
                        hierarchyCount = hierarchyCount +1;
                        if(parentAccountId == null || parentAccountId == ''){
                            toplevelAccountId = currentparentAccountId;
                            
                        }
                    }	
				}
                else{
                    accRec.Hierarchy_Level__c = 1;
                }
                
                if(toplevelAccountId != null){
                    accRec.TopLevelAccount__c = toplevelAccountId;
                    accRec.Hierarchy_Level__c = hierarchyCount;
                }

            }
          
        }
	}
}