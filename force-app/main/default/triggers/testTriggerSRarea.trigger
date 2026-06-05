trigger testTriggerSRarea on Service_Request__c (after insert) {
  
  
        
     for(Service_Request__c SRT : trigger.new)
    {
        if(SRT.Type__c == 'Order' && SRT.Area__c == 'Order1' && SRT.Sub_Area__c == 'SubOrder11' && SRT.Status__c == 'Open')
        {
           Account Act = [Select SLASerialNumber__c from Account where Id =: SRT.Account__c];
            Act.SLASerialNumber__c = 'ETST';
            update Act;
           
            
        }
    }
    
}