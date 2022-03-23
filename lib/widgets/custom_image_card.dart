import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final String imageUrl;
  final String? imageName;

  const CustomImageCard({Key? key, required this.imageUrl, this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 50,
      child: Column(children: [
        FadeInImage(
          image: NetworkImage(imageUrl),
          placeholder: const AssetImage('assets/images/gray_background.jpg'),
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 300),
        ),
        imageName == null
            ? Container()
            : Container(
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: imageName == null ? const Text('') : Text(imageName!),
                alignment: AlignmentDirectional.centerEnd,
              )
      ]),
    );
  }
}
