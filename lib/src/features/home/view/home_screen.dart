import 'package:flutter/material.dart';
import 'package:news_app/src/core/helper/news_data.dart';
import 'package:news_app/src/features/article/view/article_screen.dart';
import 'package:news_app/src/features/category/veiw/category_screen.dart';
import 'package:news_app/src/features/home/logic/model/articles_model.dart';
import 'package:news_app/src/features/home/logic/model/category_model.dart';
import 'package:news_app/src/features/home/widget/custom_article_container.dart';
import 'package:news_app/src/features/home/widget/custom_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/helper/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> category = [];
  List<ArticlesModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    category = getCategories();
    super.initState();
    getNews();
  }

  getNews() async {
    NewsData newsData = NewsData();
    await newsData.getNews();
    articles = newsData.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          "assets/space-news.png",
          width: 250,
          height: 60,
          fit: BoxFit.fill,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                category: category[index].categoryName ?? "no"),
                          ));
                    },
                    child: CustomContainer(
                        imageUrl: category[index].imageUrl ?? "no image",
                        categoryName:
                            category[index].categoryName ?? "no name"),
                  );
                },
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            isLoading
                ? Center(heightFactor: 10,child: CircularProgressIndicator(),)
                : Expanded(
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
