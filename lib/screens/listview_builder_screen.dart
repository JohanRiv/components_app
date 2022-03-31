import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatefulWidget {
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {
  final List<int> imagesId = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController =
      ScrollController(); // Controlador del list view, permite saber el estado del mismo

  double positionScroll = 0;
  double totalScroll = 0;

  @override
  // Carga el estado de un widget al inicio de la app, si se modifica algo dentro del initState, se debe hacer full restar
  void initState() {
    super.initState();
    // Adición de listener al listview
    scrollController.addListener(() {
      positionScroll = scrollController.position.pixels;
      totalScroll = scrollController.position.maxScrollExtent;
      // Con scrollController.position.pixels se puede saber la posición actual del scroll
      // Con scrollController.position.maxScrollExtent se puede saber la posición final del scroll
      print('${positionScroll}, ${totalScroll}');
      if (positionScroll >= (totalScroll - 600)) {
        addImagesListView();
        setState(() {});
        print('Charge More');
      }
    });
  }

  void addImagesListView() {
    final lastImageId = imagesId.last;
    imagesId.addAll([1, 2, 3, 4, 5].map((e) => lastImageId + e));
    print(imagesId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listview Builder'),
        ),
        body:
            // Permite eliminar los espacios del notch o de algún área especifica del screen
            MediaQuery.removePadding(
          context: context, // Siempre se debe compartir el context
          removeTop: true, // Se remueve el padding superior
          removeBottom: true, // Remueve el padding inferior
          child: ListView.builder(
            physics:
                const BouncingScrollPhysics(), // Adiciona efectos nativos al scroll
            controller: scrollController,
            itemCount: imagesId.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  FadeInImage(
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                      placeholder:
                          const AssetImage('assets/images/gray_background.jpg'),
                      image: NetworkImage(
                          'https://picsum.photos/500/350?image=${imagesId[index]}')),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          ),
        ));
  }
}
