import 'package:flutter/material.dart';

class DarkTheme {
  static final Color primary = Colors.green.shade900;
  static final Color secundary = Colors.lightGreenAccent.shade400;
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primary,
      appBarTheme: AppBarTheme(color: primary),
      iconTheme: IconThemeData(color: secundary),
      scaffoldBackgroundColor: Colors.black87);
}
