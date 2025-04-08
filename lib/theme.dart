import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(255, 116, 4, 4);
const Color lightGrey = Color.fromARGB(255, 225, 225, 225);

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      letterSpacing: 3,
    ),
  ),
);
