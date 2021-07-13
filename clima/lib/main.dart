import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'package:flutter/services.dart';

void main() => runApp(Clima());

class Clima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
    );

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}