import 'package:flutter/material.dart';

class LightTheme {
  static call() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: Colors.lightBlue,
    );
  }
}
