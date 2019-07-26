({

	handleSend : function(component, event,helper) {
        helper.sendEvt(component, event, helper);   
	},
  /*  handleShowModal : function(component, event, helper) {
		//we are fetching parameters from event that calls this method.
		var params = event.getParam( 'arguments' ) || event.getParams();
		component.find('showModal').showChildModal(true);
       //fetch and transfer the data to modal
        
	},*/
    newPopup : function(component, event, helper){
        helper.popUp(component, event, helper);
    },
    closeNewModal : function(component, event, helper){
       helper.popClose(component, event, helper);
    },
     getValue: function(component, event, helper) {   
         helper.getTableVals(component, event, helper);
    },
    saveModal: function(component, event,helper) {
        var fName = component.get("v.firstName");
        var lName = component.get("v.lastName");
        var fId = component.get("v.flightId");
        var addEmail = component.get("v.emailAdd");
     	
        var addCon = component.get("c.saveContact");
        console.log(fName);
        console.log(lName);
        console.log(addEmail);
        console.log(fId);
         
        addCon.setParams({
            "keyFirstName"  : fName,
            "keyLastName" : lName,
            "keyEmail"  : addEmail,
            "flightId"  : fId
            
        });
         addCon.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
            var name = response.getReturnValue();
           
            alert("Contact has been added");
        }
        else if (state === "ERROR")
        {
            alert("Failed");
        }
    });
    $A.enqueueAction(addCon);
    },
    
    
        
        
        
    
  /*  showDataTable : function(component, event, helper) {
    
   component.set('v.mycolumns', [
             {label: 'Flight Number', fieldName: 'Flight_Number__c', type: 'number'},
             {label: 'Departure', fieldName: 'From__c', type: 'text'},
             {label: 'Departure', fieldName: 'To__c', type: 'text'},
             {label: 'Departure Time', fieldName: 'Departure_Time__c', type: 'date' ,typeAttributes:{hour:"2-digit" ,minute: "2-digit"}},
             {label: 'Arrival Time', fieldName: 'Arrival_Time__c', type: 'date',typeAttributes:{hour:"2-digit" ,minute: "2-digit"} },
             {label: 'Fly', fieldName: 'Fly__c', type: 'currency'},
             {label: 'FLy + Baggage', fieldName: 'Fly_baggage__c', type: 'currency', typeAttributes: { currencyCode: 'US' }},
             {label: 'Fly + Baggage + Meal', fieldName: 'Fly_Baggage_Meal__c', type: 'currency', typeAttributes: { currencyCode: 'US' }},
             {label: 'Available Seats', fieldName: 'No_of_Seats2__c', type: 'number'}
                
        ]);
       component.set("v.Flights");
    }*/
  
})