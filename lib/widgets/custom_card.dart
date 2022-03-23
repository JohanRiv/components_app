import 'package:flutter/material.dart';

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
              ),
              const SizedBox(width: 10),
              TextButton(onPressed: () => {}, child: const Text('Share')),
            ],
          ),
        )
      ]),
    );
  }
}
