import 'dart:io';

import 'package:components_app/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Alert'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Alerta screen default'),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: const Text('Ok')),
                TextButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: const Text('Cancel'))
              ],
            ));
  }

  void displayDialogIos(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('Alert'),
              content: Column(children: const [
                Text('Alerta screen default'),
              ]),
              actions: [
                TextButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: const Text('Ok')),
                TextButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: const Text('Cancel'),
                    style: TextButton.styleFrom(
                      backgroundColor: null,
                      textStyle:
                          TextStyle(foreground: Paint()..color = Colors.red),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Platform.isAndroid
                  ? displayDialogAndroid(context)
                  : displayDialogIos(context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text('Mostrar Alerta'),
            )),
      ),
    );
  }
}
