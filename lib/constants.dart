import 'package:flutter/material.dart';

class MedRecConstants {
  static const grad = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(27, 27, 27, 1),
      Color.fromRGBO(89, 7, 96, 1.0),
    ],
  );

  static const gradpurple = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 130, 224, 238),
      Color.fromARGB(255, 72, 141, 181),
      Color.fromARGB(255, 38, 106, 135),
    ],
  );
  static const gradpurpblack = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 27, 27, 27),
      Color.fromARGB(255, 72, 163, 181),
      Color.fromRGBO(135, 38, 87, 1),
    ],
  );

  static const accentColour = Color(0XFF79397E);
  static const appBarColor = Colors.black54;
  static const mainColor = Color.fromRGBO(42, 42, 42, 1);
  static const mainNavBarColor = Color.fromRGBO(54, 54, 54, 1);
  static const textColor = Colors.white70;
}
