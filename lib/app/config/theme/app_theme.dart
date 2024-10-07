import 'package:flutter/material.dart';

/// all custom application theme
class AppTheme {
  /// default application theme
  static ThemeData get basic => ThemeData(
        primarySwatch: Colors.blue,
      );

  // you can add other custom theme in this class like  light theme, dark theme ,etc.
  static Color appPrimaryColor = const Color(0xffF33F41);
  static Color appSecondaryColor = const Color(0xffFB6D72);
}
