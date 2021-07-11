import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';

void main() => runApp(Clima());

class Clima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}