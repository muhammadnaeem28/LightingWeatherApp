({
    getWeather : function(component, event, helper) {
      
        var action = component.get("c.getWeatherData");
        action.setParams({
            'contactId': component.get("v.recordId"),
        });
        //set callback   
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var serverData = JSON.parse(JSON.stringify(response.getReturnValue()));
                var weatherData = JSON.parse(serverData.weatherData);
                console.log("weatherData. = "+ weatherData.main.temp_max);
                component.set("v.currentCity", weatherData.name);
				component.set("v.tempMin", weatherData.main.temp_min);
                component.set("v.tempMax", weatherData.main.temp_max);
                component.set("v.wind", weatherData.wind.speed);
                component.set("v.humidity", weatherData.main.humidity);
                
            }
        });
        $A.enqueueAction(action);
    }
    })