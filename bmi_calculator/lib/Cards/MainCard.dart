import 'package:flutter/material.dart';

class MainCard extends StatelessWidget{
  MainCard( { required this.cardColor, required this.cardChild } );

  final Color cardColor;
  final Widget cardChild;

  @override
  Widget build( BuildContext context ){
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: this.cardColor,
      ),
      margin: EdgeInsets.all(5.0),
    );
  }
}