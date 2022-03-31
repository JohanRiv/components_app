import 'package:components_app/themes/themes.dart';
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

  bool isLoading = false; // Control de la carga

  double positionScroll = 0;
  double totalScroll = 0;

  @override
  // Carga el estado de un widget al inicio de la app, si se modifica algo dentro del initState, se debe hacer full restar
  void initState() {
    super.initState();
    // Adición de listener al listview
    scrollController.addListener(() {
      // Con scrollController.position.pixels se puede saber la posición actual del scroll
      // Con scrollController.position.maxScrollExtent se puede saber la posición final del scroll
      positionScroll = scrollController.position.pixels;
      totalScroll = scrollController.position.maxScrollExtent;
      if (positionScroll >= (totalScroll - 600)) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    addImagesListView();
    isLoading = false;
    setState(() {});
    if (positionScroll >= (totalScroll - 100)) {
      scrollController.animateTo(totalScroll + 100,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn);
      setState(() {});
    }
  }

  void addImagesListView() {
    final lastImageId = imagesId.last;
    imagesId.addAll([1, 2, 3, 4, 5].map((e) => lastImageId + e));
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
          child: Stack(
            children: [
              ListView.builder(
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
                          placeholder: const AssetImage(
                              'assets/images/gray_background.jpg'),
                          image: NetworkImage(
                              'https://picsum.photos/500/350?image=${imagesId[index]}')),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                },
              ),
              // Mostrar u ocultar un widget con un condicional
              if (isLoading)
                Positioned(
                    bottom: 40,
                    left: MediaQuery.of(context).size.width * 0.5 - 35,
                    child: const LoadingPanel())
            ],
          ),
        ));
  }
}

// Widget para mostrar un loading
class LoadingPanel extends StatelessWidget {
  const LoadingPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: DarkTheme.primaryBackground.withOpacity(0.9),
      ),
      child: const CircularProgressIndicator.adaptive(),
    );
  }
}
