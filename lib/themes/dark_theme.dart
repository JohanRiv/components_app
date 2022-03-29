import 'package:flutter/material.dart';

class DarkTheme {
  static final Color primary = Colors.green.shade900;
  static final Color secundary = Colors.lightGreenAccent.shade400;
  static final Color primaryBackground = Colors.grey.shade700;
  static final Color secondaryBackground = Colors.grey.shade300;

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primary,
      appBarTheme: AppBarTheme(color: primary),
      iconTheme: IconThemeData(color: secundary),
      scaffoldBackgroundColor: Colors.black87,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        primary: secundary,
      )),
      dialogTheme: DialogTheme(
          backgroundColor: primaryBackground,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: secundary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: primary,
            shape: const StadiumBorder(),
            textStyle: TextStyle(
                foreground: Paint()..color = Colors.white, fontSize: 18)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: secundary),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secundary),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        iconColor: primary,
      ));
}
