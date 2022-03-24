import 'package:flutter/material.dart';

import 'package:components_app/models/models.dart';
import 'package:components_app/screens/screens.dart';

class AppRoutes {
  static final List<MenuOptionModel> menuOptions = [
    MenuOptionModel(
        screenName: 'Listview Screen',
        route: 'listview',
        screen: const ListviewScreen(),
        icon: Icons.list),
    MenuOptionModel(
        screenName: 'Listview Divider',
        route: 'listviewDivider',
        screen: const ListviewDividerScreen(),
        icon: Icons.list_alt),
    MenuOptionModel(
        screenName: 'Alert',
        route: 'alert',
        screen: const AlertScreen(),
        icon: Icons.notification_important),
    MenuOptionModel(
        screenName: 'Cards',
        route: 'card',
        screen: const CardScreen(),
        icon: Icons.card_membership),
    MenuOptionModel(
        screenName: 'Avatar',
        route: 'avatar',
        screen: const AvatarScreen(),
        icon: Icons.person),
    MenuOptionModel(
        screenName: 'Animated',
        route: 'animated',
        screen: const AnimatedScreen(),
        icon: Icons.play_circle),
  ];

  static const initialRoute = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (var item in menuOptions) {
      appRoutes.addAll({item.route: (BuildContext context) => item.screen});
    }

    return appRoutes;
  }
}
