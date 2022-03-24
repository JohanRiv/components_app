import 'dart:math';
import 'package:flutter/material.dart';

import 'package:components_app/themes/themes.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 110;
  double _height = 110;
  Color _color = DarkTheme.primary;
  BorderRadius borderRadius = BorderRadius.circular(100);

  void animation() {
    final random = Random();
    _width = random.nextInt(110) + 10;
    _height = random.nextInt(110) + 10;
    _color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInCirc,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            animation();
          })
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
