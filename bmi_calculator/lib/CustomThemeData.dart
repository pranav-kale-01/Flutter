import 'package:flutter/material.dart';
import 'constants.dart';

class CustomThemeData {
  ThemeData bmiTheme() {
    return ThemeData.dark().copyWith(
      backgroundColor:  Colors.black,
      scaffoldBackgroundColor: Color(0xFF071031),
      colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: Color(0xFF8727BB),
        primaryVariant: Color(0x4F8727BB),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: kActiveContentColor,
        inactiveTrackColor: kInactiveContentColor,
        thumbColor: Color(0xFF8727BB),
        overlayColor: Color(0x4F8727BB),
        trackHeight: 1.0,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 14.0,
        ),
      ),
    );
  }
}