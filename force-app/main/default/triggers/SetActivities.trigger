trigger SetActivities on Service_Request__c (after update) {
    
        List<Id> Ids = new List<Id>();
    String SRStatus ;
    String sType;
    String sArea;
    String sSubArea;
    String sId;
    
    
    for(Service_Request__c SR:trigger.new)
    {
        if(SR.Status__c=='Pending')
        {
           	Ids.add(SR.Id);
            sType = SR.Type__c;
            sArea = SR.Area__c;
            sSubArea = SR.Sub_Area__c;
            sId = SR.Id;
            system.debug(Ids);
            system.debug(sType);
            system.debug(sArea);
            system.debug(sSubArea);
            
        }
        
        if(Ids.size()>0)
        {
         List<Activity_Template__c> ActTemp = [Select Temp_Name__c from Activity_Template__c where SR_Type__c =:sType AND SR_Area__c =:sArea AND SR_Sub_Area__c=:sSubArea];
         system.debug(ActTemp);   
         Activity_Template__c TempId = ActTemp[0]; 
         List<Activity_Template_List__c> ActTempList = [Select Type__c,Status__c,Description__c from Activity_Template_List__c where Activity_Template__c =:TempId.Id ];
         system.debug(ActTempList);   
         List<Action__c> LstAct = new List<Action__c>();
         String ActType;
         String ActStatus;
         String ActDescription;
            
         
         for(Integer i=0;i<ActTempList.size();i++)
         {
             Activity_Template_List__c Act = ActTempList[i];
             ActType = Act.Type__c;
             ActStatus = Act.Status__c;
             ActDescription = Act.Description__c;
             Action__c InsAct = new Action__c(Type__c=ActType,Status__c=ActStatus,Description__c=ActDescription,Service_Request__c=sId);
             insert InsAct;
             
             
         } 
    }
}


}