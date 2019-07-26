({
	packPicklist: function(component, event) {
        var action = component.get("c.getPicklistVal");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                var PackageMap = [];
                for(var key in result){
                    PackageMap.push({key: key, value: result[key]});
                }
                console.log(result);
                component.set("v.PackageMap", PackageMap);
            }
        });
        $A.enqueueAction(action);
    }
})