global class ChainJobsQueueable implements Queueable {
    Decimal currMin;
    Decimal currMax;
    Decimal value;
    
    Public  ChainJobsQueueable(Decimal max , Decimal min){
        currMin = min;
        currMax = max;

    }
    
        Public void execute(QueueableContext qc){
        
       List<Account> acc = [SELECT Id, Name, Budget__c, (Select Id, Name, Budget__c From Accounts__r ) FROM Account WHERE is_Parent__c = True];
         List<Account> BucketList = new List<Account>();
        For(Account parentAccount : acc ){
        List<Account> childAccounts = parentAccount.Accounts__r;
         value = (math.random() * (currMax - currMin) + currMin);
            parentAccount.Budget__c = value;
            
           BucketList.add(parentAccount);
            
            For (Account newChildBudget : childAccounts){
                value = (math.random() * (currMax - currMin) + currMin);
                newChildBudget.Budget__c = value;
                 BucketList.add(parentAccount);
            }
		
            
            
             system.debug(BucketList);
        }
       
        insert BucketList;
        
    }
	
}