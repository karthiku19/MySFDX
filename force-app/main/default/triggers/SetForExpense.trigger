trigger SetForExpense on Expense__c (after insert) {
    
 /*   String Ids;
    String TripId;
    String MemId;
  //  for(Expense__c Exp:trigger.new )
    for(Expense__c Exp:trigger.new)
    {
       //  Ids=Exp.Id;
    //   Exp.Expense_Type__c;
      //  Exp.Id;
      // Exp.Trip_Member__c
   //     system.debug( );
       // MemId = Exp.
    //   Expense__c Expc = [Select Trip_Member__c from Expense__c where Id =:Ids ];
   //     System.debug(Expc);
        
       MemId = Exp.Trip_Member__c;
        System.debug(MemId);
      // TripId = Expc.Trip__c;
        if(MemId != null)

         Trip_Mbrs__c TrpMem = [Select Trip__c from Trip_Mbrs__c where Id =:MemId ];
             System.debug(TrpMem);
         TripId=TrpMem.Trip__c;
         Exp.Trip__c = TripId;
            update Exp;
         } 
    } */

}