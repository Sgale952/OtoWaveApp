import 'package:OtoWave/LogInScreen.dart';
import 'package:OtoWave/RegistrationScreen.dart';
import 'package:flutter/material.dart';
 // Импортируем экран регистрации

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isHovered = false; // Флаг, определяющий наведен ли указатель мыши на кнопку
  bool _isPressed = false; // Флаг, определяющий нажата ли кнопка

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildBackgroundGradient(), // Задний фон с градиентом
        child: Center(
          child: _buildContent(context), // Центральное содержимое экрана
        ),
      ),
    );
  }



  // Метод для создания градиента заднего фона
  BoxDecoration _buildBackgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromRGBO(106, 17, 203, 1.0), Colors.black],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  // Метод для построения центрального содержимого экрана
  Widget _buildContent(BuildContext context) {
    return Container(
      width: 344, // Ширина контейнера
      height: 581, // Высота контейнера
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
                fontSize: 30, // Размер текста
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
                        MaterialPageRoute(builder: (context) => LogInScreen()),
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
        width: 263,
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