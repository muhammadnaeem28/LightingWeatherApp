# LightingWeatherApp

See Salesforce Contact's Weather forecast on record detail page  

# Installation Instructions

- Upload the Aura, Apex and Static Resource in your Salesforce instance
- [Sign up](https://openweathermap.org/) for a free Open Weather API key
- In the developer console, open the `WeatherCompController` Apex class, update `endURL` variable to have your generated API from open Weather, and save the file
- In Setup, select Administer > Security Controls > Remote Site Settings, click New Remote Site, specify OpenWeather as the Remote Site Name and `http://api.openweathermap.org` as the Remote Site URL. Click Save.
- Add the `ContactWeatherApp` lightning Component in your Lightning Contact page 

![N|Solid](https://ibin.co/w800/5SWe1V1a6FmW.jpg)
