import 'package:flutter/material.dart';
import 'package:news_app/src/core/helper/news_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/logic/model/articles_model.dart';
import '../../home/widget/custom_article_container.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ArticlesModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  getCategory() async {
    CategoryNew newsData = CategoryNew();
    await newsData.getCategory(category: widget.category);
    articles = newsData.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/space-news.png",
          width: 200,
          height: 90,
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(),heightFactor: 50,)
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              final Uri uri = Uri.parse(
                                  articles[index].url ?? "https://google.com");

                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                debugPrint(
                                    " Could not launch ${articles[index].url}");
                              }
                            },
                            child: CustomArticleContainer(
                              imageUrl:
                                  articles[index].urlToImage ?? "no image",
                              title: articles[index].title ?? "no title",
                              description:
                                  articles[index].description ?? "no des",
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: articles.length),
                  )
                ],
              ),
            ),
    );
  }
}
