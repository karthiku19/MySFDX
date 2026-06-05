public class ExcelListViewVFP {
    
    //	private Final Account_Summary__c QRT;
     public string nameFile;
    
    public Blob contentFile{get;set;}
 //
 //      system.debug('asdasddas');
//        public ExcelListViewVFP(ApexPages.StandardController con)
//    {
//        this.QRT = (Account_Summary__c)con.getRecord();
//    }
    /*   public List<String> Plan1 {get
            {
                system.debug('asdasdasd');
                system.debug(nameFile);
                nameFile=contentFile.toString();
                system.debug(nameFile);
                //nameFile= EncodingUtil.base64Encode(contentFile);
                //nameFile = EncodingUtil.urlEncode(nameFile, 'UTF-8');
                List<String> Splitbynewline = nameFile.split('\n');
                system.debug(Splitbynewline);
                 return Plan1;
            }
            set;} */
    public List<String> getPlan1()
    {
        system.debug('asdsadas');
        system.debug(nameFile);
         nameFile=contentFile.toString();
          system.debug(nameFile);
       //nameFile= EncodingUtil.base64Encode(contentFile);
       //nameFile = EncodingUtil.urlEncode(nameFile, 'UTF-8');
       List<String> Splitbynewline = nameFile.split('\n');
          system.debug(Splitbynewline);
       List<String> Spiltbycomma;
        return Splitbynewline;
    }

    
}