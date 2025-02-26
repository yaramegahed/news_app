import 'package:news_app/src/features/home/logic/model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  category.add(CategoryModel(
    categoryName: "Business",
    imageUrl:
    "https://th.bing.com/th/id/R.0db5fbc8948ad3196c048440fb87ac9b?rik=WtlAiLJF1TIcPA&pid=ImgRaw&r=0",
  ));

  category.add(CategoryModel(
    categoryName: "Entertainment",
    imageUrl:
    "https://th.bing.com/th/id/R.0ba5c26ea86b3327024289a7bc01ea57?rik=ourG%2fC%2fIFwC9tw&pid=ImgRaw&r=0",
  ));

  category.add(CategoryModel(
    categoryName: "Sports",
    imageUrl:
    "https://th.bing.com/th/id/R.750257cb481717a13a8fa74938ddc5f6?rik=DC4FKTGIbak%2fPQ&pid=ImgRaw&r=0",
  ));

  category.add(CategoryModel(
    categoryName: "Health",
    imageUrl:
    "https://th.bing.com/th/id/OIP.OpWktJnxCm3H4f6wPu7d0gHaGt?rs=1&pid=ImgDetMain",
  ));

  category.add(CategoryModel(
    categoryName: "Technology",
    imageUrl:
    "https://th.bing.com/th/id/OIP.Q21olFRQVoMKZfIOWWe5cQHaE8?rs=1&pid=ImgDetMain",
  ));

  return category;
}
