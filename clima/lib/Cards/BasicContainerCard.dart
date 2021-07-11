import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class BasicContainerCard extends StatelessWidget {
  BasicContainerCard({required this.labelText, required this.labelValue});

  String labelText;
  String labelValue;

  @override
  Widget build( BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 50.0),
        color: Colors.white24,
      ),
      margin: EdgeInsets.only(left: 10.0 , bottom: 25.0),
      child: Padding(
        padding: const EdgeInsets.only( top:10.0, bottom:10.0, left: 50.0, right: 50.0 ),
        child: Column(
          children: [
            Text(
              this.labelText,
              style: kNormalTextStyle,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              this.labelValue,
              style: kNormalTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}