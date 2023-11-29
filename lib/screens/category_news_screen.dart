import 'package:flutter/material.dart';
import 'package:the_news_app/models/show_category_model.dart';
import 'package:the_news_app/services/show_category_data.dart';
import 'package:the_news_app/utils/dot_loader_widget.dart';
import 'package:the_news_app/widgets/show_category_widget.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String name;
  const CategoryNewsScreen({super.key, required this.name});

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  List<ShowCategoryModel> categoryList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getShowCategoryNews(widget.name.toLowerCase());
    categoryList = showCategoryNews.categoryList;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.redAccent,
          ),
        ),
        title: Text(
          widget.name,
          style: const TextStyle(color: Colors.black, fontFamily: 'Hind'),
        ),
      ),
      body: _isLoading
          ? const LoaderWidget()
          : ListView.builder(
            itemCount: categoryList.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return ShowCategoryWidget(
                imgUrl: categoryList[index].imgUrl!,
                description: categoryList[index].description!,
                title: categoryList[index].title!,
                newsUrl: categoryList[index].newsUrl!,
              );
            },
          ),
    );
  }
}
