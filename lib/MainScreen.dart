import 'package:flutter/material.dart';

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
          child: _buildContent(), // Центральное содержимое экрана
        ),
      ),
    );
  }

  // Метод для создания градиента заднего фона
  BoxDecoration _buildBackgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple, Colors.blue], // Цвета градиента
        begin: Alignment.topLeft, // Начальное положение градиента
        end: Alignment.bottomRight, // Конечное положение градиента
      ),
    );
  }

  // Метод для построения центрального содержимого экрана
  Widget _buildContent() {
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
                  onPressed: () {}, // Обработчик нажатия на кнопку
                ),
                SizedBox(height: 20), // Промежуток между кнопками
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPressed = !_isPressed; // Изменение состояния при нажатии на кнопку
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
                  // Действие при нажатии на кнопку "продолжить без аккаунта"
                },
                child: Text(
                  'продолжить без аккаунта',
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
        height: 55,
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