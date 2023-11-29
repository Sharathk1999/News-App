import 'package:flutter/material.dart';
import 'package:the_news_app/models/article_model.dart';
import 'package:the_news_app/models/slider_model.dart';
import 'package:the_news_app/services/news.dart';
import 'package:the_news_app/services/slider_data.dart';
import 'package:the_news_app/widgets/show_all_news.dart';

class AllNewsScreen extends StatefulWidget {
  final String news;
  const AllNewsScreen({
    super.key,
    required this.news,
  });

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  List<SliderModel> sliderItems = [];
  List<ArticleModel> articles = [];
  bool _isLoading = true;

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();

    getSliderNews();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _isLoading = false;
    });
  }

  getSliderNews() async {
    SliderNews sliderNews = SliderNews();
    await sliderNews.getSliderNews();
    sliderItems = sliderNews.sliderList;
   
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
          '${widget.news} News',
          style: const TextStyle(color: Colors.black, fontFamily: 'Hind'),
        ),
      ),
      body:_isLoading ? const Center(child: CircularProgressIndicator(),): Container(
        child: ListView.builder(
          itemCount:
              widget.news == "Breaking" ? sliderItems.length : articles.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return ShowAllNews(
              title: widget.news == "Breaking"
                  ? sliderItems[index].title!
                  : articles[index].title!,
              description: widget.news == "Breaking"
                  ? sliderItems[index].description!
                  : articles[index].description!,
              imgUrl: widget.news == "Breaking"
                  ? sliderItems[index].imgUrl!
                  : articles[index].imgUrl!,
              newsUrl: widget.news == "Breaking"
                  ? sliderItems[index].newsUrl!
                  : articles[index].newsUrl!,
            );
          },
        ),
      ),
    );
  }
}
