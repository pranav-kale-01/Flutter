import 'package:flutter/material.dart';
import 'package:clima/Cards/BasicContainerCard.dart';
import 'package:clima/utilities/constants.dart';

class MiniWeatherDetailsCard extends StatelessWidget{
  MiniWeatherDetailsCard({ required this.weatherData });

  Map<String,dynamic> weatherData;

  @override
  Widget build( BuildContext context ){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 10.0 ),
              child: Image.asset( "images/" + kWeatherCondition[ weatherData['weather'] ]! , width: 100,),
            ),
            Padding(
              padding: const EdgeInsets.only( left : 40.0 ),
              child: Text(
                weatherData['temperature'],
                style: TextStyle(
                  fontSize: 120.0,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "°",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 70.0,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 150.0,
              ),
              clipBehavior: Clip.none,
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(
                weatherData['city'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            BasicContainerCard(parameter: "M I N", icon: Icons.cloud, value: weatherData['min_temp']),
            BasicContainerCard(parameter: "M A X", icon: Icons.cloud, value: weatherData['max_temp']),
          ],
        ),
      ],
    );
  }
}