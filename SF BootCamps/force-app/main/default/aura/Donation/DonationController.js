({
	 clickSave : function(component, event, helper) {
        var theDonation = component.get("v.newDonate");
         var emptyFields = component.get("v.newDonate");
        var action = component.get('c.saveDonation');
      	action.setParams({saveDon : theDonation});
        action.setCallback(this, function(response){
            if(response.getState() === 'SUCCESS') {
                
                
                // component.set("v.svdonate", theDonation);
                
                alert('Thank you!');
            	
            } 
            else {	
                alert('Failed to get records');
                
            }}
                
                           
                          );
        $A.enqueueAction(action);
               
    } 

    
      
})