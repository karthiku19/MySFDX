public with sharing class GetSRDetails {

     public String inputText1{get;set;} // input text1 value  from vf
//     public String inputText2{get;set;} // input text2 value  from vf
    
    
    public void saveList(){
        
		GetSRSIEBEL.TDE_spcTEST_spcWF kajsdhka = new GetSRSIEBEL.TDE_spcTEST_spcWF();
        kajsdhka.EntelGetSRDetail('Test1','Test2');



      }  
   
}