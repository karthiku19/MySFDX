public class QuestionareController {
    
    private Final Service_Request__c QRT;
     //List<String> twtt =new list<String>();
    public List<String> twtt{get;set;}
  //  public String[] Answer = new String[2] {get;set;};
    public String[] Answer{get;set;}
    public QuestionareController (ApexPages.StandardController con){
        this.QRT = (Service_Request__c)con.getRecord();
    }
    
    //private Final Service_Request__c
     
    public List<String> getQuestions()
    {
        //String Acc = new String();
        Service_Request__c ActId = [Select Account__c from Service_Request__c where Id =: QRT.Id ];
        String Acc = ActId.Account__c;
      // String Acc = '0017F00000bobVpQAI';
        List<Questionare__c> Qnare = [Select Question_Set__c from Questionare__c where Account__c = : Acc];
		integer ste = Qnare.size();
        List<Question_Set__c> qe;
        List<Question_Set__c> asdasd; 
        twtt = new List<String>();
       
        String abcs;
        for(Integer i=0;i<Qnare.size();i++)
        {
            Questionare__c tra = Qnare[i];           
            asdasd = [Select Name from Question_Set__c where Id = : tra.Question_Set__c];
            abcs = asdasd[0].Name;
		    twtt.add(abcs);
        }
         return(twtt);

	}
    public void CheckforCorrectness()
    {
     // String strPageNumber = ApexPages.CurrentPage().getParameters().get('prmPageNumber');
     //Integer xis = Answer.size();
    // Answer = 'asdadsasd';
       system.debug(Answer);    
    }
    
 
}