public class TestupdateSR {
    
    public Service_Request__c SRT {get; set;}
   public String FavPark {get; set;}
    
     public TestupdateSR (ApexPages.StandardController con){
        this.SRT = (Service_Request__c)con.getRecord();
    }
    
    public void setexecute()
    {
        SRT.Favourite_Park__c = FavPark;
        update SRT;
    }

}