import 'package:flutter/material.dart';

class FailedToLoadCard{
  Container getContainer() {
    return Container(
          color: Colors.white12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              Text(
                  "Aw snap, something went wrong",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
              ),
            ],
          ),
      );
  }
}