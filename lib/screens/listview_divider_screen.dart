import 'package:flutter/material.dart';

class ListViewDividerScreen extends StatelessWidget {
  const ListViewDividerScreen({Key? key}) : super(key: key);

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
        title: const Text("Home List View Divider"),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(options[index]),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
