import 'package:flutter/material.dart';

var lightPrimaryColor = const Color(0xFF9775FA);
var lightSecondaryColor = const Color(0xFFFF7043);

var errorColor = const Color(0xFFFF5757);

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: lightPrimaryColor, // focus
    onPrimary: Colors.white,
    background: lightPrimaryColor,
    onBackground: Colors.white,
    secondary: lightSecondaryColor, //float action button
    onSecondary: Colors.white,
    error: errorColor,
    onError: Colors.white,
    surface: lightPrimaryColor, // AppBar
    onSurface: lightSecondaryColor, //icons, inputs
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      elevation: 0,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: lightPrimaryColor,
  ),
);
