import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/InputPage.dart';
import 'CustomThemeData.dart';

void main() => runApp( BMICalc() );

class BMICalc extends StatefulWidget {
  const BMICalc({Key? key}) : super( key : key );

  _BMICalcState createState() => _BMICalcState();
}

class _BMICalcState extends State<BMICalc> {
  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      home: InputPage(),
      theme: CustomThemeData().bmiTheme(),
    );
  }
}