import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  final options = const [
    "Full Methal Alchemist",
    "Code Geass",
    "Kimetsu No Yaiba",
    "Clannad",
    "Angel Beats",
    "Horimiya"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home List View"),
      ),
      body: ListView(
        children: [
          ...options
              .map((e) => ListTile(
                    title: Text(e),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
