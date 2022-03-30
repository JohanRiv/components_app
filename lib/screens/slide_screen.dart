import 'package:components_app/themes/themes.dart';
import 'package:flutter/material.dart';

class SlideScreen extends StatefulWidget {
  const SlideScreen({Key? key}) : super(key: key);

  @override
  State<SlideScreen> createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  double _sliderValue = 100;
  bool _enableCheck = true;
  final GlobalKey<FormState> sliderKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Slider.adaptive(
            key: sliderKey,
            value: _sliderValue,
            inactiveColor: Colors.grey,
            activeColor: DarkTheme.primary,
            onChanged: (value) {
              _enableCheck == true
                  ? setState(() {
                      _sliderValue = value;
                    })
                  : null;
            },
            max: 380,
            min: 100,
          ),
          Checkbox(
              value: _enableCheck,
              onChanged: (value) {
                setState(() {
                  _enableCheck = value!;
                });
              }),
          CheckboxListTile(
              title: const Text('Habilitar Slide'),
              activeColor: DarkTheme.primary,
              value: _enableCheck,
              onChanged: (value) => setState(() {
                    _enableCheck = value!;
                  })),
          const SizedBox(height: 20),
          Switch(
              value: _enableCheck,
              onChanged: (value) => setState(() {
                    _enableCheck = value;
                  })),
          SwitchListTile.adaptive(
              title: const Text('Habilitar Slide'),
              activeColor: DarkTheme.primary,
              value: _enableCheck,
              onChanged: (value) => setState(() {
                    _enableCheck = value;
                  })),
          const SizedBox(height: 20),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    'https://w0.peakpx.com/wallpaper/885/70/HD-wallpaper-anime-ranking-of-kings-bojji-ranking-of-kings.jpg'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
