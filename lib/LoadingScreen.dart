import 'dart:async';
import 'package:flutter/material.dart';
import 'package:OtoWave/MainScreen.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<String> images = [
    'assets/load_screen 1.png',
    'assets/load_screen 2.png',
    'assets/load_screen 3.png',
    'assets/load_screen 4.png',
  ];
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentIndex++;
        if (currentIndex >= images.length) {
          _timer?.cancel();
          _navigateToNextScreen();
        }
      });
    });
  }

  void _navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(images[currentIndex]),
      ),
    );
  }
}

