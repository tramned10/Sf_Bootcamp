Global class chainJobsFuture {
    //First Bullet creation of 5 child account per parent
    @future
    Global static void futureAccCreation(){
        
        List<Account> accList = [SELECT Name,is_Parent__c, Id  FROM Account WHERE is_Parent__c = TRUE];
      //  system.debug(parentAcc);
        List<Account> childAccList = new List<Account>();
        FOR (Account parentAcc : accList  ){
            
 			 FOR(integer i = 0 ; i < 5 ; i++){
               Account  newChildAcc = new Account(); 
                newChildAcc.Name = parentAcc.Name + ' ' + 'Child' +' ' + i;
                 newChildAcc.Parent_Account__c = parentAcc.Id;
                 system.debug(newChildAcc);    
                 //update accList;
                childAccList.add(newChildAcc);
                 
            }
          
        }
       insert childAccList;
        system.enqueueJob(new ChainJobsQueueable(300000 , 100000));
    }
    
   
    
    

}