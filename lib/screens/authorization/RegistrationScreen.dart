import 'package:OtoWave/api/users/authorization/Register.dart';
import 'package:flutter/material.dart';
import '../../HomeScreen.dart';
import '/screens/templates/authorization.dart';
import 'AuthorizationScreen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  static int _userID = 0;
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkPasswordController = TextEditingController();
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
                SizedBox(height: 10),
                _buildForm(),
                SizedBox(height: 50),
                GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _isPressed = true;
                    });
                  },
                  onTapUp: (_) {
                    setState(() {
                      _isPressed = false;
                    });
                    _sendRegister();
                  },
                  onTapCancel: () {
                    setState(() {
                      _isPressed = false;
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
                        'Создать аккаунт',
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
              padding: const EdgeInsets.only(bottom: 20),
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
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildControllableWhiteTextField(hintText: 'Имя', controller: _nicknameController),
        SizedBox(height: 15),
        buildControllableWhiteTextField(hintText: 'Эл. почта', controller: _emailController),
        SizedBox(height: 15),
        buildControllableWhiteTextField(hintText: 'Пароль', controller: _passwordController),
        SizedBox(height: 15),
        buildControllableWhiteTextField(hintText: 'Повторить пароль', controller: _checkPasswordController),
      ],
    );
  }

  Future<void> _sendRegister() async {
    var _nickname = _nicknameController.text;
    var _email = _emailController.text;
    var _password = _passwordController.text;
    var _checkPassword = _checkPasswordController.text;

    Register registerHandler = Register(_nickname, _email, _password);
    Map<String, dynamic> response = await registerHandler.register();

    if (_password == _checkPassword)
      checkRegisterResponse(response);
    else
      _showErrorMessage('passwords are different');
  }

  void checkRegisterResponse(Map<String, dynamic> response) {
    if (response.containsKey('error')) {
      _showErrorMessage(response['error']);
    }
    else {
      _userID = int.parse(response['userID']);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()),
      );
    }
  }

  void _showErrorMessage(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $error')),
    );
  }

  static int getUserID() {
    return _userID;
  }
}





