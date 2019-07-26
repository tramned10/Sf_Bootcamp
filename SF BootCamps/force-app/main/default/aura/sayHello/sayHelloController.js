({
	sayHello : function(component, event, helper) {
       // alert('Hello World!');
        var message = component.get('v.message');
        helper.pleaseSayHello(component,message);
	}
})