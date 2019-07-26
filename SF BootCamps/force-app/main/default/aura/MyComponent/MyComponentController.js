({
	doInit : function(component, event, helper) {
        
        var action = component.get("c.getAccount");
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                
              component.set("v.accounts", response.getReturnValue());
                           			 }
            else{
              alert("failed to get accounts");
                }
        });
         
		$A.enqueueAction(action);
	}
})