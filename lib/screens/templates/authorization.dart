import 'package:flutter/material.dart';

BoxDecoration buildBackgroundGradient() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromRGBO(106, 17, 203, 1.0), Colors.black],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}

Widget buildWhiteTextField({required String hintText, bool obscureText = false}) {
  return Container(
    width: 253,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    ),
  );
}