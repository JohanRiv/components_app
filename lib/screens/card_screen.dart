import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card View'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: const [
            CustomCard(),
            CustomCard(),
            CustomCard(),
            CustomImageCard(
                imageUrl:
                    'https://lh3.googleusercontent.com/pNKOucw9LP44ZwuUQGC1kpuLSm35tx9X19iaiytfMW3iSz-veYMVVIiegj592SqV-xmqLhnu6-fHyMD7b4hGjyepDQ0=w640-h400-e365-rj-sc0x00ffffff'),
            CustomImageCard(
                imageUrl:
                    'https://chiledescentralizado.cl/wp-content/uploads/2016/03/landscape-04.jpg',
                imageName: 'Trostlandia'),
            CustomImageCard(
                imageUrl:
                    'https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg'),
          ],
        ));
  }
}
