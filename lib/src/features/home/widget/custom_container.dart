import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String imageUrl, categoryName;

  const CustomContainer(
      {super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            height: 140,
            width: 200,
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Container(
            height: 140,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: Colors.black26),
            child: Text(
              categoryName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ))
      ]),
    );
  }
}
