import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: const CircleAvatar(
              child: Text('PB'),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.nautiljon.com/images/perso/00/64/bojji_20546.jpg'),
              maxRadius: 110,
            ),
            Container(
              width: 220,
              height: 220,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(110)),
              child: const FadeInImage(
                image: NetworkImage(
                    'https://www.nautiljon.com/images/perso/00/64/bojji_20546.jpg'),
                placeholder: AssetImage('assets/images/gray_background.jpg'),
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 300),
              ),
              clipBehavior: Clip.antiAlias,
            )
          ],
        ),
      ),
    );
  }
}
