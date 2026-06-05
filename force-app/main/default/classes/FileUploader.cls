public class FileUploader {
    private Final Account_Summary__c QRT;
     public string nameFile{get;set;}
    public List<String> Debit{get;set;}
    public List<String> Credit{get;set;}
    public List<String> Balance{get;set;}
    public List<String> Dummy{get;set;}
    List<String> VariableStr{get;set;}
    public List<List<String>> CompleteString{get;set;}
    public List<MyWrapper> wrapper {get; set;}
    
    public Blob contentFile{get;set;}
  //  String csvBody = EncodingUtil.base64Encode(contentFile);
    String[] filelines = new String[]{};
    Integer TotalDebitted = 0;
    Integer TotalCreditted = 0;
    Integer FinalBalance =0;

    
    List<Account> accstoupload;
    public FileUploader(ApexPages.StandardController con)
    {
        this.QRT = (Account_Summary__c)con.getRecord();
    }
    
    public void ReadFile()
    {
         nameFile=contentFile.toString();
       //nameFile= EncodingUtil.base64Encode(contentFile);
       //nameFile = EncodingUtil.urlEncode(nameFile, 'UTF-8');
       List<String> Splitbynewline = nameFile.split('\n');
       List<String> Spiltbycomma;
     //  List<String> Splitbynewline2;
       
       
       Integer TotalRows = Splitbynewline.size();
       for(Integer i=1;i<Splitbynewline.size();i++)
       {
           Spiltbycomma = Splitbynewline[i].split(',');
           if(Spiltbycomma[0] != '')
               {
                   TotalDebitted = TotalDebitted + Integer.valueOf(Spiltbycomma[0]);
               }
           
           if(Spiltbycomma[1] != '')
               {
                  TotalCreditted = TotalCreditted + Integer.valueOf(Spiltbycomma[1]);
               }
           if(i==Splitbynewline.size()-1)
              {	
                 system.debug(Spiltbycomma[2]);
                 FinalBalance =  Integer.valueOf(Spiltbycomma[2]);
              }
          
       }
        system.debug(TotalDebitted);
        QRT.Total_Debited__c = TotalDebitted;
        system.debug(TotalCreditted);
        QRT.Total_Creditted__c = TotalCreditted;
        system.debug(FinalBalance);
        QRT.Current_Balance__c = FinalBalance;
        update QRT;
    
      
    }   
    
     public Pagereference viewexcel()
     {
      Pagereference pg =  new Pagereference('/apex/ExcelListViewPFV');
        nameFile=contentFile.toString();
       //nameFile= EncodingUtil.base64Encode(contentFile);
       //nameFile = EncodingUtil.urlEncode(nameFile, 'UTF-8');
       List<String> Splitbynewline = nameFile.split('\n');
         system.debug(Splitbynewline);
         VariableStr = Splitbynewline;
       List<String> Spiltbycomma;
       return pg;
     }
    
        public Pagereference getPlan1()
    {
        Pagereference pg =  new Pagereference('/apex/ExcelListViewPFV');
          nameFile=contentFile.toString();
       //nameFile= EncodingUtil.base64Encode(contentFile);
       //nameFile = EncodingUtil.urlEncode(nameFile, 'UTF-8');
      // List<String> Splitbynewline = nameFile.split('\n');
        List<String> Splitbynewline = nameFile.split('\n');
        // system.debug(Splitbynewline);
         VariableStr = Splitbynewline;
      system.debug(VariableStr);
        system.debug(VariableStr.size());
       List<String> Spiltbycomma;
       List<String> AfterSpiltbycomma = new List<String>();  
        Debit =new List<String>(); 
        Credit =new List<String>(); 
        Balance =new List<String>(); 
        Dummy =new List<String>(); 
	   Set<String> s1 = new Set<String>();
       for(Integer i=1;i<VariableStr.size();i++)
       {
        
               Spiltbycomma= VariableStr[i].split(','); 
//           		system.debug(Spiltbycomma);
//                system.debug(Spiltbycomma.size());
           
                
           		for(integer j=0;j<Spiltbycomma.size();j=j+1)
                {
                 if(j==0)
                 {
                     Debit.add(Spiltbycomma[j]);
                 }
                    if(j==1)
                 {
                     Credit.add(Spiltbycomma[j]);
                 }
                    if(j==2)
                 {
                     Balance.add(Spiltbycomma[j]);
                 }
                    if(j==3)
                 {
                     Dummy.add(Spiltbycomma[j]);
                 }
                  
                 
                }
           	//	AfterSpiltbycomma = new List<String>(s1);
           		//system.debug(AfterSpiltbycomma);
       }
    
        CompleteString = New List<List<String>>();
        CompleteString.add(Debit);
        CompleteString.add(Credit);
        CompleteString.add(Balance);
        system.debug('CompleteString= '+CompleteString);
        system.debug('Debit= '+CompleteString[0]);
        system.debug('Credit= '+CompleteString[1]);
        system.debug('Balance= '+CompleteString[2]);
        wrapper = new List<MyWrapper>();
        for(integer k=0;k<Debit.size();k++)
        {
            wrapper.add(New MyWrapper(Debit[k],Credit[k],Balance[k]));
        }
        //wrapper.add(New MyWrapper(CompleteString[0],CompleteString[1],CompleteString[2]));
        system.debug(wrapper);
        return pg;
    //    return AfterSpiltbycomma;
    }
    
 public class MyWrapper
    {        
         public String Debit{get;set;}
        public String Credit{get;set;}
        public String Balance{get;set;}
       // system.debug('asdsadassdsaasd');
        public MyWrapper(String Debit1 ,String Credit1,String Balance1 )
        {
            system.debug('asdsadassdsaasd');
            Debit = Debit1;
            Credit = Credit1;
            Balance =Balance1;
             
            
        }	
    }
    
  
}