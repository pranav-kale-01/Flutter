import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController _controller;

    @override
   Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kScaffoldBackgroundTheme,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  alignment: Alignment.topLeft,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: kTextFieldThemeStyle,
                    onSubmitted: ( value ) {
                      Navigator.pop(context, value );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}