import 'package:flutter/material.dart';
import 'package:massenger/core/theme/text_theme.dart';

ThemeData lightTheme() {
  return ThemeData(
      fontFamily: 'GT Sectra Fine',
      brightness: Brightness.light,
      colorSchemeSeed: Colors.blue,
      textTheme: textTheme());
}
