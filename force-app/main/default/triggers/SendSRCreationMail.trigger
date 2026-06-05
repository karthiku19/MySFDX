trigger SendSRCreationMail on Service_Request__c (After insert) {
    
    List<Id> SrId = new List<Id>();
    
    for(Service_Request__C item : trigger.new)
    {
        SrId.add(item.Id);
    }

    List<Service_Request__C> SS = [Select Type__C,Area__C,Sub_Area__C,Account__r.Contact_Email__c,Account__r.Name from Service_Request__C  where Id IN:SrId] ;
    
    if(ss.size()>0)
    {
        Service_Request__C SR = ss[0];
        if(SR.Account__r.Contact_Email__c != null)
        {
             String address = SR.Account__r.Contact_Email__c;
                String subject = 'Create Notification';
                String message = 'Dear ' + SR.Account__r.Name +
                    'SR of Type : "' + SR.Type__C + '" AND Area:' +
                    SR.Area__C + ' Has been Created! \n\n' +
                    'Please wait for the updates!';
                EmailManager.sendMail(address, subject, message);
        }
    }
    
    

}