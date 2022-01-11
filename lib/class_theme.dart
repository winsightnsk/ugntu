
import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
  primaryColorLight: const Color.fromRGBO(19, 125, 95, 1.0),
  appBarTheme: const AppBarTheme(
    color: Color(0xFFbbbbbb)
  ),
  fontFamily: 'Georgia',
  splashColor: Colors.brown,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: Colors.lightGreen,
  ).copyWith(
    secondary: Colors.green,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.brown,
        fontFamily: 'gabriola',
      ),
    headline2: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.red,
      fontFamily: 'gabriola',
    ),
    bodyText1: TextStyle(
        fontSize: 26,
        color: Color.fromRGBO(0, 0, 0, 0.6),
        fontFamily: 'gabriola'
    ),
    bodyText2: TextStyle(
        fontSize: 25,
        color: Color.fromRGBO(0, 0, 0, 0.6),
        fontFamily: 'resphekt'
    ),
  ),
);