({
	/*getAccHelper : function(component, event, helper) {
       //set colums of data table queried to the account sobject using apex class 
        component.set('v.mycolumns', [
            
                {label: 'Flight Number', fieldName: 'Flight_Number__c', type: 'text'},
                {label: 'Departure', fieldName: 'From__c', type: 'text'},
                {label: 'Arrival', fieldName: 'To__c', type: 'text'},
            	{label: 'Departure Time', fieldName: 'Departure_Time__c' , type: 'date' , typeAttributes:{hour: "2-digit",minute:"2-digit"}},
            	{label: 'Arrival Time', fieldName: 'Arrival_Time__c', type: 'date ',typeAttributes:{hour: "2-digit",minute:"2-digit"}},
           		{label: 'Fly', fieldName: 'Fly__c', type: 'text '},
           		{label: 'FLy + Baggage ', fieldName: 'Fly_baggage__c', type: 'text '},
           	    {label: 'Fly + Baggage + Meal ', fieldName: 'Fly_Baggage_Meal__c', type: 'text '},
            	{label: 'Available Seats ', fieldName: 'No_of_Seats2__c', type: 'Number '}]);
        
        	var action = component.get("c.getFlight");
        	action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Flights", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },*/
})