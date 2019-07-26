({
    
    doInit: function(component, event, helper) {        
        helper.packPicklist(component, event);
      },
    handleChange : function(component, event, helper) {
        var packing = component.get("v.Pack.Packages__c");
       
    },
    
	handleSubmit : function(component, event, helper) {
       // component.find('editform').submit();
       alert('dos some codin here');
    },
    
    handleSuccess : function(component, event, helper) {
     /*  var strAccName = component.find("accName").get("v.value");
        component.find('notifLib').showToast({
            "variant": "success",
            "title": strAccName,
            "message": "Account Updated Successfully!!"
        });*/
        component.find("overlayLibDemo1").notifyClose();
    },    
        /*bookFlight: function(component, event, helper) {
    helper.modal(component, event);
    }*/
})