import 'package:flutter/material.dart';
import '/screens/templates/authorization.dart';
import 'AuthorizationScreen.dart';

class PasswordChangeScreen extends StatefulWidget {
  @override
  _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
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
              top: 75,
              left: 20,
              right: 20,
              child: Text(
                'Создайте новый пароль\nдля учетной записи',
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
                  SizedBox(height: 10,),
                  _buildForm(),
                  SizedBox(height: 45,),
                  GestureDetector(
                    onTapDown: (_) {
                      setState(() {
                        _isPressed = true; // Устанавливаем состояние _isPressed в true при нажатии
                      });
                    },
                    onTapUp: (_) {
                      /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    ); */
                      setState(() {
                        _isPressed = false; // Устанавливаем состояние _isPressed в false при отпускании
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _isPressed = false; // Сбрасываем состояние _isPressed при отмене нажатия
                      });
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
                padding: const EdgeInsets.only(bottom: 50),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthorizationScreen()),
                    );
                  },
                  child: Text(
                    'На главную',
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
        )
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildWhiteTextField(hintText: 'Пароль'),
        SizedBox(height: 20),
        buildWhiteTextField(hintText: 'Повторить пароль', obscureText: true),
        SizedBox(height: 35),
      ],
    );
  }
}


