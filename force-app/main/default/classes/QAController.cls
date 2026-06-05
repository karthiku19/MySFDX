public class QAController {

 
     public List<Questionare__c> QA { get; set; }

    public List<Questionare__c> getQA() {
        if(QA == null)
            QA = [SELECT Question__c FROM Questionare__c ];
        return QA;
    }
	
   
   
   
    
}