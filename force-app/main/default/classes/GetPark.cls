public class GetPark {
    private Final Service_Request__c QRT;
    public String Park {get; set;}
    public string [] Countries {get;set;}
    public String Answer {get;set;}
    String country = null;
    public GetPark(ApexPages.StandardController con)
    {
        this.QRT = (Service_Request__c)con.getRecord();
    }
    
    public List<SelectOption> getCountryPark()
    {
       
       // Service_Request__c ActId = [Select Account__c from Service_Request__c where Id =: QRT.Id ];
        Service_Request__c ActId = [Select Account__c from Service_Request__c where Id ='a067F000005vIU4QAM' ];
        string AccountId = ActId.Account__c;
       // system.debug(AccountId);
        Account ActCountry = [Select BillingCountry from Account where Id =: AccountId ];
        string Country = ActCountry.BillingCountry;
       // system.debug(Country);
        parksServices.ParksImplPort test1 = new parksServices.ParksImplPort();
		Countries = test1.byCountry('India');
	//	Countries = test1.byCountry('India');
       // system.debug(Country);
        List<SelectOption> options = new List<SelectOption>(); 
        for(Integer i=0;i<Countries.size();i++)
        {
            options.add(new SelectOption(Countries[i],Countries[i]));
        }
        
        
        
		return options;        
    }
    public String getCountry() {
            return country;
    }
    
   public Pagereference SetthePark()
    {
        system.debug(Park);
    	Pagereference pg =  new Pagereference('/apex/SuccessUpdatePark'); 
    	QRT.Favourite_Park__c = Park;
        update QRT;
        //ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING,'Favourite Park has been set!');
         //ApexPages.addMessage(myMsg);
       //  ApexPages.addMessage(ApexPages.AddMessage(ApexPages.severity.WARNING,'Favourite Park has been set!'));
       // ApexPages.addMessage(ApexPages.AddMessage('Favourite Park has been set!'));
      return pg;
       
       
    }  
}