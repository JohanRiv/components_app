import 'package:flutter/material.dart';

import 'package:components_app/themes/themes.dart';
import 'package:components_app/router/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: DarkTheme.darkTheme,
    );
  }
}
