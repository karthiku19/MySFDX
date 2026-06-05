public class WSController1 {
    
    private Final Service_Request__c SRT;
   // public Service_Request__c SRT ( get; set; }
   Double result;
    public WSController1 (ApexPages.StandardController con){
        this.SRT = (Service_Request__c)con.getRecord();
    }
	
    
   public Double getdoAdd()
    
    {
        

calculatorServices.CalculatorImplPort calculator = new  calculatorServices.CalculatorImplPort();
        
  // Service_Request__c test12  = new Service_Request__c();
 String x = SRT.Name;
Double myDecimal = Double.valueOf(x);
Double y = 2.0;
result = calculator.doAdd(myDecimal,y);
       	
      
         return result;

    }
    
 //   PageReference returnPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL'));  
    public PageReference udpateSR()
    {
      //Pagereference pg =  new Pagereference('/apex/LastSRPage'); 
     // PageReference returnPage = new PageReference(ApexPages.currentPage().getParameters().get('retURL'));  
     String theId = SRT.Id;
     PageReference returnPage = new PageReference('/' + theId);
	returnPage.setRedirect(true);
          SRT.Status__c = 'In Progress';
        SRT.Sub_Status__c = 'Order Created';
        SRT.Integration_Id__c = result;	
        update SRT;
        return returnPage;
       
       
    }    
    
   
   
    
    
}