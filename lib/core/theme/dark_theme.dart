import 'package:flutter/material.dart';
import 'package:massenger/core/theme/text_theme.dart';

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: 'GT Sectra Fine',
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.blue,
    textTheme: textTheme()
  );
}
