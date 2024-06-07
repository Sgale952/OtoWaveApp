import 'dart:async';

import 'package:OtoWave/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();

}

class _RegistrationScreenState extends  State<RegistrationScreen> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  _buildBackgroundGradient(),
        child: Center(
          child: _buildContext(context),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple, Colors.blue], // Цвета градиента
        begin: Alignment.topLeft, // Начальное положение градиента
        end: Alignment.bottomRight, // Конечное положение градиента
      ),
    );
  }

  Widget _buildContext(BuildContext context) {
    return Container(
      width: 344,
      height: 581,
      decoration: BoxDecoration(
        color: Color.fromRGBO(27, 24, 24, 1.0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Text('Создание учетной записи OtoWave',
            textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Inter-Medium',
              ),
            ),
          ),
          Center(
            child: Column(

            ),
          )
        ],
      ),
    );
  }

  }
