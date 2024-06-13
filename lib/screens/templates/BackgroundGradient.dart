import 'package:flutter/material.dart';

class Background {
  static BoxDecoration buildBackgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromRGBO(106, 17, 203, 1.0), Colors.black],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}
