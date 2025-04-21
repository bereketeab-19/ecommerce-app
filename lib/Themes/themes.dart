import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade400,
    primary: Colors.grey.shade300,
    onPrimary: Colors.black, // primary text color
    secondary: Colors.grey.shade100,
    onSecondary: Colors.black38, // Secondary text color
    inversePrimary: Colors.grey.shade700,
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    onPrimary: Colors.white, // primary text color
    secondary: Colors.grey.shade600,
    onSecondary: Colors.white38, // Secondary text color
  ),
);
