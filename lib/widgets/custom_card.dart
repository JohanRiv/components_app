import 'package:flutter/material.dart';

import 'package:components_app/themes/themes.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const ListTile(
          title: Text('Titulo'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => {},
                child: const Text('Ok'),
                style: TextButton.styleFrom(
                  backgroundColor: DarkTheme.primaryBackground,
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () => {},
                child: const Text('Share'),
                style: TextButton.styleFrom(
                  backgroundColor: DarkTheme.primaryBackground,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
