import 'package:clima/Cards/NoSuchCityCard.dart';
import 'package:clima/Cards/MiniWeatherDetailsCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/WeatherData.dart';

class SecondPage extends StatefulWidget {

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
   Map<String, dynamic> weatherData= {};
   Widget content = Container(
     color: Colors.transparent,
   );

   @override
   Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kScaffoldBackgroundTheme,
        body: Column(
          children: [
            Container(
              decoration: kGradientBoxDecoration,
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10.0, 10.0 , 10.0 , 20.0 ),
                      alignment: Alignment.topLeft,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: kTextFieldThemeStyle,
                        onSubmitted: ( cityName ) async {
                          if( cityName == "" )
                            return;
                          // creating new object of class WeatherData
                          WeatherData data = new WeatherData();

                          await data.loadDataFromCity(cityName: cityName );

                          if( data.gotWeather == true ){
                            weatherData = data.getWeather();

                            setState(() {
                              content =  MiniWeatherDetailsCard(weatherData: this.weatherData,);
                            });
                          }
                          else{
                            setState(() {
                              content = NoSuchCityCard();
                            });
                          }
                        },
                      ),
                    ),
                    content,
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(23.0, 0.0, 23.0, 5.0 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(50.0), bottomRight:  Radius.circular(50.0) ),
                color: Color(0xFF06408f),
              ),
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}