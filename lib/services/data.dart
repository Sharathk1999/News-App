import 'package:the_news_app/models/category_model.dart';


const String api = "4189d7a7e2254f4d8f3671e4010372b0";

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

