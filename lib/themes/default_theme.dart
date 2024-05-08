import 'package:flutter/material.dart';

class DefaultTheme {
  static const Color primary = Colors.red;
  static final Color primaryHover = Colors.red.shade600;

  static final ThemeData defaultTheme = ThemeData.light().copyWith(
      primaryColor: Colors.greenAccent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red, foregroundColor: Colors.red),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: primary, foregroundColor: Colors.white)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, foregroundColor: primary)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, foregroundColor: Colors.white),
      listTileTheme: const ListTileThemeData(iconColor: primary),
      switchTheme: SwitchThemeData(),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primary),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primary)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primary)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.greenAccent,
      appBarTheme: const AppBarTheme(backgroundColor: primary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: primary, foregroundColor: Colors.white)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent, foregroundColor: primary)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, foregroundColor: Colors.white),
      listTileTheme: const ListTileThemeData(iconColor: primary));
}
