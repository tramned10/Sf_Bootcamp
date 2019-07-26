({
	popUp: function(component, event,helper) {
        var cmpTarget = component.find('Modalbox1');
        var cmpBack = component.find('Modalbackdrop');
        $A.util.addClass(cmpTarget, 'slds-fade-in-open');
        $A.util.addClass(cmpBack, 'slds-backdrop--open');
    },
    popClose: function(component, event,helper) {
     	var cmpTarget = component.find('Modalbox1');
        var cmpBack = component.find('Modalbackdrop');
        $A.util.removeClass(cmpBack,'slds-backdrop--open');
        $A.util.removeClass(cmpTarget, 'slds-fade-in-open');
    },
    getTableVals: function(component, event,helper) {
     	var selected = event.getSource().get("v.text");
       // component.set("v.flightId", selected.Id);
        component.set("v.FlightNumber", selected.Flight_Number__c);
        component.set("v.depDate", selected.Departure_Date__c);
        component.set("v.From", selected.From__c);
        component.set("v.To", selected.To__c);
         component.set("v.flightId", selected.Id);
        component.set("v.flights" ,selected);
        
    },
    sendEvt: function(component, event,helper) {
        var departure = event.getParam("livDate");
        var origin = event.getParam("origin");
        var destination = event.getParam("destination");
        var action = component.get("c.getSearhedDetails");
        
        action.setParams({
            from_Keyword: origin,
            to_Keyword:destination,
            keyWord:departure
           
        });
        
        console.log("Date " + departure);  
         console.log("origin " + origin); 
         console.log("destination " + destination); 
		
        action.setCallback(this,function(response){
            var flightList = response.getReturnValue();
            console.log('returnVal =' + response.getReturnValue());
            if (response.getState() === "SUCCESS"){
            component.set("v.Flights",response.getReturnValue());
              
            } 
        })
        $A.enqueueAction(action);
    }
})