import 'dart:async';
import 'package:OtoWave/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
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

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildBackgroundGradient(),
        child: Center(
          child: _buildContext(context),
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
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
            top: 30,
            left: 20,
            right: 20,
            child: Text(
              'Создание учетной записи OtoWave',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Inter-Medium',
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                _buildForm(),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 263,
                    height: 55,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: _isPressed
                          ? Colors.blue
                          : (_isHovered
                          ? Colors.blue.withOpacity(0.5)
                          : Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 1),
                    ),
                    child: Center(
                      child: Text(
                        'Вход',
                        style: TextStyle(
                          color: _isPressed || _isHovered
                              ? Colors.white
                              : Colors.white,
                          fontSize: 17,
                          fontFamily: 'Inter-Medium',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                child: Text(
                  'вернуться на главную',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Inter-Medium',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        _buildTextField(hintText: 'Логин'),
        SizedBox(height: 15),
        _buildTextField(hintText: 'Пароль', obscureText: true),
        SizedBox(height: 15),
        _buildTextField(hintText: 'Email'),
        SizedBox(height: 15),
        _buildTextField(hintText: 'Телефон'),
      ],
    );
  }
}

Widget _buildTextField({required String hintText, bool obscureText = false}) {
  return Container(
    width: 263,
    height: 55,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    ),
  );
}





