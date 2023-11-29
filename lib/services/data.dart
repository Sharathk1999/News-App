import 'package:the_news_app/models/category_model.dart';




List<CategoryModel> getCategories(){
  List<CategoryModel> categories = [
    CategoryModel(categoryName: "Sports", image: "assets/images/sport.jpg"),
    CategoryModel(categoryName: "Science", image: "assets/images/science.jpg"),
    CategoryModel(categoryName: "Business", image: "assets/images/business.jpg"),
    CategoryModel(categoryName: "General", image: "assets/images/general.jpg"),
    CategoryModel(categoryName: "Entertainment", image: "assets/images/entertainment.jpg"),
  ];
  return categories;
}

