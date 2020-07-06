public class WeatherCompController {
    
    @AuraEnabled public Contact contRecordMain {get; set;}
    
    @AuraEnabled
    public static weatherData getWeatherData(string contactId){
        WeatherCompController WeatherCont = new WeatherCompController();
        weatherData wData = new weatherData(WeatherCont.getContact(contactId), 
                                            WeatherCont.getWeather());
        return wData;
    }
    private Contact getContact(string contactId){
        contact contRecord = new Contact();
        contRecord = [Select Id, Name, MailingCity,MailingCountry,MailingPostalCode 
                      From Contact Where Id =: contactId Limit 1];
        this.contRecordMain = contRecord; 
        return contRecord;
    }
    private String getWeather(){
        String endURL;
        if(this.contRecordMain.MailingPostalCode != '' && this.contRecordMain.MailingPostalCode != null){
            endURL = 'http://api.openweathermap.org/data/2.5/weather?zip='+contRecordMain.MailingPostalCode+'&appid=c1bd5b91f66031d70ccc5bfc87d617c6&units=imperial';
            
        }else{
            //Default zip code will be Washington, DC
            endURL = 'http://api.openweathermap.org/data/2.5/weather?zip=20005&appid=c1bd5b91f66031d70ccc5bfc87d617c6&units=imperial';    
        }
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endURL);
        req.setMethod('GET');
        Http http = new Http();
        req.setTimeout(6000);
        HttpResponse res = http.send(req);
        
        return res.getBody();
    }
    
    private class weatherData {
        @AuraEnabled public Contact contactRecord {get; set;}
        @AuraEnabled public String weatherData {get; set;}
        
        private weatherData(Contact contactRecord,String weatherData) {
            
            this.contactRecord = contactRecord;
            this.weatherData = weatherData;
        }
    }
}