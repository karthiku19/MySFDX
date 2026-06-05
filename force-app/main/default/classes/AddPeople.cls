public class AddPeople {
  //  private Final People__c QRT;
   // public String Park {get; set;}
    public string People1 {get;set;}
   //  public String banks2SF{get;set;} 
    public List<String> banks{get;set;}
     public String ExpId{get;set;}
    
 //  public List<SelectOption> getPeople1  {get;set;}
 //   public String Answer {get;set;}
 //   String country = null;
/*    public AddPeople(ApexPages.StandardController con)
    {
        this.QRT = (People__c)con.getRecord();
    } */
    
 public List<SelectOption> getPeople1  {get
 {
     
     
       string TourId = 'a0U7F000009cZ4iUAE';
         system.debug('asdasdsa');
     system.debug(ExpId);
     
           //QRT.Tour__c;
       List<People__c> PPL1 = [Select Name from People__c where Tour__c =: TourId];
       // system.debug(PPL1);
        List<SelectOption> options = new List<SelectOption>(); 
        for(Integer i=0;i<PPL1.size();i++)
        {
            options.add(new SelectOption(PPL1[i].Name,PPL1[i].Name));
        }
		return options;        
    }
    set; }  
    //}
    
    Public void  Calculate()
    {
		
    //  Strig test  = Cache.Session.get('ExpId');
          system.debug(Cache.Session.get('ExpId'));
    }
}