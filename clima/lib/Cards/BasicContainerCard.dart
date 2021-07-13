import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class BasicContainerCard extends StatelessWidget {
  BasicContainerCard({
    required this.parameter,
    required this.icon,
    required this.value,
    this.margin= EdgeInsets.zero }
  );

  EdgeInsets margin;
  String parameter;
  String value;
  IconData icon;

  @override
  Widget build( BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.all( Radius.circular(20.0) ),
          color: Colors.transparent,
        ),
        margin: this.margin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: Text(
                this.parameter,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Icon(
              this.icon,
              color: Colors.white,
              size: 30.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                this.value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}