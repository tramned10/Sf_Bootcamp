Global class chainJobsBatch implements Database.Batchable<sObject>  {
    //math Random insert random num bers for total_budget__c
    //
    global Database.QueryLocator start(Database.BatchableContext bc) {
        
        return Database.getQueryLocator('SELECT Id, Name, Total_Budget__c, Budget__c (Select Id, Name, Budget__c From Accounts__r ) FROM Account WHERE is_Parent__c = True');
    }
    global void execute(Database.BatchableContext bc, List<Account> result){
       
        For(Account parentAccount : result){
            
            parentAccount.Total_Budget__c = parentAccount.Budget__c;
            
            For(Account childAccount : parentAccount.Accounts__r){
                
                parentAccount.Total_Budget__c += childAccount.Budget__c;
            }
            
        }
        update result;
        
        For(Account a : result){
            
            String messageBody = '<table border = 1 style = "border-collapse:collapse;"><tr><th>Account Name</th><th> Total Budget </th></tr>';
            
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'apexsync@yopmail.com'};
        mail.setSubject('Noy : Account Budget');
        mail.setHtmlBody(MessageBody);
   
            
            if (a.Total_Budget__c > 1000000){
                     Messaging.SendEmailResult[] results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
                
            }
        }
        
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        // insert total_budget random
        system.debug('Finish');
    }    
    /*
	Id bId = Database.executeBatch( new MyBatchClass(), 1);
    AsyncApexJob bResults = [SELECT Status, NumberofErrors, CompletedDate FROM AsyncApexJob WHERE Id= :bId];
	system.debug(bResults);
*/
  
}