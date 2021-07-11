import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../Cards/MainCard.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage( {required this.bmi, required this.performance, required this.description } );

  String bmi;
  String performance;
  String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar( ),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Expanded(
                child: MainCard(
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(
                              this.performance,
                              style: TextStyle(
                                fontSize: 23.0,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                          ),
                      ),
                      Center(
                          child: Text(
                              this.bmi,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 50.0,
                              ),
                          ),
                      ),
                      Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                                this.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                            ),
                          ),
                      ),
                    ],
                  ),
                  cardColor: kActiveCardColor,
                ),
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      "RE-CALCULATE",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                      textAlign: TextAlign.center,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      );
  }
}
