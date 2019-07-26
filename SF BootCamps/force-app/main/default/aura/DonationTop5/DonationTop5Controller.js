({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Donar Name', fieldName: 'Donar_Name__c', type: 'text'},
            {Label: 'Amount', fieldName: 'Amount__c', type: 'currency'},
            {label: 'Date', fieldName: 'Donation_Date__c', type: 'date'},
            {label: 'Note', fieldName: 'Note2__c', type: 'text'}
            
            
            ]);
        var action = component.get("c.getDonation");

        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.donation5", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})