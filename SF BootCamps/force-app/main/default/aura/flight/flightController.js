({
		//Load  Picklist
    doInit : function(component, event, helper) {
        var pVals = [
            {text:"Manila", value: "Manila"},
            {text:"Australia", value: "Australia"}
        ];
 
        var dPick = {
            "Manila" : [
                {text:"Australia", value: "Australia"}
            ],
            "Australia" : [
                {text:"Manila", value: "Manila"}
            ]
        };
 
        component.set('v.controllerOpt', pVals);
        component.set('v.dependentPicklist', dPick);
 
    },
 //on pick change
    PickChange : function(component, event, helper) {
        var parentValue = component.find('controlPL').get('v.value');
        component.set('v.dependentOpt', component.get('v.dependentPicklist')[parentValue]);
 
        if(parentValue != '')
        component.set('v.disabledPick',false);
        else
        component.set('v.disabledPick',true);
    },
    
    // event
   searchFlyt : function(component, event, helper) { 
       
       var searchFlightEve = $A.get("e.c:searchFlight");
       
  	   console.log('origin flight 1st log' + component.get("v.orig"));
       console.log('desti flight 2nd log' + component.get("v.desti"));
       console.log('date flight 3rd log' + component.get("v.livDate"));
		       
          searchFlightEve.setParams({
            "origin": component.find("controlPL").get("v.value"),
            "destination": component.find("dependentPL").get("v.value"),
            "livDate": component.find("dates").get("v.value")    
        });
        searchFlightEve.fire(); 
       
      
    }      
    
})