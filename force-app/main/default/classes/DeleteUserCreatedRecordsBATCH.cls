//global class DeleteUserCreatedRecordsBATCH implements Database.Batchable<sObject>
global class DeleteUserCreatedRecordsBATCH implements Database.Batchable<string>
{
  /*  global Database.QueryLocator start(Database.BatchableContext BC)
    {
		string Id1 = 'a067F000005ubtVQAQ';
        String query = 'SELECT Id,Created__c FROM Service_Request__c where Id = \''+String.escapeSingleQuotes(Id1)+'\'';
        //tring query = 'SELECT Id,Created__c FROM Service_Request__c where Integration_Id__c = null';
      /* List<Object_to_be_deleted__mdt> Objectstobedeleted = [Select ObjectName__c,Sequence__c from Object_to_be_deleted__mdt];
        Objectstobedeleted.sort();
        List<String> ListObjectName = new List<String>();
		Integer NumofObjectsobtained = Objectstobedeleted.size();
        for(Integer i=0;i<Objectstobedeleted.size();i++)
        {
           ListObjectName.add(Objectstobedeleted[i].ObjectName__c);
        }     
        system.debug(ListObjectName);*/
        
        
       // system.debug(test);
        
        //system.debug(query);
     //  return Database.getQueryLocator(query);
       // return ListObjectName;
  //  }
	
   /* global void execute(Database.BatchableContext BC, List<Service_Request__c> scope) {
      
		List <Service_Request__c> lstSrv = new list<Service_Request__c>();
        for(Service_Request__c srv : scope)
        {      
          lstSrv.add(srv);
        }
        Delete lstSrv;
        
    }  */
    //global void execute(Database.BatchableContext BC, list<string> lstsObjectName) {
   /* global void execute(Database.BatchableContext BC, List<String> scope) {
    list<sObject> lstDeleteRecords = new list<sObject>();
    for(string strObjectName : lstsObjectName) {
        for(sObject objsObject : database.query('Select Id from ' + strObjectName + ' where for_delete__c = TRUE')) {
            if(lstDeleteRecords.size() < 9998)
                lstDeleteRecords.add(objsObject);
            else {
                bReRun = true;
               break;
            }
        }
    }
    lstDeleteRecords.sort();
    delete lstDeleteRecords;
}*/
    
    
 /*   global void finish(Database.BatchableContext BC)
    {
  
        AsyncApexJob job = [SELECT Id, Status FROM AsyncApexJob WHERE Id =: BC.getJobId()];  
        system.debug(job);
    }*/

////////////////////////////////////////////////////////////////////////////////////////////77
  global Iterable<string> start(Database.BatchableContext BC)
    {
		//string Id1 = 'a067F000005ubtVQAQ';
       // String query = 'SELECT Id,Created__c FROM Service_Request__c where Id = \''+String.escapeSingleQuotes(Id1)+'\'';
        //tring query = 'SELECT Id,Created__c FROM Service_Request__c where Integration_Id__c = null';
       List<Object_to_be_deleted__mdt> Objectstobedeleted = [Select ObjectName__c,Sequence__c from Object_to_be_deleted__mdt];
        Objectstobedeleted.sort();
        List<String> ListObjectName = new List<String>();
		Integer NumofObjectsobtained = Objectstobedeleted.size();
        for(Integer i=0;i<Objectstobedeleted.size();i++)
        {
           ListObjectName.add(Objectstobedeleted[i].ObjectName__c);
        }     
        system.debug(ListObjectName);
        
        
       // system.debug(test);
        
        //system.debug(query);
       //return Database.getQueryLocator(query);
        return ListObjectName;
    }
	
    global void execute(Database.BatchableContext BC, List<Service_Request__c> scope) {
      
		List <Service_Request__c> lstSrv = new list<Service_Request__c>();
        for(Service_Request__c srv : scope)
        {      
          lstSrv.add(srv);
        }
        Delete lstSrv;
        
    }  
    //global void execute(Database.BatchableContext BC, list<string> lstsObjectName) {
    global void execute(Database.BatchableContext BC, List<String> scope) {
    list<sObject> lstDeleteRecords = new list<sObject>();
    for(string strObjectName : scope) {
        for(sObject objsObject : database.query('Select Id from ' + strObjectName + ' where for_delete_c__c = true'))
        {
                lstDeleteRecords.add(objsObject);        
        }
    }
    lstDeleteRecords.sort();
    delete lstDeleteRecords;
}
    
    
   global void finish(Database.BatchableContext BC)
    {
  
        AsyncApexJob job = [SELECT Id, Status FROM AsyncApexJob WHERE Id =: BC.getJobId()];  
        system.debug(job);
    }
}