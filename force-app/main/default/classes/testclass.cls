public class testclass {
    
    public Integer calculatoradd(Integer A,Integer B)
    {
        Integer C = A+B;
        system.debug(C);
        return C;
    }
    
    public static List<Account> GetAccount()
    {
        List<Account> Act = [Select Name,AccountSource,OwnerId from Account where OwnerId = '0057F000002BhqBQAS'];
        Integer Sze = Act.size();
        system.debug(Sze);  
        
        for(Integer i = 0 ; i < Sze; i++)
        {
            if(Act[i].Name == 'NewAccount1')
            {
                system.debug(Act[i].OwnerId);
                system.debug(Act[i].Name);
                system.debug(i);
            }
        }
        
        
        
        return Act;
        
    }
    

    
}