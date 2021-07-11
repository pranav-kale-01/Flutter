import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'RoundIconButton.dart';

class AdjustableValueCard extends StatefulWidget {
  AdjustableValueCard( { Key? key, required this.label1, required this.startValue} ) : super(key: key );

  final String label1 ;
  final int startValue;

  @override
  AdjustableValueCardState createState() => AdjustableValueCardState(label1: this.label1, value: this.startValue );
}

class AdjustableValueCardState extends State<AdjustableValueCard> {
  AdjustableValueCardState( { required this.label1 , required this.value } );

  String label1;
  int value;

  int getValue() {
    return this.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label1,
            style: kLabelStyle.copyWith(
              fontSize: 20.0,
            ),
          ),
          Text(
            this.value.toString(),
            style: TextStyle(
              fontSize: 50.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                childIcon: FontAwesomeIcons.minus ,
                onPressed: () {
                  setState(() {
                    if( value>0 ){
                      value--;
                    }
                  });
                },
              ),
              RoundIconButton(
                  childIcon: FontAwesomeIcons.plus,
                  onPressed: () {
                    setState(() {
                      if( value < 220 ){
                        value++;
                      }
                    });
                  },
              ),
            ],
          )
        ],
      ),
    );
  }
}