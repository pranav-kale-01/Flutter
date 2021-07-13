import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/utilities/constants.dart';

class ValueContainerCard extends StatelessWidget{
  const ValueContainerCard( {Key? key,required this.crytoType, required this.label, required this.value});

  final String crytoType;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context ){
    return   Container(
      margin: EdgeInsets.only(right: 20.0, left: 20.0 ),
      child: Container(
        decoration: kWhiteValueContainerDecoration,
        margin: EdgeInsets.all(2.5),
        padding: EdgeInsets.all(20.0),
        child: Text(
            "1 $crytoType = $label $value",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.0,
            ),
        ),
      ),
      decoration: kValueContainerDecoration,
    );
  }

}