trigger MassiveSRClosure on Contingency__c (after update) {
    
    Id ContId ;
    
    for(Contingency__c Cont:trigger.new)
    {
        if(Cont.Status__c == 'Cancelled')
        {
            ContId = Cont.Id;
            
            List<Service_Request__C> SRList = [Select Id from Service_Request__C where Contingency__c=:ContId];
            for(Integer i=0;i<SRList.size();i++)
            {
                Service_Request__C SRId = SRList[i];
                SRId.Status__c = 'Cancelled';
                update SRId;
                
            }
            
        }
    }

}