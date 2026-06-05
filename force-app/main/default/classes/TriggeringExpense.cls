public class TriggeringExpense {

   @InvocableMethod
     public static void GetTour(List<Id> TrpId)
    {  
     AddExpenseTrigger Tst = new AddExpenseTrigger();
     system.debug('YESSSs');
        Tst.Trig(TrpId[0]);
    }
}