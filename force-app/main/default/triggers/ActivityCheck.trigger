trigger ActivityCheck on Service_Request__c (before Update) {
    
    List<Id> Ids = new List<Id>();
    String SRStatus ;
    
    for(Service_Request__c SR:trigger.new)
    {
        if(SR.Status__c=='Closed')
        {
           	Ids.add(SR.Id);
        }
        
        if(Ids.size()>0)
        {
         List<Action__c> abc = [Select Status__c from Action__C where Service_Request__C IN:Ids];
         for(Integer i=0;i<abc.size();i++)
         {
             Action__c Sts = abc[i];
             if(Sts.Status__c != 'Closed')
             {
                 SR.addError('Please close all the activities under SR!');
             }
         }  
    }
}

}