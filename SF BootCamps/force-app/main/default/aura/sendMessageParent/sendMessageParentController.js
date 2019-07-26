({
	handleSend : function(component, event,helper) {
        
        var params = event.getParams();
        
        var message = params.message;
        
        alert('Received message: ' + message);
		
	}
})