public class AddExp {
	public Final Tour_Expense__c PPL;
    Public static String ExpId;
   // Public static String TripId{get; set;}
    public Decimal Amt {get; set;}
    public AddExp (ApexPages.StandardController con){
        this.PPL = (Tour_Expense__c)con.getRecord();
    }
    
        public string People1 {get;set;}
    public List<String> banks{get;set;}
    public String TripId;
    
    // public String ExpId{get;set;}    
  
 public List<SelectOption> getPeople1  {get
 {  
      //string TourId = 'a0U7F000009cZ4iUAE';
     TripId = apexpages.currentpage().getparameters().get('TripId');
      system.debug(TripId);
       List<People__c> PPL1 = [Select Name from People__c where Tour__c =: TripId];
        List<SelectOption> options = new List<SelectOption>(); 
        for(Integer i=0;i<PPL1.size();i++)
        {
            options.add(new SelectOption(PPL1[i].Name,PPL1[i].Name));
        }
		return options;        
    }
    set; }  
    
    public PageReference Next()
    {
		insert PPL;  
		ExpId = PPL.Id;
        Amt = PPL.Amount__c;
        
       // system.debug(ExpId);
       
         PageReference pg = new PageReference('/apex/AddingthePeople');     
        //Pagereference pg =  new Pagereference('/apex/AddingthePeople');
       // pg.getParameters().put(ExpId, ExpId);
        return pg;
    }    
    
    Public PageReference Calculate()
    {
        String theId = TripId;
         PageReference returnPage = new PageReference('/' + theId);
        returnPage.setRedirect(true);
        system.debug('banks='+banks);
        system.debug('Amt='+Amt);
		Decimal NumOfMemSelc = banks.size();
        system.debug('NumOfMemSelc='+NumOfMemSelc);
        Decimal AmounttoBeDistributed = Amt/NumOfMemSelc ;
        system.debug('AmounttoBeDistributed='+AmounttoBeDistributed);
        Decimal CurrentowedAmount;
        Decimal NewowedAmount;
        People__c MemberName ;
        for(Integer i=0;i<NumOfMemSelc;i++)
        {
            MemberName = [Select Amount_Owed_by_Me__c from People__c where Name=:banks[i] ];
            system.debug('MemberName='+banks[i]);
            system.debug(banks);
        	CurrentowedAmount = MemberName.Amount_Owed_by_Me__c;
            system.debug('CurrentowedAmount='+CurrentowedAmount);
            if(CurrentowedAmount != null)
            {
                NewowedAmount = CurrentowedAmount+AmounttoBeDistributed;
            }
            else
            {
                NewowedAmount = AmounttoBeDistributed;
            }
            
            system.debug('NewowedAmount='+NewowedAmount);
            MemberName.Amount_Owed_by_Me__c = NewowedAmount;
            update MemberName;
           // 
        }

        return returnPage;
    }
    
}