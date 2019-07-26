public class QueueableClass implements Queueable {
    
    Public void execute(QueueableContext qc){
        
       system.debug('hello');
        
        
    }
	
}
/*
	

	Id qId = system.enqueueJob( new QueueableClass());
    AsyncApexJob qResults = [SELECT Status, NumberOfErrors, CompletedDate FROM AsyncApexJob WHERE Id= :qId];
	system.debug(qResults);
*/