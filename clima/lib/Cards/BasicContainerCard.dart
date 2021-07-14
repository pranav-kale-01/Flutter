import 'package:flutter/material.dart';

class BasicContainerCard extends StatelessWidget {
  BasicContainerCard({
    required this.parameter,
    required this.icon,
    required this.value,
    this.parameterColor = Colors.black,
    this.iconColor = Colors.black,
    this.valueColor = Colors.black,
    this.margin= EdgeInsets.zero,
    this.backgroundColor = Colors.white12,
  });

  final Color backgroundColor;
  final EdgeInsets margin;
  final String parameter;
  final Color parameterColor;
  final String value;
  final Color valueColor;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build( BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white24,
        ),
        borderRadius: BorderRadius.all( Radius.circular(20.0) ),
        color: this.backgroundColor,
      ),
      margin: this.margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              this.parameter,
              style: TextStyle(
                color: this.parameterColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Icon(
            this.icon,
            color: this.iconColor,
            size: 30.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              this.value,
              style: TextStyle(
                color: this.valueColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
