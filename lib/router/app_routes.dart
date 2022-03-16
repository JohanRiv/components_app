import 'dart:js';

import 'package:flutter/material.dart';

import 'package:components_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'listview': (context) => const CardScreen(),
    'listViewDivider': (context) => const ListViewDividerScreen(),
    'alert': (context) => const AlertScreen(),
    'card': (context) => const CardScreen(),
    'home': (context) => const HomeScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
