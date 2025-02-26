
import 'package:dio/dio.dart';
import 'package:news_app/src/features/home/logic/model/articles_model.dart';

class NewsData {
  Dio dio = Dio();
  List<ArticlesModel> news = [];

  Future<void> getNews() async {
    var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=fb0a24bf678b4170b180b2da985aa135");
    if (response.statusCode == 200) {
      var data = response.data;
      data["articles"].forEach((element) {
        if (element["description"] != null && element["urlToImage"] != null) {
          ArticlesModel model = ArticlesModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"]);
          news.add(model);
        }
      });
    } else {
      throw Exception("fail");
    }
  }
}

class CategoryNew {
  Dio dio = Dio();
  List<ArticlesModel> news = [];

  Future<void> getCategory({required String category}) async {
    var response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=fb0a24bf678b4170b180b2da985aa135");
    if (response.statusCode == 200) {
      var data = response.data;
      data["articles"].forEach((element) {
        if (element["description"] != null && element["urlToImage"] != null) {
          ArticlesModel model = ArticlesModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"]);
          news.add(model);
        }
      });
    } else {
      throw Exception("fail");
    }
  }
}
