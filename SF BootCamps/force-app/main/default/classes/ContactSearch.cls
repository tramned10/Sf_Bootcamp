public class ContactSearch {

    Public static List<Contact> searchForContacts(String lastname ,String PostaCode){
        
         
        
    List  <Contact> con = [SELECT Lastname , ID, MailingPostalCode FROM Contact 
                        WHERE Lastname=:lastname AND MailingPostalCode = :PostaCode ];
     
        
      
        return con;
        
        
    }
}