public class Userlistassociation {

    public static void testfunction()
    {
        User Usr= [Select Id from User where Username = 'karthik.u@ericsson.com'];
        system.debug(Usr.Id);
        list<Account> acc = [Select name from Account where CreatedById =: Usr.Id ];
        system.debug(acc);
    }
}