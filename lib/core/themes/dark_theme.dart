import 'package:flutter/material.dart';

class DarkTheme {
  static call() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.brown,
    );
  }
}
