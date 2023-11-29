import 'package:the_news_app/models/category_model.dart';
import 'package:the_news_app/models/slider_model.dart';

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

List<SliderModel> getSliderItems(){
  List<SliderModel> sliderItems = [
   SliderModel(name: "Woman undergoing Agniveer training dies by suicide at Navy hostel in Mumbai", image: "assets/images/news-bg.jpg"),
   SliderModel(name: "Shinde govt stable, enjoys majority support: Speaker", image: "assets/images/news-bg.jpg"),
   SliderModel(name: "Worker falls to death from 14 floors; FIR on 2 for negligence", image: "assets/images/news-bg.jpg"),
   SliderModel(name: "Man ill-treating mother should leave her flat, Bombay HC upholds order", image: "assets/images/news-bg.jpg"),
   SliderModel(name: "Mumbai banking on all-Indian squad in bid to end losing run", image: "assets/images/news-bg.jpg"),
  ];
  return sliderItems;
}