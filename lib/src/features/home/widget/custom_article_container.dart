import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/features/home/logic/model/articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomArticleContainer extends StatelessWidget {
  final String imageUrl, title, description;
final ArticlesModel? model;
  const CustomArticleContainer(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description, this.model, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 260,
              fit: BoxFit.fill,
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            description,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
