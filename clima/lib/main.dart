import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'Pages/SecondPage.dart';

void main() => runApp(Clima());

class Clima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage( ),
      },
    );
  }
}