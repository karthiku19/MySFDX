public class AutoOwnerAssignment {
	 @InvocableMethod
  	public static void AutoAssignment(List<Id> SrId)
    {
		
      // User[] AssignedUsrs = [Select Id from User where Id IN (Select Owner__c from Service_Request__c where Owner__c != null)];
  	   User[] UnAssignedUsrs = [Select Id from User where Id NOT IN (Select Owner__c from Service_Request__c where Owner__c != null and Status__c !='Closed') and UserRoleId != null];
		system.debug(UnAssignedUsrs.size());
        String UserEmail;
        String UserName;
        String SRNum;
        
        If(UnAssignedUsrs.size()==0)
      	 {
           AggregateResult[] SR = [Select Count(Id)am, Owner__c from Service_Request__c where Owner__c != '' and Status__c !='Closed' group by Owner__c ORDER BY Count(Id)];
           String str = String.valueOf(SR[0].get('Owner__c'));
            Service_Request__c SRT = [Select Owner__c,Name from Service_Request__c where Id =: SrId ];
            SRT.Owner__c = str;
            SRNum  = SRT.Name;
            User usr = [Select Name,Email from user where Id =: str]  ;   
            UserName = usr.Name;
            UserEmail = usr.Email;
            update SRT;
     	 }
        else
        {
            String str2 = String.valueOf(UnAssignedUsrs[0].get('Id'));
            Service_Request__c SRT = [Select Owner__c from Service_Request__c where Id =: SrId ];
            SRT.Owner__c = str2;
            SRNum  = SRT.Name;
            User usr = [Select Name,Email from user where Id =: str2]  ;  
            UserName = usr.Name;
            UserEmail = usr.Email;
            update SRT;
        }
        
        String EmailSubject = 'SR:'+SRNum+'has been assigned to you!';
        String EmailBody = 'Hi' +UserName+',\nSR:'+SRNum+' has been assigned to you. Please check.\nRegards,\nEntel.';
		EmailManager.sendMail(UserEmail,EmailSubject,EmailBody);
        
       
     
        
        
       
    }
    
}