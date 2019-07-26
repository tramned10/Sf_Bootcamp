public class AccountHandler {
    
    Public Static Account insertNewAccount(String AcountName){
        
        Account acct = new account (Name = AcountName);
        
        try{
        insert acct;
        }
        catch(DmlException e){
            return null;
        }
        return acct;
    }
	
}