public class sample {
    
    public static void samples(){
        
        Contact[] con = [SELECT Name, MailingPostalCode FROM Contact];
        
      system.debug('eto un' + con);
    }

}