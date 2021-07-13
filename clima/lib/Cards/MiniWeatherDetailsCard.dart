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
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 10.0 ),
                  child: Image.asset( "images/" + kWeatherCondition[ weatherData['weather'] ]! , width: 100,),
                ),
                Text(
                    weatherData['weather'],
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                ),
              ],
            ),
            Text(
              weatherData['temperature'] + "°",
              style: TextStyle(
                fontSize: 120.0,
                color: Colors.white,
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
            BasicContainerCard(
                parameter: "M I N",
                icon: Icons.cloud,
                value: weatherData['min_temp'],
                margin: EdgeInsets.all(5.0),
            ),
            BasicContainerCard(
                parameter: "M A X",
                icon: Icons.cloud,
                value: weatherData['max_temp'],
                margin: EdgeInsets.all(5.0),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}