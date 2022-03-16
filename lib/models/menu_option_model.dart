import 'package:flutter/material.dart';

class MenuOptionModel {
  final String route;
  final IconData icon;
  final String screenName;
  final Widget screen;

  MenuOptionModel({
    required this.screenName,
    required this.route,
    required this.screen,
    required this.icon,
  });
}
