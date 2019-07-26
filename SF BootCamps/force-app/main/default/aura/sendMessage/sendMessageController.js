({
	sendMessage : function(component, event, helper) {
        
        var sendEvent = $A.get('e.c:sendMessageEvent');
        
        sendEvent.setParams({
            
            message: 'Hello World!'
        });
        
        sendEvent.fire();
		
        
      /*  var sendEvent = component.getEvent('send'); //...registerEvent name="send"
        
        sendEvent.setParams({
            
            message: 'Hello World!'
        });
        
        sendEvent.fire();*/
		
	}
})