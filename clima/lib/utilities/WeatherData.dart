import 'package:http/http.dart' as http ;
import 'dart:convert';

class WeatherData {
  Map<String, dynamic> weatherData = {};
  String _APIkey = "de555b933bc9056917bbb4aaca77e6cd";
  String _url = 'http://api.openweathermap.org/data/2.5/weather?';
  bool gotWeather = true ;

  // based on the weather conditions provided by openweather API.
  // for more details visit: https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2
  String getWeatherType( int weatherId) {
    if( weatherId ==  800 ){
      return "Clear";
    }
    else if( weatherId > 800 ) {
      return "Clouds";
    }
    else if( weatherId > 700 ){
      return "Mist";
    }
    else if( weatherId >= 600 ){
      return "Snow";
    }
    else if( weatherId >= 500 ){
      return "Rain";
    }
    else if( weatherId >= 300 ){
      return "Drizzle";
    }
    else {
      return "Thunderstorm";
    }
  }

  void _setWeather( dynamic decodeData ) {
    weatherData['weather'] = getWeatherType( decodeData['weather'][0]['id'] ).toString();
    weatherData['temperature'] = decodeData['main']['temp'].toStringAsFixed(0);
    weatherData['min_temp'] = decodeData['main']['temp_min'].toStringAsFixed(0);
    weatherData['max_temp'] = decodeData['main']['temp_max'].toStringAsFixed(0);
    weatherData['city'] = decodeData['name'].toString();
    weatherData['visibility'] = decodeData['visibility'].toString();
  }

  Future<void> loadDataFromCity( {required String cityName} ) async {
    String posturl = _url + 'q=$cityName&appid=$_APIkey&units=metric';
    http.Response jsonResponse = await http.post( Uri.parse(posturl) );

    if( jsonResponse.statusCode == 200 ) {
      String jsonResponseData = jsonResponse.body;
      var decodeData = jsonDecode(jsonResponseData);
      this.gotWeather = true;

      _setWeather(decodeData);
    }
    else {
      this.gotWeather= false;
    }
  }

  Future<void> loadData( {required String latitude, required String longitude }) async {

    // adding latitude and longitude
    String posturl = _url + "lat=$latitude&lon=$longitude&appid=$_APIkey&units=metric";
    http.Response jsonResponse = await http.post( Uri.parse(posturl) );

    if( jsonResponse.statusCode == 200 ) {
      String jsonResponseData = jsonResponse.body;
      var decodeData = jsonDecode(jsonResponseData);
      this.gotWeather = true;

      _setWeather(decodeData);
    }
    else {
      print("404");
      this.gotWeather = false ;
    }
  }

  Map<String,dynamic> getWeather( ) {
    return this.weatherData;
  }
}