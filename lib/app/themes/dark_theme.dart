import 'package:flutter/material.dart';

var darkPrimaryColor = const Color(0xFF9775FA);
var darkSecondaryColor = const Color(0xFFFF7043);

var errorColor = const Color(0xFFFF5757);

ThemeData darkTheme = ThemeData(
  canvasColor: const Color(0xFF222E34),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: darkPrimaryColor, // focus
    onPrimary: Colors.white,
    background: darkPrimaryColor,
    onBackground: Colors.white,
    secondary: darkSecondaryColor, //float action button
    onSecondary: Colors.white,
    error: errorColor,
    onError: Colors.white,
    surface: darkPrimaryColor, // AppBar
    onSurface: darkSecondaryColor, //icons, inputs
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
    foregroundColor: darkPrimaryColor,
  ),
);
