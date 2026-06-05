global class PublishOrder {

    webservice static void UpdateSR(String SRnum, Integer IntId,String Status,String SubStatus)
    {
       
        
        
        try
        {
        Service_Request__c SRT;
        SRT = [Select Id from Service_Request__c where Name=: SRnum];
        SRT.Status__c = Status;
        SRT.Sub_Status__c = SubStatus;
        Update SRT;
        }
       
        catch(Exception e)
        {
            system.debug('asdasdasdasdas');
			Service_Request__c SRT2 = new Service_Request__c(Account__c = '0017F00000bobVpQAI',Type__c = 'Order',Area__c = 'Order1',Sub_Area__c = 'SubOrder12');
            insert SRT2; 
        }
          


            
     //   IF(IntId!=0)
      /*  {
            Service_Request__c SRT = [Select Id from Service_Request__c where Integration_Id__c=: IntId];
            SRT.Status__c = Status;
            SRT.Sub_Status__c = SubStatus;
            Update SRT;
    //    }*/
       
    }
    
}