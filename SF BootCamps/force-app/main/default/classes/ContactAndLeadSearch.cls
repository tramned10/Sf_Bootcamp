public class ContactAndLeadSearch {

    Public Static List<List<sObject>> searchContactsAndLeads(String param){
       
        
        List<List<sObject>> searchList = [FIND :param IN ALL FIELDS 
                   RETURNING Contact(LastName , FirstName),Lead(LastName , FirstName )];
        return searchList;
    }
}