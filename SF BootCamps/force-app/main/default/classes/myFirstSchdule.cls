global class myFirstSchdule Implements Schedulable  {
    
    global void execute(SchedulableContext sc){
        
        system.debug(UserInfo.getFirstName());
    }
}