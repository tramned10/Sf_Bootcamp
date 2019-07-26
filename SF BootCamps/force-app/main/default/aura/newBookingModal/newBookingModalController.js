({
	openModal : function(component, event, helper) {
		//we are fetching parameters from event that calls this method.
		var params = event.getParam( 'arguments' ) || event.getParams();
		component.set('v.isOpen',params.openModal);
	},
 
	closeModal : function(component, event, helper) {
		component.set('v.isOpen',false);
	},
 
	handleSave : function(component, event, helper) {
		//Handle the action when save button is clicked you can write your custom logic here.
		alert('Do Some action on me');
		component.set('v.isOpen',false);
	},    
    doInit: function(component, event, helper) {        
        helper.packPicklist(component, event);
      },
    handleChange : function(component, event, helper) {
        var packing = component.get("v.Pack.Packages__c");
       
    },
})