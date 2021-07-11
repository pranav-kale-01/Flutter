import 'package:flutter/material.dart';

const kScaffoldBackgroundTheme = Color(0xFF000000);

const kDefaultImage = 'weather_default.png';

const Map<String, String> kWeatherCondition = {
  'Clouds': 'weather_fewClouds3D.png',
  'Mist' : 'weather_mist3D.png',
  'Rain' : 'weather_rain3D.png',
  'Drizzle' : 'weather_showerRain3D.png',
  'scattered clouds' : 'weather_scatteredClouds3D.png',
  'Snow' : 'weather_snow3D.png',
  'Clear' : 'weather_sunny3D.png',
  'Thunderstorm' : 'weather_thunderstorm3D.png'
};

const kNormalTextStyle = TextStyle(
  fontSize: 24.0,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);

const kTextFieldThemeStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white54,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: "City Name",
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all( Radius.circular(20.0)),
      borderSide: BorderSide.none,
    )
);