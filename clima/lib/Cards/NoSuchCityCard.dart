import 'package:flutter/material.dart';

class NoSuchCityCard extends StatelessWidget{
  @override
  Widget build( BuildContext context ){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
            Icons.warning_amber_rounded,
            size: 50.0,
            color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
              "No Such City :( ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w300,
              ),
          ),
        ),
      ],
    );
  }
}