global class MyBatchClass implements Database.Batchable<sObject>  {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        // 
        return Database.getQueryLocator('SELECT Name FROM Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> result){
        // process each batch of records
      
        for(Account acc : result){
            
            System.debug(acc.Name);
        }
        
        
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        system.debug('Finish');
    }    
    /*
	Id bId = Database.executeBatch( new MyBatchClass(), 1);
    AsyncApexJob bResults = [SELECT Status, NumberofErrors, CompletedDate FROM AsyncApexJob WHERE Id= :bId];
	system.debug(bResults);
*/
  
}