import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:OtoWave/screens/authorization/AuthorizationScreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<String> _gradients = [];
  int _gradientIndex = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_gradients[_gradientIndex]),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadGradients();
    _startTimer();
  }

  Future<void> _loadGradients() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final images = manifestMap.keys.where((key) => key.contains('assets/splash/')).toList();

    setState(() {
      _gradients = images;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _shiftGradient();
    });
  }

  void _shiftGradient() {
    setState(() {
      if (_gradientIndex < _gradients.length - 1)
        _gradientIndex++;
      else
        _navigateToNextScreen();
    });
  }

  //TODO: Если пользователь авторизован, перенаправить на главный экран
  void _navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => AuthorizationScreen()),
    );
  }
}
