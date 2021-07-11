import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatefulWidget {
  RoundIconButton( {required this.childIcon, this.onPressed } );

  final IconData childIcon;
  final void Function()? onPressed;

  @override
  _RoundIconButtonState createState() => _RoundIconButtonState( childIcon: childIcon, onPressed: onPressed );
}

class _RoundIconButtonState extends State<RoundIconButton> {
  _RoundIconButtonState( { required this.childIcon , required this.onPressed});

  final IconData childIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        constraints: BoxConstraints(
          maxWidth: 50.0,
          maxHeight: 50.0,
          minWidth: 50.0,
          minHeight: 50.0,
        ),
        child: Icon(
          childIcon,
          color: kActiveContentColor,
          size: 20.0,
        ),
        onPressed: onPressed,
        shape: CircleBorder(),
        fillColor: kActiveCardColor,
      ),
    );
  }
}