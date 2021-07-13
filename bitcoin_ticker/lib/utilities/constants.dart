import 'package:flutter/material.dart';

const kScaffoldBackgroundColor = Colors.white70;

const kAppbarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(10.0),
    bottomLeft: Radius.circular(10.0),
  ),
);

const kContainerLinearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF14e3fa),
    Color(0xFF1ec1d4),
    Color(0xFF218f9c)
  ]
);

const kValueContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
  gradient: kContainerLinearGradient,
  boxShadow: [
    BoxShadow(
      color: Colors.black87,
      offset: Offset(0, 2.0),
      blurRadius: 3.5,
    ),
    BoxShadow(
      color: Colors.black54,
      offset: Offset(0, 2.0),
      blurRadius: 7.0,
    ),
  ]
);

const kWhiteValueContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20.0)),
  color: Color(0xEEFFFFFF),
);