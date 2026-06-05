trigger PostClosureCheck on Service_Request__c (before update) {
    
    //String<Id> Ids = new String<Id>[];
   // List<Id> Ids = new List<Id>();
    //s = new Id;

    string Ids;
    
    for(Service_Request__c asdasd:trigger.new)
    {
      //  Ids.add(asdasd.Id);
        Ids = asdasd.Id;
        String stst = asdasd.Status__c;
        // List<Service_Request__c> status = [Select Status__c from Service_Request__c where Id =:Ids];
       //  Service_Request__c SRT = [Select Status__c from Service_Request__c where Id =:Ids];
        
 
     //   Service_Request__c Sts = status[0];
       	 If(stst == 'Closed')
        {
            asdasd.addError('Record Cannot be Edited after SR is Closed!');
		}
   
    }
    
   
    
    
    
    
    
    
    

}