import 'package:flutter/material.dart';
import 'package:OtoWave/screens/splash/LoadingScreen.dart';

void main() {
  runApp(OtoWaveApp());
}

class OtoWaveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: LoadingScreen(),
    );
  }
}