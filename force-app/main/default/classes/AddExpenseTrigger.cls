public class AddExpenseTrigger {
	public Final Tour__c PPL;
    public AddExpenseTrigger (ApexPages.StandardController con){
        this.PPL = (Tour__c)con.getRecord();
    }
    
    public PageReference Trig()
    {      
       // system.debug('YESSSs');
        // People__c test = [Select Tour__c from People__c where Id=:PPL.Id];
        // String TripId = test.Tour__c;
       // system.debug(TripId);
         PageReference pg = new PageReference('/apex/AddExpensePage?TripId='+PPL.Id);  
         pg.getParameters().put('TripId',PPL.Id);
         pg.setRedirect(TRUE);
        return pg;
    }    

}