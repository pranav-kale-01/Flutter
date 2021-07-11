import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class WeatherDetailsCard extends StatelessWidget{
  WeatherDetailsCard({required this.temperature, required this.weather});

  String temperature;
  String weather;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all( Radius.circular(20.0) ),
            color: Color(0xFF06408f),
          ),
          margin: EdgeInsets.fromLTRB(20.0, 15.0, 20.0 , 0.0 ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          color: Colors.transparent,
          child: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30.0, right: 30.0 ),
                    child: Image.asset( "images/" + kWeatherCondition[weather]!),
                  ),
                  Row(
                    verticalDirection: VerticalDirection.down,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only( left : 40.0 ),
                        child: Text(
                          temperature,
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
                  Container(
                      child: Text(
                        weather,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      )
                  ),
                  SizedBox(
                    height: 10.0,
                    child: Container(
                      margin: EdgeInsets.only(left: 50.0, right: 50.0 , top: 6.0, bottom: 3.0),
                      color: Colors.white38,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}