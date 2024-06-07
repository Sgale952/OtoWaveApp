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
      home: PasswordRecoveryScreen(),
    );
  }
}

class PasswordRecoveryScreen extends StatefulWidget {
  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();

}


class _PasswordRecoveryState extends State<PasswordRecoveryScreen> {

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
    );
  }
}