@RestResource(urlMapping = '/executebatch/*')
global class CleanCreatedSR {
///services/apexrest/executebatch -- URL in WOrkbench
    global class RequestWrapper {
        
    }
    // RESPONSE PARAMETERS 
    global class ResponseWrapper {
        //Select for_delete_c__c,name from Service_Request__c where for_delete_c__c = true
    }
    
@HttpGet
  /*  global static ResponseWrapper executeBatch() 
    {
        DeleteUserCreatedRecordsBATCH obj=new DeleteUserCreatedRecordsBATCH();
        Database.executeBatch(obj);
        return null;
    }*/

    global static ResponseWrapper executeQueue() 
    {
      
        return null;
    }

}