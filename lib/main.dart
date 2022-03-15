import 'package:flutter/material.dart';

import 'package:components_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        'listview': (context) => const CardScreen(),
        'listViewDivider': (context) => const ListViewDividerScreen(),
        'alert': (context) => const AlertScreen(),
        'card': (context) => const CardScreen(),
        'home': (context) => const HomeScreen(),
      },
      initialRoute: 'home',
    );
  }
}
