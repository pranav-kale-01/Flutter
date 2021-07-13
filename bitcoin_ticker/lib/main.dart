import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/Pages/HomePage.dart';

//creating a global key
GlobalKey _myKey = new GlobalKey(debugLabel: 'master');

void main() => runApp( BitcoinTicker() ) ;

class BitcoinTicker extends StatelessWidget {
  BitcoinTicker({Key? key});

  @override
  Widget build(BuildContext context ){
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) =>  HomePage(key: _myKey)
      }
    );
  }
}