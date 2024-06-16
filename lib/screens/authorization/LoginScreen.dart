import 'package:OtoWave/HomeScreen.dart';
import 'package:flutter/material.dart';
import '/api/users/authorization/Login.dart';
import '/screens/templates/authorization.dart';
import 'AuthorizationScreen.dart';
import 'PasswordRecoveryScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _password;
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBackgroundGradient(),
        child: Center(
          child: _buildContext(context),
        ),
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
            top: 100,
            left: 20,
            right: 20,
            child: Text(
              'Вход',
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
                SizedBox(height: 10),
                _buildForm(),
                SizedBox(height: 45),
                GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _isPressed = true; // Устанавливаем состояние _isPressed в true при нажатии
                    });
                  },
                  onTapUp: (_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    setState(() {
                      _isPressed = false; // Устанавливаем состояние _isPressed в false при отпускании
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      _isPressed = false; // Сбрасываем состояние _isPressed при отмене нажатия
                    });
                  },
                  onTap: () {
                    _handleLogin();
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 263,
                    height: 55,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: _isPressed
                          ? Colors.blue // Цвет кнопки при нажатии
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PasswordRecoveryScreen()),
                  );
                },
                child: Text(
                  'восстановление данных',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Inter-Medium',
                  ),
                ),
              ),
            ),
          ),
    Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
    padding: const EdgeInsets.only(bottom: 80),
    child: TextButton(
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => AuthorizationScreen()),
    );
    },
    child: Text(
    'на главную',
    style: TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontFamily: 'Inter-Medium',
                  )
                )
              )
            )
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildWhiteTextField(hintText: 'Логин'),
        SizedBox(height: 20),
        buildWhiteTextField(hintText: 'Пароль', obscureText: true),
      ],
    );
  }

  //TODO: присвоить значения TextField к переменной _email и _password
  void _handleLogin() {
    Login loginHandler = Login(_email, _password);
    loginHandler.login().then((response) {
      print(response);
      // обработать ответ от сервера
    }).catchError((error) {
      print(error);
      // обработать ошибку
    });
  }
}