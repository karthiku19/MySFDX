public class QueueClassforDeletion implements Queueable{
    public void execute(QueueableContext context) {
        List<Object_to_be_deleted__mdt> Objectstobedeleted = [Select ObjectName__c,Sequence__c from Object_to_be_deleted__mdt];
        Objectstobedeleted.sort();
        List<String> ListObjectName = new List<String>();
		Integer NumofObjectsobtained = Objectstobedeleted.size();
        for(Integer i=0;i<Objectstobedeleted.size();i++)
        {
           ListObjectName.add(Objectstobedeleted[i].ObjectName__c);
        }     
        system.debug(ListObjectName);
		 list<sObject> lstDeleteRecords = new list<sObject>();
		for(string strObjectName : ListObjectName)
			{
				for(sObject objsObject : database.query('Select Id from ' + strObjectName + ' where for_delete_c__c = true'))
				{
						lstDeleteRecords.add(objsObject);        
				}
			}
		lstDeleteRecords.sort();
		delete lstDeleteRecords;
	}
}