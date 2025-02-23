import 'package:flutter/material.dart';

class SearchResualtsTile extends StatelessWidget {
  final String title;
  final String? imagePath;
  final String description;
  const SearchResualtsTile(
      {super.key,
      required this.title,
      required this.description,
      this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 600,
      margin: EdgeInsets.all(5),
      child: ListTile(
        shape: Border.all(
          color: Colors.grey.shade400,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imagePath != null
                ? FadeInImage.assetNetwork(
                    placeholder: "assets/icon/logo.png",
                    image: imagePath!,
                    fit: BoxFit.contain,
                  )
                : Image.asset("assets/planelogo.png"),
          ],
        ),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
