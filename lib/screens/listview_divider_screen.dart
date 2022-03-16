import 'package:flutter/material.dart';

class ListviewDividerScreen extends StatelessWidget {
  const ListviewDividerScreen({Key? key}) : super(key: key);

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
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(options[index]),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.indigo,
          ),
          onTap: () => {},
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
