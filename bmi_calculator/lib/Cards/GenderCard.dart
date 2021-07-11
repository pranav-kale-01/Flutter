import 'package:flutter/material.dart';

class GenderCard  extends StatelessWidget {
  GenderCard( {required this.contentColor, required this.cardName , required this.cardIcon } );

  final Color contentColor;
  final String cardName;
  final IconData cardIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            cardIcon,
            size: 80.0,
            color: this.contentColor,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
              this.cardName,
              style: TextStyle(
                fontSize: 18.0,
                color: this.contentColor,
              )
          ),
        ]
    );
  }
}