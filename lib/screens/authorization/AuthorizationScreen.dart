import 'package:flutter/material.dart';
import '/screens/templates/BackgroundGradient.dart';
import 'LoginScreen.dart';
import 'RegistrationScreen.dart';

class AuthorizationScreen extends StatefulWidget {
  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  bool _isHovered = false; // Флаг, определяющий наведен ли указатель мыши на кнопку
  bool _isPressed = false; // Флаг, определяющий нажата ли кнопка

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Background.buildBackgroundGradient(), // Задний фон с градиентом
        child: Center(
          child: _buildContent(context), // Центральное содержимое экрана
        ),
      ),
    );
  }

  // Метод для построения центрального содержимого экрана
  Widget _buildContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,// Ширина контейнера
      height: MediaQuery.of(context).size.height / 1.6, // Высота контейнера
      decoration: BoxDecoration(
        color: Color.fromRGBO(27, 24, 24, 1.0), // Цвет фона контейнера
        borderRadius: BorderRadius.circular(20), // Скругление углов контейнера
      ),
      child: Stack(
        children: [
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Text(
              'OtoWave', // Заголовок
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, // Цвет текста
                fontSize: 20, // Размер текста
                fontFamily: 'Inter-Medium', // Шрифт текста
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  text: 'Регистрация', // Текст на кнопке
                  color: Colors.blue, // Цвет кнопки
                  textColor: Colors.white, // Цвет текста на кнопке
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen()),
                    );
                  },
                ),
                SizedBox(height: 20), // Промежуток между кнопками
                GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _isPressed = true; // Устанавливаем состояние _isPressed в true при нажатии
                    });
                  },
                  onTapUp: (_) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
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
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: MediaQuery.of(context).size.width / 1.5,
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
        ],
      ),
    );
  }

  // Метод для построения кнопок
  Widget _buildButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 51,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 17,
              fontFamily: 'Inter-Medium',
            ),
          ),
        ),
      ),
    );
  }
}