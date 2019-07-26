({
		openModal : function(component, event, helper) {
		// We are finding the child component on markup and executing its aura method and passing the parameters to it.
		component.find('showModal').showChildModal(true);
        },
   		doInit : function(component, event, helper) {
        var action = component.get("c.getFlight");       
        action.setCallback(this, function(data){
            component.set("v.Flights",data.getReturnValue());
        });       
        $A.enqueueAction(action);
      },
    handleSend : function(component, event,helper) {
        
        var params = event.getParams();
        
        var message = params.message;
        
        alert('Received message: ' + message);
		
	},
    /* getFlights : function(component, event, helper) {
        helper.getAccHelper(component, event, helper);
    },*/
})