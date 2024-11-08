import 'package:flutter/material.dart';

final inputDecorationThemeBorderRadius = BorderRadius.circular(9);
ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color.fromRGBO(244, 246, 250, 1),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    color: Colors.transparent,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
    shape: CircularNotchedRectangle(),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color.fromARGB(153, 225, 222, 230),
    focusColor: const Color.fromARGB(153, 225, 222, 230),
    hoverColor: const Color.fromARGB(153, 225, 222, 230),
    border: OutlineInputBorder(
      borderRadius: inputDecorationThemeBorderRadius,
      borderSide: const BorderSide(
        color: Color.fromARGB(153, 225, 222, 230),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: inputDecorationThemeBorderRadius,
      borderSide: const BorderSide(
        color: Color.fromARGB(153, 243, 182, 172),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: inputDecorationThemeBorderRadius,
      borderSide: const BorderSide(
        color: Color.fromARGB(153, 225, 222, 230),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: inputDecorationThemeBorderRadius,
      borderSide: const BorderSide(
        color: Color.fromARGB(153, 225, 222, 230),
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: inputDecorationThemeBorderRadius,
      borderSide: const BorderSide(
        color: Color.fromARGB(153, 225, 222, 230),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: inputDecorationThemeBorderRadius,
      borderSide: const BorderSide(
        color: Color(0x99EFF0F8),
      ),
    ),
  ),
);
